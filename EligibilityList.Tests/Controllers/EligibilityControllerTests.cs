using EligibilityList.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UCDArch.Testing;

namespace EligibilityList.Tests.Controllers
{
    [TestClass]
    public class EligibilityControllerTests : ControllerTestBase<EligibilityController>
    {
        protected override void RegisterRoutes()
        {
            new RouteConfigurator().RegisterRoutes();
        }

        protected override void SetupController()
        {
            Controller = new EligibilityController(null, null, null);
        }
    }
}