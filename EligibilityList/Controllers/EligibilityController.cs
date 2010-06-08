using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using EligibilityList.Helpers;
using UCDArch.Web.Controller;
using EligibilityList.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using EligibilityListBLL;
using UCDArch.Web.Helpers;
using Action=EligibilityList.Core.Domain.Action;
using MvcContrib;
using EligibilityList.Core.Queries;

namespace EligibilityList.Controllers
{
    /// <summary>
    /// Eligibility list controller
    /// </summary>
    [AnyoneWithRole]
    public class EligibilityController : SuperController
    {
        private readonly IRepository<Eligibility> _eligibilityRepository;
        private readonly IRepository<EligibilityListQuery> _eligibilityListQueryRepository;
        private readonly IUserBLL _userBLL;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eligibilityRepository"></param>
        /// <param name="eligibilityListQueryRepository"></param>
        /// <param name="userBLL"></param>
        public EligibilityController(IRepository<Eligibility> eligibilityRepository, IRepository<EligibilityListQuery> eligibilityListQueryRepository, IUserBLL userBLL)
        {
            _eligibilityRepository = eligibilityRepository;
            _eligibilityListQueryRepository = eligibilityListQueryRepository;
            _userBLL = userBLL;
        }

        /// <summary>
        /// Should just redirect back to the main homepage
        /// </summary>
        public RedirectToRouteResult Index()
        {
            return RedirectToAction("ViewPending", "Eligibility");
        }

        [AdminOnly]
        public ActionResult FindEmployee(string id /* Payroll Department Code */)
        {
            var viewModel = FindEmployeeViewModel.Create(Repository, _userBLL.GetUnitsByUser(CurrentUser), id);

            if (string.IsNullOrEmpty(id))
            {
                Message = "You Must Select a Department";
            }
            else
            {
                Message = string.Empty;

                var employees =
                    Repository.OfType<PayrollPerson>().Queryable.Where(x => x.Department == id).OrderBy(x => x.Name);

                viewModel.PayrollPersons = employees.ToList();
            }

            return View(viewModel);
        }

        public ActionResult Details(int id)
        {
            var el = _eligibilityRepository.GetNullableById(id);

            if (el == null)
            {
                Message = "Eligibility Not Found";
                return RedirectToAction("Index");
            }

            return View(el);
        }

        public ActionResult Testing()
        {
            var els = Repository.OfType<EligibilityListQuery>().Queryable;

            els = els.Where(x=>x.HasOriginalEligibility && x.FisCode == "AENT");

            els.ToList();

            return Content("Testing");
        }
        
        /// <summary>
        /// Return a list of all eligible faculty appointments
        /// </summary>
        /// <returns></returns>
        public ActionResult ViewByDepartment(string id /*FIS*/)
        {
            var userUnits = _userBLL.GetUnitsByUser(CurrentUser).ToList();
            var unitFisCodes = userUnits.Select(x => x.FISCode).ToList();
            
            var eligibilities = _eligibilityListQueryRepository.Queryable;

            //If an FIS id was passed and the user has that FISCode in their units list
            if (!string.IsNullOrEmpty(id) && unitFisCodes.Contains(id))
            {
                eligibilities = eligibilities.Where(x=>x.FisCode == id);
            }
            else //else just get all ELs that are assoc. with their unit list
            {
                eligibilities = eligibilities.Where(x => unitFisCodes.Contains(x.FisCode));
            }

            var viewModel = ViewByDepartmentViewModel.Create(Repository, userUnits, id);

            viewModel.Eligibilities = eligibilities;

            return View(viewModel);
        }

        public ActionResult ViewPending(string id)
        {
            var userUnits = _userBLL.GetUnitsByUser(CurrentUser).ToList();
            var unitFisCodes = userUnits.Select(x => x.FISCode).ToList();

            var eligibilities = _eligibilityListQueryRepository.Queryable.Where(x => x.HasOriginalEligibility /*Only get the ones which modify other ELs*/);

            //If an FIS id was passed and the user has that FISCode in their units list
            if (!string.IsNullOrEmpty(id) && unitFisCodes.Contains(id))
            {
                eligibilities = eligibilities.Where(x => x.FisCode == id);
            }
            else //else just get all ELs that are assoc. with their unit list
            {
                eligibilities = eligibilities.Where(x => unitFisCodes.Contains(x.FisCode));
            }

            var viewModel = ViewByDepartmentViewModel.Create(Repository, userUnits, id);

            viewModel.Eligibilities = eligibilities;

            return View(viewModel);
        }
        
