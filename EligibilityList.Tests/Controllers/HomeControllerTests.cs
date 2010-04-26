using Microsoft.VisualStudio.TestTools.UnitTesting;
using EligibilityList.Controllers;
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
    }
}
