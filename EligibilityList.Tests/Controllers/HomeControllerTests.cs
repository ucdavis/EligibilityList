using Microsoft.VisualStudio.TestTools.UnitTesting;
using EligibilityList.Controllers;
using MvcContrib.TestHelper;
using UCDArch.Testing;

namespace EligibilityList.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTests : ControllerTestBase<HomeController>
    {
        protected override void RegisterRoutes()
        {
            new RouteConfigurator().RegisterRoutes();
        }

        protected override void SetupController()
        {
            Controller = new HomeController();
        }

        [TestMethod]
        public void RoutingRootGoesToViewPendingPositions()
        {
            "~/".ShouldMapTo<HomeController>(a => a.Index());
        }
    }
}
