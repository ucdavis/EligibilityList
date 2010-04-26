using System.Web.Mvc;
using System.Web.Routing;
using MvcContrib.Routing;

namespace EligibilityList
{
    public class RouteConfigurator
    {
        public virtual void RegisterRoutes()
        {
            RouteCollection routes = RouteTable.Routes;
            routes.Clear();

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });

            MvcRoute.MappUrl("{controller}/{action}/{id}")
                .WithDefaults(new { controller = "Eligibility", action = "ViewPending", id = "" })
                .AddWithName("Default", routes);
        }
    }
}