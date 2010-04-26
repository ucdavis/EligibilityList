using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using UCDArch.Web.Controller;
using EligibilityList.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using EligibilityListBLL;

namespace EligibilityList.Controllers
{
    /// <summary>
    /// Eligibility list controller
    /// </summary>
    [Authorize]
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

    public class ViewByDepartmentViewModel
    {
        public static ViewByDepartmentViewModel Create(IRepository repository, IEnumerable<Unit> userUnits, string FISCode)
        {
            var viewModel = new ViewByDepartmentViewModel
                                {
                                    Units = userUnits,
                                    Unit =
                                        repository.OfType<Unit>().Queryable.Where(x => x.FISCode == FISCode).
                                        SingleOrDefault()
                                };

            return viewModel;
        }

        public IEnumerable<Unit> Units { get; set; }
        public IEnumerable<Eligibility> Eligibilities { get; set; }
        public Unit Unit { get; set; }
    }
}
