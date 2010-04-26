using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using CAESArch.Web.Authentication;

namespace EL.Web.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {
        public ActionResult CASLogOn(string returnUrl)
        {
            string resultUrl = CASHelper.Login(); //Do the CAS Login

            if (resultUrl != null)
            {
                return Redirect(resultUrl);
            }
            
            ViewData["URL"] = returnUrl;

            return View();
        }
    }
}
