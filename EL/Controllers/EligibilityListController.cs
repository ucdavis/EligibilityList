using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

            IQueryable<Eligibility> els = EligibilityBLL.GetChanged(onlyChanged);

            ViewData["Changed"] = onlyChanged;

            return View(els);
        }

        public JsonResult GetActions()
        {
            var actions = ActionTypeBLL.GetAll();

            return Json(actions);
        }
    }
}
