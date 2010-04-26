using System.Web.Mvc;
using UCDArch.Web.Authentication;

namespace EligibilityList.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult LogOn(string returnUrl)
        {
            string resultUrl = CASHelper.Login(); //Do the CAS Login

            if (resultUrl != null)
            {
                return Redirect(resultUrl);
            }

            TempData["URL"] = returnUrl;

            return View();
        }
    }
}
