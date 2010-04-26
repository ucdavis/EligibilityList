using EL.Web.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using System;
using System.Linq;

namespace EL.Tests.Controllers
{
    /// <summary>
    ///This is a test class for EligibilityListControllerTest and is intended
    ///to contain all EligibilityListControllerTest Unit Tests
    ///</summary>
    [TestClass()]
    public class EligibilityListControllerTest
    {
        /// <summary>
        ///A test for Show to see that the show methoid completes and correctly populates the changed data variable
        ///</summary>
        [TestMethod]
        public void ShowTest()
        {   
            EligibilityListController target = new EligibilityListController();
            Nullable<bool> changed = new Nullable<bool>();
            changed = true; //Try change = true

            var actual = target.Show(changed) as ViewResult;

            Assert.AreEqual(changed.Value, actual.ViewData["Changed"]); //Make sure we call the correct view

            changed = false; //Now try with change = false

            actual = target.Show(changed) as ViewResult;

            Assert.AreEqual(changed.Value, actual.ViewData["Changed"]); //Make sure we call the correct view
        }

        [TestMethod]
        public void ShowMustContainListOfCorrectType()
        {
            EligibilityListController controller = new EligibilityListController();
            bool? changed = true; //just grab the changed ones

            var result = controller.Show(changed) as ViewResult;

            var model = result.ViewData.Model as IQueryable<EL.Core.Domain.Eligibility>;

            Assert.IsNotNull(model);

            var listOfModel = model.ToList();

            Assert.IsNotNull(listOfModel);
        }
    }
}