        public ActionResult Edit(int id)
        {
            var el = _eligibilityRepository.GetNullableById(id);

            if (el == null)
            {
                Message = "Eligibility Not Found";
                return RedirectToAction("Index");
            }

            //If this eligibility is being modified somewhere, you should be editing that instead
            var editingEligibilityList = _eligibilityRepository.Queryable.Where(x => x.OriginalEligibility.Id == id).SingleOrDefault();

            if (editingEligibilityList != null)
            {
                return this.RedirectToAction(a => a.Edit(editingEligibilityList.Id));
            }

            var viewModel = EligibilityModifyViewModel.Create(Repository, _userBLL);
            viewModel.Eligibility = el;
            viewModel.AllowDelete = el.OriginalEligibility == null && !_eligibilityRepository.Queryable.Where(a => a.OriginalEligibility == el).Any();

            return View(viewModel);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Eligibility eligibility, bool hasOriginalEligibility, bool updateAllAppointments)
        {
            var userIsAdmin = CurrentUser.IsInRole(RoleNames.Admin);

            var eligibilityToEdit = new Eligibility();

            if (hasOriginalEligibility || userIsAdmin)
            {
                //If the user is an admin or this is an adjustment eligibility, just overwrite this given eligibility
                eligibilityToEdit = _eligibilityRepository.GetNullableById(id);
                Check.Require(eligibilityToEdit != null);
            }
            else
            {
                //We don't have an original eligibility, need to create one for this id
                eligibilityToEdit.OriginalEligibility = _eligibilityRepository.GetById(id);
            }   

            CopyHelper.TransferValuesTo(eligibility, eligibilityToEdit);

            //Transfer the analyst and dean manually based on the kerberos choice
            eligibilityToEdit.Analyst = _userBLL.GetByLogin(eligibility.AnalystKerb);
            eligibilityToEdit.Dean = _userBLL.GetByLogin(eligibility.DeanKerb);

            eligibilityToEdit.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                eligibilityToEdit.LastUpdated = DateTime.Now;
                eligibilityToEdit.Editor = _userBLL.GetCurrentUser(CurrentUser);

                _eligibilityRepository.EnsurePersistent(eligibilityToEdit);

                if (updateAllAppointments && userIsAdmin)
                {
                    //Update all of the original appointments for this employee
                    UpdateAllAppointments(eligibilityToEdit);
                }

                Message = "Eligibility Saved Successfully";

                return RedirectToAction("Index", "Home");
            }

            var viewModel = EligibilityModifyViewModel.Create(Repository, _userBLL);
            viewModel.Eligibility = eligibility;

            return View(viewModel);
        }

        private void UpdateAllAppointments(Eligibility eligibility)
        {
            //Get all original appointments for this employee
            var els = _eligibilityRepository.Queryable.Where(x => x.OriginalEligibility == null && x.Employee.Id == eligibility.Employee.Id);

            foreach (var el in els)
            {
                //copy of the values to be changed, then update
                if (el.Id != eligibility.Id)
                {
                    CopyHelper.TransferAppointmentValuesTo(eligibility, el);

                    _eligibilityRepository.EnsurePersistent(el);
                }
            }
        }

        [AdminOnly]
        public ActionResult Add(string id, string titleCode, string department)
        {
            var employee = Repository.OfType<Employee>().Queryable.Where(x => x.Id == id).SingleOrDefault();
            var title = Repository.OfType<Title>().Queryable.Where(x => x.Id == titleCode).FirstOrDefault() ?? new Title();
            var dept = Repository.OfType<Unit>().Queryable.Where(x => x.PPSCode == department).FirstOrDefault() ?? new Unit();
            
            if (employee == null)
            {
                Message = string.Format("Employee with Id {0} not found", id);

                return this.RedirectToAction<HomeController>(x => x.Index());
            }

            var viewModel = EligibilityModifyViewModel.Create(Repository, _userBLL);

            viewModel.Eligibility = new Eligibility
                                        {Employee = employee, CurrentTitle = title, ProposedTitle = title, Unit = dept };


            return View(viewModel);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [AdminOnly]
        public ActionResult Add(int id, Eligibility eligibility)
        {
            var eligibilityToEdit = new Eligibility();
            
            CopyHelper.TransferValuesTo(eligibility, eligibilityToEdit);

            eligibilityToEdit.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                eligibilityToEdit.LastUpdated = DateTime.Now;

                _eligibilityRepository.EnsurePersistent(eligibilityToEdit);

                Message = "Eligibility Saved Successfully";

                return RedirectToAction("Index", "Home");
            }

            var viewModel = EligibilityModifyViewModel.Create(Repository, _userBLL);
            viewModel.Eligibility = eligibility;

            return View(viewModel);
        }

