using System.Linq;
using System.Web.Mvc;
using EligibilityList.Core.Domain;
using EligibilityList.Helpers;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Controller;
using UCDArch.Web.Helpers;
using UCDArch.Core.Utils;

namespace EligibilityList.Controllers
{
    /// <summary>
    /// CRUD for Step
    /// </summary>
    [AdminOnly]
    public class StepController : SuperController
    {
        private readonly IRepository<Step> _stepRepository;

        public StepController(IRepository<Step> stepRepository)
        {
            _stepRepository = stepRepository;
        }

        //
        // GET: /Step/
        public ActionResult Index()
        {
            var steps = _stepRepository.Queryable.Where(x => x.Inactive == false).OrderBy(x => x.Name);
            
            return View(steps.ToList());
        }

        //
        
        // GET: /Step/Create

        public ActionResult Create()
        {
            var step = new Step();
            return View(step);
        } 

        //
        // POST: /Step/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Step step)
        {
            var stepToCreate = new Step();
            TransferValues(step, stepToCreate);

            stepToCreate.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                _stepRepository.EnsurePersistent(stepToCreate);

                Message = "Step Created Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View(step);
            }
        }

        private void TransferValues(Step source, Step destination)
        {
            destination.Name = source.Name;
        }
        //
        // GET: /Step/Edit/5
 
        public ActionResult Edit(int id)
        {
            var step = _stepRepository.GetNullableById(id);

            Check.Require(step != null, "Step Not Found");

            return View(step);
        }

        //
        // POST: /Step/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Step step)
        {
            var stepToEdit = _stepRepository.GetNullableById(id);

            Check.Require(stepToEdit != null);
            
            TransferValues(step, stepToEdit);

            stepToEdit.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                _stepRepository.EnsurePersistent(stepToEdit);

                Message = "Step Edited Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View(step);
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Remove(int id)
        {
            var step = _stepRepository.GetNullableById(id);

            Check.Require(step != null);

            _stepRepository.Remove(step);

            Message = "Step Removed Successfully";

            return RedirectToAction("Index");
        }
    }
}
