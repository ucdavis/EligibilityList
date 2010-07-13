using System.Linq;
using System.Web.Mvc;
using EligibilityList.Helpers;
using UCDArch.Web.Controller;
using EligibilityList.Core.Domain;
using MvcContrib.Attributes;
using EligibilityListBLL;

namespace EligibilityList.Controllers
{
    public class ReportController : SuperController
    {
        private readonly IReportBLL _reportBLL;

        public ReportController(IReportBLL reportBLL)
        {
            _reportBLL = reportBLL;
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
            var actionTypes = Repository.OfType<Action>().Queryable.OrderBy(x=>x.Name);

            return View(actionTypes.ToList());
        }

        [AcceptPost]
        [ValidateAntiForgeryToken]
        public ActionResult EligibilityListReport(string actionName)
        {
            return _reportBLL.GenerateELReport(actionName, ReportType.Excel).ToFileResult("ELReport.xls");
        }
    }
}
