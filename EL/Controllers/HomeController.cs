using System.Web.Mvc;
using EL.BLL;
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
            var tests = ActionTypeBLL.GetAll();

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