        public ActionResult Delete(int id)
        {
            var el = _eligibilityRepository.GetNullableById(id);

            if (el == null)
            {
                Message = "Eligibility Not Found";
                return RedirectToAction("Index");
            }

            if (el.OriginalEligibility != null || _eligibilityRepository.Queryable.Where(a=>a.OriginalEligibility == el).Any())
            {
                return this.RedirectToAction(a => a.Edit(id));
            }
            
            return View(el);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteEligibility(int id)
        {
            var el = _eligibilityRepository.GetNullableById(id);

            if (el == null)
            {
                Message = "Eligibility Not Found";
                return RedirectToAction("Index");
            }

            _eligibilityRepository.Remove(el);

            Message = "Eligibility was deleted.";
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Returns current user
        /// </summary>
        /// <remarks>
        /// TODO: Move into UserBLL
        /// TODO: Map user class to DB
        /// </remarks>
        /// <returns></returns>
        protected User GetCurrentUser()
        {
            Check.Require(CurrentUser.Identity.IsAuthenticated, "User must be authenticated");

            var user =
                Repository.OfType<User>().Queryable.Where(x => x.Login == CurrentUser.Identity.Name).SingleOrDefault();

            Check.Require(user != null, "Current user not found in Catbert");

            return user;
        }
    }

    public class EligibilityModifyViewModel
    {
        public static EligibilityModifyViewModel Create(IRepository repository, IUserBLL userBLL)
        {
            var viewModel = new EligibilityModifyViewModel
                                {
                                    Actions = repository.OfType<Action>().Queryable.Where(x => x.Inactive == false).ToList(),
                                    Committees = repository.OfType<Committee>().Queryable.Where(x => x.Inactive == false).ToList(),
                                    Units = repository.OfType<Unit>().Queryable.ToList(),
                                    Titles = repository.OfType<Title>().Queryable.ToList(),
                                    Steps = repository.OfType<Step>().Queryable.Where(x=>x.Inactive == false).ToList(),
                                    Deans = userBLL.GetUsersInRole(RoleNames.Dean),
                                    Analysts = userBLL.GetUsersInRole(RoleNames.Admin)
                                };

            return viewModel;
        }

        public IEnumerable<Action> Actions { get; set; }
        public IEnumerable<Committee> Committees { get; set; }
        public IEnumerable<Unit> Units { get; set; }
        public IEnumerable<Title> Titles { get; set; }
        public IEnumerable<Step> Steps { get; set; }
        public IDictionary<string, string> Deans { get; set; }
        public IDictionary<string, string> Analysts { get; set; }

        public Eligibility Eligibility { get; set; }

        public bool AllowDelete { get; set; }
    }

    public class ViewByDepartmentViewModel
    {
        public static ViewByDepartmentViewModel Create(IRepository repository, IEnumerable<Unit> userUnits, string fisCode)
        {
            var viewModel = new ViewByDepartmentViewModel
                                {
                                    Units = userUnits.ToList(),
                                    Unit =
                                        repository.OfType<Unit>().Queryable.Where(x => x.FISCode == fisCode).
                                        SingleOrDefault()
                                };

            return viewModel;
        }

        public IEnumerable<Unit> Units { get; set; }
        public IEnumerable<EligibilityListQuery> Eligibilities { get; set; }

        public Unit Unit { get; set; }
    }


    public class FindEmployeeViewModel
    {
        public static FindEmployeeViewModel Create(IRepository repository, IEnumerable<Unit> userUnits, string payrollDepartmentCode)
        {
            var viewModel = new FindEmployeeViewModel
            {
                Units = userUnits.Where(x=>!string.IsNullOrEmpty(x.PPSCode)).ToList(),
                Unit =
                    repository.OfType<Unit>().Queryable.Where(x => x.PPSCode == payrollDepartmentCode).FirstOrDefault(),
                PayrollPersons = new List<PayrollPerson>()
            };

            return viewModel;
        }

        public IEnumerable<Unit> Units { get; set; }
        public IEnumerable<PayrollPerson> PayrollPersons { get; set; }

        public Unit Unit { get; set; }
    }
}
