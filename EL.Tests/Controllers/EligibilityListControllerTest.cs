using EL.Web.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using System;
using System.Linq;
using NHibernate.Cfg;
using EL.Core.Domain;
using EL.Data;
using EL.BLL;
using System.Collections.Generic;

namespace EL.Tests.Controllers
{
    /// <summary>
    ///This is a test class for EligibilityListControllerTest and is intended
    ///to contain all EligibilityListControllerTest Unit Tests
    ///</summary>
    [TestClass()]
    public class EligibilityListControllerTest
    {
        [TestInitialize]
        public void CreateDB()
        {
            Configuration config = new Configuration().Configure();
            //Create the DB using the schema export
            new NHibernate.Tool.hbm2ddl.SchemaExport(config).Execute(false, true, false, true, EL.Data.NHibernateSessionManager.Instance.GetSession().Connection, null);

            LoadData();
        }

        public void LoadData()
        {
            ActionType at = new ActionType();
            ActionType at2 = new ActionType();

            at.Name = "My Type";
            at2.Name = "Another Type";

            using (var ts = new TransactionScope())
            {
                ActionTypeBLL.EnsurePersistent(ref at);
                ActionTypeBLL.EnsurePersistent(ref at2);

                ts.CommittTransaction();
            }
        }

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

        [TestMethod]
        public void CanGetActions()
        {
            EligibilityListController controller = new EligibilityListController();

            var result = controller.GetActions();

            Assert.IsNotNull(result);

            var data = result.Data as List<ActionType>;

            Assert.IsNotNull(data);
            Assert.AreEqual(2, data.Count);
        }
    }
}
