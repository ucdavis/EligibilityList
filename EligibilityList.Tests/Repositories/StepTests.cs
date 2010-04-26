using EligibilityList.Core.Domain;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Testing;

namespace EligibilityList.Tests.Repositories
{
    [TestClass]
    public class StepTests : RepositoryTestBase
    {
        [TestMethod]
        public void StepNotValidWithoutName()
        {
            var step = new Step {Name = null};

            Assert.AreEqual(false, step.IsValid());
        }

        [TestMethod]
        public void StepWillSaveWithValidName()
        {
            var step = new Step { Name = "VALIDNAME" };

            using (var ts = new TransactionScope())
            {
                Repository.OfType<Step>().EnsurePersistent(step);

                ts.CommitTransaction();
            }

            Assert.AreEqual(false, step.IsTransient());
        }
    }
}