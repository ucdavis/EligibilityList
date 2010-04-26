using System.Collections.Generic;
using System.Linq;
using CAESArch.BLL;
using EL.Core.Domain;
using EL.Tests.Core;
using EL.Web.Controllers;
using MvcContrib.TestHelper;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Rhino.Mocks;

namespace EL.Tests.Controllers
{
    [TestClass]
    public class EligibilityListControllerTests : ControllerTestBase<EligibilityListController>
    {
        [TestInitialize]
        public void SetupELRepository()
        {
            Controller.EligibilityBLL2.Repository = GetStubRepository();
        }

        [TestMethod]
        public void ShowWithChangedFalseShowsAllActiveELs()
        {
            var els = GetTenBlankEls();

            foreach (var el in els.Take(5))
            {
                el.IsActive = true;
            }

            Controller.EligibilityBLL2.Repository.Expect(a => a.Queryable).Return(els.AsQueryable());

            Controller.Show(false)
                .AssertViewRendered()
                .WithViewData<IQueryable<Eligibility>>()
                .Count()
                .ShouldBe(5);
        }

        [TestMethod]
        public void ShowWithNullChangedParameterReturnedChangedTrueInViewData()
        {
            Controller.EligibilityBLL2.Repository.Expect(a => a.Queryable).Return(new List<Eligibility>().AsQueryable());

            Controller.Show(null)
                .AssertViewRendered()
                .ViewData["Changed"]
                .ShouldBe(true);
        }

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

        private INonStaticGenericBLLBase<Eligibility,int> GetStubRepository()
        {
            return MockRepository.GenerateStub<INonStaticGenericBLLBase<Eligibility, int>>();
        }

        private static List<Eligibility> GetTenBlankEls()
        {
            //var orignialEl = new Eligibility();
                
            var els = new List<Eligibility>();

            for (int i = 0; i < 10; i++)
            {
                var el = new Eligibility();

                els.Add(el);
            }

            return els;
        }
    }
}
