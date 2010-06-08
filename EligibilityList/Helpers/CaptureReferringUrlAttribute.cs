using System.Web.Mvc;
using System;

namespace EligibilityList.Helpers
{
    /// <summary>
    /// Captures the url referrer and stores it in temp data
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false)]
    public class CaptureReferringUrlAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// Grab the url referrer and stash in the temp data for future use
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.Controller.TempData["UrlReferrer"] = filterContext.HttpContext.Request.UrlReferrer;
            base.OnActionExecuting(filterContext);
        }
    }
}
