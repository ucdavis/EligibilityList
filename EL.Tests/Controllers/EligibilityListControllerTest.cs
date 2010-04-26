using CAESArch.BLL;
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
            new NHibernate.Tool.hbm2ddl.SchemaExport(config).Execute(false, true, false, true, CAESArch.Data.NHibernate.NHibernateSessionManager.Instance.GetSession().Connection, null);

            LoadData();
        }

        public void LoadData()
        {
            CreateActionTypes();
            CreateELs();
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
        public void ShowChangedGivesOnlyWithOriginalEl()
        {
            EligibilityListController controller = new EligibilityListController();
            bool? changed = true;

            var result = controller.Show(changed) as ViewResult;

            var elData = result.ViewData.Model as IQueryable<Eligibility>;

            //Now lets make sure that our original els are never null
            bool anyWithoutOriginalEL = elData.Where(e => e.OriginalEligibility == null).Any();

            Assert.IsFalse(anyWithoutOriginalEL);
        }

        [TestMethod]
        public void ShowAllShouldGetAllActiveELs()
        {
            EligibilityListController controller = new EligibilityListController();
            bool? changed = false; //not just the changed ones

            var result = controller.Show(changed) as ViewResult;

            var elData = result.ViewData.Model as IQueryable<Eligibility>;

            //Lets make sure these are always just the active ones
            bool anyInactive = elData.Where(e => e.IsActive == false).Any();

            Assert.IsFalse(anyInactive);
            Assert.AreEqual(25, elData.Count()); //Should be 25 active els

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

        public void CreateActionTypes()
        {
            ActionType at = new ActionType();
            ActionType at2 = new ActionType();

            at.Name = "My Type";
            at2.Name = "Another Type";

            using (var ts = new TransactionScope())
            {
                ActionTypeBLL.EnsurePersistent(at);
                ActionTypeBLL.EnsurePersistent(at2);

                ts.CommitTransaction();
            }
        }

        public void CreateELs()
        {
            Employee emp = new Employee("999999999")
            {
                FirstName = "Scott",
                LastName = "Kirkland"
            };

            Department dept = new Department("030000");

            var act = GenericBLL<EL.Core.Domain.Action, int>.GetByName("My Type");

            Step step = new Step() { Name = "New Step" };

            var title = "7242";

            Title t = new Title(title) { AbbreviatedName = "Title" };

            using (var ts = new TransactionScope())
            {
                GenericBLL<Employee, string>.EnsurePersistent(emp);
                GenericBLL<Department, string>.EnsurePersistent(dept);
                GenericBLL<EL.Core.Domain.Action, int>.EnsurePersistent(act);
                GenericBLL<Step, int>.EnsurePersistent(step);
                GenericBLL<Title, string>.EnsurePersistent(t);

                //Create 50 els for testing, all with this el as the "OriginalEligibility"
                for (int i = 0; i < 50; i++)
                {
                    Eligibility elFirst, el;

                    if (i == 0) //The first one needs to be different so that every other el can reference it
                    {
                        elFirst = new Eligibility()
                        {
                            CurrentBlankTitle = title,
                            ProposedBlankTitle = title,
                            CurrentTitle = t,
                            TPCCode = title,
                            Comment = "Comment",
                            Action = act,
                            Employee = emp,
                            Department = dept,
                            CurrentStep = step,
                            ProposedStep = step,
                            IsActive = true
                        };

                        elFirst.OriginalEligibility = elFirst;

                        EligibilityBLL.EnsurePersistent(elFirst);
                    }
                    else
                    {
                        el = new Eligibility()
                        {
                            CurrentBlankTitle = title,
                            ProposedBlankTitle = title,
                            CurrentTitle = t,
                            TPCCode = title,
                            Comment = "Comment",
                            Action = act,
                            Employee = emp,
                            Department = dept,
                            CurrentStep = step,
                            ProposedStep = step
                        };

                        el.IsActive = i < 25; //The first 25 get active, the second fifty are inactive

                        EligibilityBLL.EnsurePersistent(el); //Save this el
                    }
                }

                ts.CommitTransaction();
            }
        }
    }
}
