using System.Web.Mvc;
using System.Web.Security;
using EligibilityList.Helpers;

namespace EligibilityList.Controllers
{
    public class AccountController : Controller
    {
#if DEBUG
        private static readonly string CasUrl = System.Web.Configuration.WebConfigurationManager.AppSettings["CASTestServer"];
#else
        private static readonly string CasUrl = System.Web.Configuration.WebConfigurationManager.AppSettings["CASProdServer"];
#endif
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

        public RedirectResult LogOff()
        {
            FormsAuthentication.SignOut();

            return Redirect(CasUrl + "/logout");
        }

        [UserManagerOnly]
        public ViewResult Management()
        {
            return View();
        }
    }
}
