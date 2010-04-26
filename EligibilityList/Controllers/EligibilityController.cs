using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using UCDArch.Web.Controller;
using EligibilityList.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using EligibilityListBLL;
using UCDArch.Web.Helpers;
using Action=EligibilityList.Core.Domain.Action;
using MvcContrib;
using System.Collections.Specialized;

namespace EligibilityList.Controllers
{
    /// <summary>
    /// Eligibility list controller
    /// </summary>
    [Authorize(Roles="Admin,User")]
    public class EligibilityController : SuperController
    {
        private readonly IRepository<Eligibility> _eligibilityRepository;
        private readonly IUserBLL _userBLL;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eligibilityRepository"></param>
        /// <param name="userBLL"></param>
        public EligibilityController(IRepository<Eligibility> eligibilityRepository, IUserBLL userBLL)
        {
            _eligibilityRepository = eligibilityRepository;
            _userBLL = userBLL;
        }

        public ViewResult Index()
        {
            return View();
        }

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
            var el = _eligibilityRepository.GetNullableByID(id);

            if (el == null)
            {
                Message = "Eligibility Not Found";
                return RedirectToAction("Index");
            }

            return View(el);
        }
        
        /// <summary>
        /// Return a list of all eligible faculty appointments
        /// </summary>
        /// <returns></returns>
        public ActionResult ViewByDepartment(string id /*FIS*/)
        {
            var eligibilities = _eligibilityRepository.Queryable;

            if (!string.IsNullOrEmpty(id))
            {
                eligibilities = eligibilities.Where(x=>x.Unit.FISCode == id);
            }

            var viewModel = ViewByDepartmentViewModel.Create(Repository, _userBLL.GetUnitsByUser(CurrentUser), id);

            viewModel.Eligibilities = eligibilities;

            return View(viewModel);
        }

        public ActionResult ViewPending(string id)
        {
            var eligibilities = _eligibilityRepository.Queryable.Where(x=>x.OriginalEligibility != null /*Only get the ones which modify other ELs*/);

            if (!string.IsNullOrEmpty(id))
            {
                eligibilities = eligibilities.Where(x => x.Unit.FISCode == id);
            }

            var viewModel = ViewByDepartmentViewModel.Create(Repository, _userBLL.GetUnitsByUser(CurrentUser), id);

            viewModel.Eligibilities = eligibilities;

            return View(viewModel);
        }
        
        public ActionResult Edit(int id)
        {
            var el = _eligibilityRepository.GetNullableByID(id);

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

            return View(viewModel);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Eligibility eligibility, bool hasOriginalEligibility)
        {
            var eligibilityToEdit = new Eligibility();

            if (hasOriginalEligibility)
            {
                //If there is an original, just grab this version out and we'll save over it
                eligibilityToEdit = _eligibilityRepository.GetNullableByID(id);
                Check.Require(eligibilityToEdit != null);
            }
            else
            {
                //We don't have an original eligibility, need to create one for this id
                eligibilityToEdit.OriginalEligibility = _eligibilityRepository.GetById(id);
            }

            TransferValuesTo(eligibility, eligibilityToEdit);

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

        private static void TransferValuesTo(Eligibility source, Eligibility destination)
        {
            destination.Employee = source.Employee;

            destination.Unit = source.Unit;
            destination.Action = source.Action;
            destination.Committee = source.Committee;
            destination.Dean = source.Dean;
            destination.Analyst = source.Analyst;
            destination.CurrentTitle = source.CurrentTitle;
            destination.CurrentStep = source.CurrentStep;
            destination.CurrentAppointmentPercent = source.CurrentAppointmentPercent;
            destination.CurrentBlankTitle = source.CurrentBlankTitle;
            destination.YearsAtRank = source.YearsAtRank;
            destination.YearsAtStep = source.YearsAtStep;

            destination.ProposedTitle = source.ProposedTitle;
            destination.ProposedStep = source.ProposedStep;
            destination.ProposedAppointmentPercent = source.ProposedAppointmentPercent;
            destination.ProposedBlankTitle = source.ProposedBlankTitle;

            destination.Defer = source.Defer;
            destination.YearsAccelerated = source.YearsAccelerated;
            destination.YearsDecelerated = source.YearsDecelerated;

            destination.DateDue = source.DateDue;
            destination.DateEffective = source.DateEffective;

            destination.Comment = source.Comment;
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
                                    Deans = userBLL.GetUsersInRole("Deans"),
                                    Analysts = userBLL.GetUsersInRole("Admin")
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
    }

    public class ViewByDepartmentViewModel
    {
        public static ViewByDepartmentViewModel Create(IRepository repository, IEnumerable<Unit> userUnits, string fisCode)
        {
            var viewModel = new ViewByDepartmentViewModel
                                {
                                    Units = userUnits,
                                    Unit =
                                        repository.OfType<Unit>().Queryable.Where(x => x.FISCode == fisCode).
                                        SingleOrDefault()
                                };

            return viewModel;
        }

        public IEnumerable<Unit> Units { get; set; }
        public IEnumerable<Eligibility> Eligibilities { get; set; }

        public Unit Unit { get; set; }
    }


    public class FindEmployeeViewModel
    {
        public static FindEmployeeViewModel Create(IRepository repository, IEnumerable<Unit> userUnits, string payrollDepartmentCode)
        {
            var viewModel = new FindEmployeeViewModel
            {
                Units = userUnits.Where(x=>!string.IsNullOrEmpty(x.PPSCode)),
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
