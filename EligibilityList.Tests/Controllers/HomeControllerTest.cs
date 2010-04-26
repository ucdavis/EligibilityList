using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using EligibilityList.Controllers;
using MvcContrib.TestHelper;
using UCDArch.Testing;

namespace EligibilityList.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest : ControllerTestBase<HomeController>
    {
        protected override void RegisterRoutes()
        {
            new RouteConfigurator().RegisterRoutes();
        }

        [TestMethod]
        public void RoutingRootGoesToHome()
        {
            "~/".ShouldMapTo<HomeController>(a => a.Index());
        }

        protected override void SetupController()
        {
            Controller = new HomeController();
        }
    }
}
