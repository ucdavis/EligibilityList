using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EL.BLL;
using EL.Core.Domain;
using System.Text;

namespace EL.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult Test()
        {
            var tests = GenericBLL<EL.Core.Domain.Action, int>.GetAll();

            StringBuilder allActions = new StringBuilder();

            foreach (var item in tests)
            {
                allActions.AppendLine(item.Name);
            }

            ViewData["Message"] = allActions.ToString();

            return View("Index");
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
