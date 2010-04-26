using EL.Tests.Core;
using EL.Web.Controllers;
using MvcContrib.TestHelper;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EL.Tests.Controllers
{
    [TestClass]
    public class EligibilityListControllerTests : ControllerTestBase<EligibilityListController>
    {
        [TestMethod]
        public void RoutingToEligibilityListShowChangedRedirectsToShowMethodWithChangedEqualToTrue()
        {
            bool? changed = true;

            "~/EligibilityList/Show/Changed"
                .ShouldMapTo<EligibilityListController>(a => a.Show(changed));
        }

        [TestMethod]
        public void RoutingToEligibilityListShowAllRedirectsToShowMethodWithChangedEqualToFalse()
        {
            bool? changed = false;

            "~/EligibilityList/Show/All"
                .ShouldMapTo<EligibilityListController>(a => a.Show(changed));
        }

        [TestMethod]
        public void RoutingToEligibilityListShowDefaultRedirectsToShowMethodWithChangedEqualToNull()
        {
            bool? changed = null;

            "~/EligibilityList/Show"
                .ShouldMapTo<EligibilityListController>(a => a.Show(changed));
        }
    }
}
