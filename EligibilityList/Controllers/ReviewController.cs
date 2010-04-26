using System.Web.Mvc;
using EligibilityList.Core.Domain;
using EligibilityList.Helpers;
using MvcContrib.Attributes;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using UCDArch.Web.Controller;
using MvcContrib;
using UCDArch.Web.Helpers;
using EligibilityListBLL;
using System;

namespace EligibilityList.Controllers
{
    [AdminOnly]
    public class ReviewController : SuperController
    {
        private readonly IMessageBLL _messageBLL;

        public ReviewController(IMessageBLL messageBLL)
        {
            _messageBLL = messageBLL;
        }

        /// <summary>
        /// Review of a pending eligibility request
        /// </summary>
        /// <param name="id">Id of the temporary eligibility record</param>
        /// <returns></returns>
        public ActionResult Index(int id)
        {
            var viewModel = ElibiilityReviewViewModel.Create(Repository);

            viewModel.Eligibility = Repository.OfType<Eligibility>().GetNullableById(id);

            // not valid redirect to another page
            if (viewModel.Eligibility == null) return this.RedirectToAction<HomeController>(a => a.Index());

            Check.Require(viewModel.Eligibility != null, "Proposed eligibility is required.");
            Check.Require(viewModel.Eligibility.OriginalEligibility != null, "Original eligibility is required.");

            return View(viewModel);
        }

        /// <summary>
        /// POST: /Review/Index/{id}
        /// </summary>
        /// <param name="id">Id of the temporary eligibility record</param>
        /// <param name="reviewAction">Accept or Deny</param>
        /// <param name="comments"></param>
        /// <returns></returns>
        [AcceptPost]
        public ActionResult Index(int id, string reviewAction, string comments)
        {
            var child = Repository.OfType<Eligibility>().GetNullableById(id);

            // not valid redirect to another page
            if (child == null) return this.RedirectToAction<HomeController>(a => a.Index());

            var parent = child.OriginalEligibility;

            // parent is null, something is horribly wrong
            if (parent == null) return this.RedirectToAction<HomeController>(a => a.Index());

            bool approve = reviewAction == "Approve";

            if (approve == false && reviewAction != "Deny") ModelState.AddModelError("ReviewAction", "Must Either Approve or Deny an Eligibility");

            if (approve)
            {
                // copy the changes
                CopyHelper.TransferValuesTo(child, parent);
            }

            // validate the parent
            parent.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                parent.LastUpdated = DateTime.Now;

                var editorEmail = child.EditorEmail;

                // delete the temp
                Repository.OfType<Eligibility>().Remove(child);

                // save the parent, only if approved, otherwise toss
                if (approve) Repository.OfType<Eligibility>().EnsurePersistent(parent);

                // send a message regardless of status
                _messageBLL.SendReviewMessage(parent, comments, approve, editorEmail);

                // redirect to page
                return this.RedirectToAction<HomeController>(a => a.Index());
            }

            // failed, ready the display back out to the user
            var viewModel = ElibiilityReviewViewModel.Create(Repository);
            viewModel.Eligibility = child;
            viewModel.Comment = comments;

            return View(viewModel);
        }
    }

    public class ElibiilityReviewViewModel
    {
        public Eligibility Eligibility{ get; set; }
        public string Comment { get; set; }

        public static ElibiilityReviewViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository is required.");

            var viewModel = new ElibiilityReviewViewModel();

            return viewModel;
        }
    }
}
