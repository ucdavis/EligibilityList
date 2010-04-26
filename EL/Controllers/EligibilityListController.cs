using System.Web.Mvc;
using EL.Core.Domain;
using EL.BLL;

namespace EL.Web.Controllers
{
    [HandleError]
    public class EligibilityListController : Controller
    {
        public EligibilityBLL2 EligibilityBLL2 { get; set; }
        
        public EligibilityListController()
        {
            EligibilityBLL2 = new EligibilityBLL2();
        }

        [Transaction]
        public ActionResult Show(bool? changed)
        {
            bool onlyChanged = changed ?? true;

            var els = EligibilityBLL2.GetChanged(onlyChanged, ControllerContext.HttpContext.User);

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
