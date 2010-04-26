using System.Linq;
using System.Web.Mvc;
using EL.Core.Domain;
using EL.BLL;

namespace EL.Web.Controllers
{
    [HandleError]
    public class EligibilityListController : Controller
    {
        public ActionResult Show(bool? changed)
        {
            bool onlyChanged = changed ?? true;

            var user = ControllerContext.HttpContext.User.Identity.Name;

            IQueryable<Eligibility> els = EligibilityBLL.GetChanged(onlyChanged, ControllerContext.HttpContext.User);

            ViewData["Changed"] = onlyChanged;

            return View(els);
        }

        public ActionResult Edit(int? id)
        {
            Eligibility el = null;

            if (id.HasValue)
            {
                el = EligibilityBLL.GetNullableByID(id.Value);
            }

            if (el == null) return RedirectToAction("Error", "Home");
            //Check.Require(el != null, "Bad value for El ID");

            return View(el);
        }

        public JsonResult GetActions()
        {
            var actions = ActionTypeBLL.GetAll();

            return Json(actions);
        }
    }
}
