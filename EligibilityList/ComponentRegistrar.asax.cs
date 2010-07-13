using Castle.Windsor;
using UCDArch.Core.CommonValidator;
using UCDArch.Core.NHibernateValidator.CommonValidatorAdapter;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Data.NHibernate;
using EligibilityListBLL;

namespace EligibilityList
{
    public static class ComponentRegistrar
    {
        public static void AddComponentsTo(IWindsorContainer container)
        {
            //Add your components here
            container.AddComponent("validator",
                                   typeof(IValidator), typeof(Validator));
            container.AddComponent("dbContext", typeof (IDbContext), typeof (DbContext));

            AddBLLsTo(container);

            AddRepositoriesTo(container);
        }

        private static void AddBLLsTo(IWindsorContainer container)
        {
            container.AddComponent("userBLL", typeof (IUserBLL), typeof (UserBLL));
            container.AddComponent("messageBLL", typeof (IMessageBLL), typeof (SmtpMessageBLL));
            container.AddComponent("reportBLL", typeof (IReportBLL), typeof (ReportBLL));
        }

        private static void AddRepositoriesTo(IWindsorContainer container)
        {
            container.AddComponent("repositoryWithTypedId",
                            typeof(IRepositoryWithTypedId<,>), typeof(RepositoryWithTypedId<,>));
            container.AddComponent("repositoryType",
                                   typeof(IRepository<>), typeof(Repository<>));
            container.AddComponent("repository",
                                   typeof(IRepository), typeof(Repository));
            
        }
    }
}