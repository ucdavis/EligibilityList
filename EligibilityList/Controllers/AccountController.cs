using System.Web.Mvc;
using System.Web.Security;
using EligibilityList.Helpers;

namespace EligibilityList.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult LogOn(string returnUrl)
        {
            string resultUrl = CasHelper.Login(); //Do the CAS Login

            if (resultUrl != null)
            {
                return Redirect(resultUrl);
            }

            TempData["URL"] = returnUrl;

            return View();
        }

        public RedirectToRouteResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        [UserManagerOnly]
        public ViewResult Management()
        {
            return View();
        }
    }
}
