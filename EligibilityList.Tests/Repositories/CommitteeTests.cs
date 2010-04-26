using EligibilityList.Core.Domain;
using UCDArch.Testing;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UCDArch.Core.PersistanceSupport;

namespace EligibilityList.Tests.Repositories
{
    /// <summary>
    /// 
    /// </summary>
    [TestClass]
    public class CommitteeTests : RepositoryTestBase
    {
        [TestMethod]
        public void CanCreateNewCommittee()
        {
            var newCommittee = new Committee() {Name = "COMMITTEE", Inactive = false};

            Assert.IsTrue(newCommittee.IsTransient(), "Should not yet be in the DB");

            using (var ts = new TransactionScope())
            {
                Repository.OfType<Committee>().EnsurePersistent(newCommittee);
                ts.CommitTransaction();
            }

            Assert.IsFalse(newCommittee.IsTransient(), "Should now be in the DB");
        }
    }
}
