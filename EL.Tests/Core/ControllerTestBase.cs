using System.Web.Mvc;
using EL.Web;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MvcContrib.TestHelper;

namespace EL.Tests.Core
{
    [TestClass]
    public abstract class ControllerTestBase<T> where T : Controller
    {
        protected T Controller { get; set; }
        protected TestControllerBuilder Builder { get; set; }

        protected ControllerTestBase()
        {
            new RouteConfigurator().RegisterRoutes();
        }

        [TestInitialize]
        public void Setup()
        {
            Builder = new TestControllerBuilder();
            Controller = Builder.CreateController<T>();
        }
    }
}