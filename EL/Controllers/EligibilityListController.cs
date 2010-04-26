﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EL.Core.Domain;
using EL.BLL;

namespace EL.Web.Controllers
{
    [HandleError]
    public class EligibilityListController : Controller
    {
        public ActionResult Show(int? id)
        {
            IQueryable<Eligibility> els = GenericBLL<Eligibility, int>.Queryable;

            return View(els);
        }

        public ActionResult Edit(int id)
        {
            return View();
        }
    }
}
