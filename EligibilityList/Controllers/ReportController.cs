using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using EligibilityList.Helpers;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Controller;
using EligibilityList.Core.Domain;
using EligibilityListBLL;
using System.Security.Principal;

namespace EligibilityList.Controllers
{
    public class ReportController : SuperController
    {
        private readonly IReportBLL _reportBLL;
        private readonly IUserBLL _userBLL;

        public ReportController(IReportBLL reportBLL, IUserBLL userBLL)
        {
            _reportBLL = reportBLL;
            _userBLL = userBLL;
        }

        /// <summary>
        /// GET: /Report/
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EligibilityListReport()
        {
            var viewModel = ELReportViewModel.Create(Repository.OfType<Action>(), _userBLL, CurrentUser);
            
            return View(viewModel);
        }

        public ActionResult GetEligibilityListReport(string actionName, string fisCode)
        {
            bool canSeeFisCode = false;

            if (CurrentUser.IsInRole(RoleNames.Admin)) //an admin can always see any FISCode
            {
                canSeeFisCode = true;
            }
            else
            {
                //Make sure the user can see this FISCode
                canSeeFisCode = _userBLL.GetUnitsByUser(CurrentUser).Any(x => x.FISCode == fisCode);
            }

            if (!canSeeFisCode)
            {
                Message = "You can not view the selected unit.  Please make your selection again";
                return RedirectToAction("EligibilityListReport");
            }

            return _reportBLL.GenerateELReport(actionName, fisCode, ReportType.Excel).ToFileResult("ELReport.xls");
        }
    }

    public class ELReportViewModel
    {
        public IList<Action> Actions { get; set; }
        public IList<Unit> Units { get; set; }
        public bool AllowAllUnits { get; set; }

        public static ELReportViewModel Create(IRepository<Action> actionRepository, IUserBLL userBLL, IPrincipal currentUser)
        {
            var viewModel = new ELReportViewModel
                                {
                                    Actions = actionRepository.Queryable.OrderBy(x => x.Name).ToList(),
                                    Units = userBLL.GetUnitsByUser(currentUser).ToList(),
                                    AllowAllUnits = currentUser.IsInRole(RoleNames.Admin) //Admins are allowed to view all units at once
                                };
            
            return viewModel;
        }
    }
}
