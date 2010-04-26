using System;
using System.Web.Mvc;
using EligibilityList.Core;
using EligibilityList.Core.Domain;
using MvcContrib.Attributes;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using UCDArch.Web.Controller;
using MvcContrib;
using UCDArch.Web.Helpers;

namespace EligibilityList.Controllers
{
    public class ReviewController : SuperController
    {
        /// <summary>
        /// Review of a pending eligibility request
        /// </summary>
        /// <param name="eligibilityId">Id of the temporary eligibility record</param>
        /// <returns></returns>
        public ActionResult Index(int eligibilityId)
        {
            var viewModel = ElibiilityViewModel.Create(Repository);

            viewModel.Eligibility = Repository.OfType<Eligibility>().GetNullableByID(eligibilityId);

            // not valid redirect to another page
            if (viewModel.Eligibility == null) return this.RedirectToAction<HomeController>(a => a.Index());

            return View(viewModel);
        }

        /// <summary>
        /// POST: /Review/Index/{eligibilityId}
        /// </summary>
        /// <param name="eligibilityId">Id of the temporary eligibility record</param>
        /// <param name="approved"></param>
        /// <param name="comments"></param>
        /// <returns></returns>
        [AcceptPost]
        public ActionResult Index(int eligibilityId, bool approved, string comments)
        {
            var child = Repository.OfType<Eligibility>().GetNullableByID(eligibilityId);

            // not valid redirec to another page
            if (child == null) return this.RedirectToAction<HomeController>(a => a.Index());

            var parent = child.OriginalEligibility;

            // parent isn't null, something is horribly wrong
            if (parent == null) return this.RedirectToAction<HomeController>(a => a.Index());

            if (approved)
            {
                // copy the changes
                parent = Copy(child, parent);
            }
            
            // save comment
            parent.Comment = comments;

            // validate the parent
            parent.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                // delete the temp
                Repository.OfType<Eligibility>().Remove(child);

                // save the parent
                Repository.OfType<Eligibility>().EnsurePersistent(parent);

                // redirect to page
                return this.RedirectToAction<HomeController>(a => a.Index());
            }

            // failed, ready the display back out to the user
            var viewModel = ElibiilityViewModel.Create(Repository);
            viewModel.Eligibility = child;
            viewModel.Comment = comments;

            return View(viewModel);
        }

        private Eligibility Copy(Eligibility source, Eligibility dest)
        {
            return dest;
        }
    }

    public class ElibiilityViewModel
    {
        public Eligibility Eligibility{ get; set; }
        public string Comment { get; set; }

        public static ElibiilityViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository is required.");

            var viewModel = new ElibiilityViewModel() {};

            return viewModel;
        }
    }
}
