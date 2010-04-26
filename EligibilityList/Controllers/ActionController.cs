using System.Linq;
using System.Web.Mvc;
using UCDArch.Web.Controller;
using UCDArch.Web.Helpers;
using Action=EligibilityList.Core.Domain.Action;
using UCDArch.Core.Utils;
using UCDArch.Core.PersistanceSupport;

namespace EligibilityList.Controllers
{
    public class ActionController : SuperController
    {
        private readonly IRepository<Action> _actionRepository;

        public ActionController(IRepository<Action> actionRepository)
        {
            _actionRepository = actionRepository;
        }

        //
        // GET: /Action/

        public ActionResult Index()
        {
            var actions = _actionRepository.Queryable.Where(x => x.Inactive == false).OrderBy(x => x.Name);

            return View(actions.ToList());
        }

        //
        // GET: /Action/Create
        public ActionResult Create()
        {
            var action = new Action();

            return View(action);
        } 

        //
        // POST: /Action/Create
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Action actionType)
        {
            var actionToCreate = new Action { Name = actionType.Name };

            actionToCreate.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                //save
                _actionRepository.EnsurePersistent(actionToCreate);

                Message = "Action created successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        //
        // GET: /Action/Edit/5
 
        public ActionResult Edit(int id)
        {
            var action = _actionRepository.GetNullableByID(id);

            Check.Require(action != null, "Action not found");
            
            return View(action);
        }

        //
        // POST: /Action/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Action actionType)
        {
            var action = _actionRepository.GetNullableByID(id);

            Check.Require(action != null, "Action not found");

            action.Name = actionType.Name; //update

            action.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                _actionRepository.EnsurePersistent(action);

                Message = "Action edited successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View(action);
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Remove(int id)
        {
            var action = _actionRepository.GetNullableByID(id);

            Check.Require(action != null, "Action not found");

            _actionRepository.Remove(action);

            Message = "Action removed successfully";

            return RedirectToAction("Index");
        }
    }
}
