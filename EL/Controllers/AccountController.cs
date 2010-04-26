using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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

    public static class CASHelper
    {
        #region CAS

        private const string StrCasUrl = "https://cas.ucdavis.edu:8443/cas/";
        private const string StrTicket = "ticket";
        private const string StrReturnUrl = "ReturnURL";

        public static string GetReturnUrl()
        {
            return HttpContext.Current.Request.QueryString[StrReturnUrl];
        }

        /// <summary>
        /// Performs the CAS Login and automatically redirects to the desired page, if possible.
        /// Will do nothing if the user is already authenticated
        /// </summary>
        public static void LoginAndRedirect()
        {
            string returnUrl = Login();

            if (returnUrl != null) HttpContext.Current.Response.Redirect(returnUrl);
        }

        /// <summary>
        /// Login to the campus DistAuth system using CAS        
        /// </summary>
        public static string Login()
        {
            string loginUrl = StrCasUrl;

            // get the context from the source
            var context = HttpContext.Current;

            // try to load a valid ticket
            HttpCookie validCookie = context.Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket validTicket = null;

            // check to make sure cookie is valid by trying to decrypt it
            if (validCookie != null)
            {
                try
                {
                    validTicket = FormsAuthentication.Decrypt(validCookie.Value);
                }
                catch
                {
                    validTicket = null;
                }
            }

            // if user is unauthorized and no validTicket is defined then authenticate with cas
            //if (context.Response.StatusCode == 0x191 && (validTicket == null || validTicket.Expired))
            if (validTicket == null || validTicket.Expired)
            {
                // build query string but strip out ticket if it is defined
                string query = "";
                foreach (string key in context.Request.QueryString.AllKeys)
                {
                    if (String.Compare(key, StrTicket, true) != 0)
                    {
                        query += "&" + key + "=" + context.Request.QueryString[key];
                    }
                }

                // replace 1st character with ? if query is not empty
                if (!String.IsNullOrEmpty(query))
                {
                    query = "?" + query.Substring(1);
                }

                // get ticket & service
                string ticket = context.Request.QueryString[StrTicket];
                string service = context.Server.UrlEncode(context.Request.Url.GetLeftPart(UriPartial.Path) + query);

                // if ticket is defined then we assume they are coming from CAS
                if (!string.IsNullOrEmpty(ticket))
                {
                    // validate ticket against cas
                    StreamReader sr = new StreamReader(new WebClient().OpenRead(loginUrl + "validate?ticket=" + ticket + "&service=" + service));

                    // parse text file
                    if (sr.ReadLine() == "yes")
                    {
                        // get kerberos id
                        string kerberos = sr.ReadLine();

                        // set forms authentication ticket
                        FormsAuthentication.SetAuthCookie(kerberos, false);

                        string returnUrl = GetReturnUrl();

                        if (!String.IsNullOrEmpty(returnUrl))
                        {
                            return returnUrl;
                        }
                        else
                        {
                            return FormsAuthentication.DefaultUrl;
                        }
                    }
                }

                // ticket doesn't exist or is invalid so redirect user to CAS login
                context.Response.Redirect(loginUrl + "login?service=" + service);
            }

            return null;
        }
        #endregion
    }
}
