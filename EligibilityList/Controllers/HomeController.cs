﻿using System.Web.Mvc;
using UCDArch.Web.Controller;

namespace EligibilityList.Controllers
{
    [HandleError]
    public class HomeController : SuperController
    {
        public ActionResult Index()
        {
            return RedirectToAction("ViewPending", "Eligibility");
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
