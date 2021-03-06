﻿using System.Web.Mvc;
using Castle.Windsor;
using EligibilityList.Controllers;
using Microsoft.Practices.ServiceLocation;
using MvcContrib.Castle;
using UCDArch.Web.IoC;
using UCDArch.Web.ModelBinder;
using UCDArch.Web.Validator;

namespace EligibilityList
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            new RouteConfigurator().RegisterRoutes();

            #if DEBUG
            HibernatingRhinos.Profiler.Appender.NHibernate.NHibernateProfiler.Initialize();
            #endif

            xVal.ActiveRuleProviders.Providers.Add(new ValidatorRulesProvider());

            ModelBinders.Binders.DefaultBinder = new UCDArchModelBinder();

            IWindsorContainer container = InitializeServiceLocator();
        }

        private static IWindsorContainer InitializeServiceLocator()
        {
            IWindsorContainer container = new WindsorContainer();
            ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory(container));

            container.RegisterControllers(typeof(HomeController).Assembly);
            ComponentRegistrar.AddComponentsTo(container);

            ServiceLocator.SetLocatorProvider(() => new WindsorServiceLocator(container));

            return container;
        }
    }
}