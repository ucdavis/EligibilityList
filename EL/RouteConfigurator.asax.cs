using System.Web.Mvc;
using System.Web.Routing;
using MvcContrib.Routing;

namespace EL.Web
{
    public class RouteConfigurator
    {
        public virtual void RegisterRoutes()
        {
            RouteCollection routes = RouteTable.Routes;
            routes.Clear();

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            MvcRoute.MappUrl("EligibilityList/Show/Changed")
                .WithDefaults(new { controller = "EligibilityList", action = "Show", changed = true })
                .AddWithName("EligibilityListChanged", routes);

            MvcRoute.MappUrl("EligibilityList/Show/All")
                .WithDefaults(new { controller = "EligibilityList", action = "Show", changed = false })
                .AddWithName("EligilityListAll", routes);

            MvcRoute.MappUrl("{controller}/{action}/{id}")
                .WithDefaults(new { controller = "Home", action = "Index", id = "" })
                .AddWithName("Default", routes);
        }
    }
}