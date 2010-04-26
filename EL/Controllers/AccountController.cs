using System;
using System.Globalization;
using System.IO;
using System.Net;
using System.Security.Principal;
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
            var helper = new CASHelper();

            helper.CASLogin(ControllerContext.HttpContext); //Do the CAS Login

            if (!String.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
    }

    public class CASHelper
    {
        #region CAS

        private const string StrCasUrl = "https://cas.ucdavis.edu:8443/cas/";
        private const string StrTicket = "ticket";
        private const string StrReturnUrl = "ReturnURL";

        /// <summary>
        /// Login to the campus DistAuth system using CAS        
        /// </summary>
        public void CASLogin(HttpContextBase context)
        {
            string loginUrl = StrCasUrl;

            // get the context from the source

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

                        /*
                        // redirect to original url
                        string returnURL = context.Request.QueryString[StrReturnUrl];

                        if (returnURL == null)
                            returnURL = FormsAuthentication.DefaultUrl;

                        context.Response.Redirect(returnURL);

                        return;
                         */

                        return; //Finished with the signIn
                    }
                }

                // ticket doesn't exist or is invalid so redirect user to CAS login
                context.Response.Redirect(loginUrl + "login?service=" + service);
            }
        }
        #endregion
    }
}
