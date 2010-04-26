using System;
using System.Collections.Generic;
using CAESArch.BLL;
using EL.BLL;
using EL.Core.Domain;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NHibernate.Cfg;

namespace EL.Tests
{
    public abstract class DatabaseTestBase
    {
        [TestInitialize]
        public void CreateDB()
        {
            Configuration config = new Configuration().Configure();
            //Create the DB using the schema export
            new NHibernate.Tool.hbm2ddl.SchemaExport(config).Execute(false, true, false,
                                                                     CAESArch.Data.NHibernate.NHibernateSessionManager.
                                                                         Instance.GetSession().Connection, null);

            LoadData();
        }

        protected virtual void LoadData()
        {
            using (var ts = new TransactionScope())
            {
                CreateActionTypes();
                CreateELs();
                CreateUsers();

                ts.CommitTransaction();
            }
        }

        private void CreateUsers()
        {
            var u = new Unit("AANS");
            var u2 = new Unit("ADNO");
            var u3 = new Unit("AARE");

            GenericBLLBase<Unit, string>.EnsurePersistent(u, true);
            GenericBLLBase<Unit, string>.EnsurePersistent(u2, true);
            GenericBLLBase<Unit, string>.EnsurePersistent(u3, true);

            User user = new User {Login = "tester", FirstName = "First", LastName = "Last"};
            
            user.Units = new List<Unit> {u, u2};

            GenericBLLBase<User, int>.EnsurePersistent(user, true);
            
        }

        public void CreateActionTypes()
        {
            ActionType at = new ActionType();
            ActionType at2 = new ActionType();

            at.Name = "My Type";
            at2.Name = "Another Type";

            ActionTypeBLL.EnsurePersistent(at);
            ActionTypeBLL.EnsurePersistent(at2);
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

            Step step = new Step() {Name = "New Step"};

            var title = "7242";

            Title t = new Title(title) {AbbreviatedName = "Title"};

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
        }
    }
}
