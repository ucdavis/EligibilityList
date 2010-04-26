namespace EligibilityList.Tests.Core
{
    public class ContinuousIntegrationDeploymentHacks
    {
        public ContinuousIntegrationDeploymentHacks()
        {
            new NHibernate.ByteCode.Spring.ProxyFactoryFactory();
            new System.Data.SQLite.SQLiteException();
        }
    }
}