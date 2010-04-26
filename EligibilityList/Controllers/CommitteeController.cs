using System.Linq;
using System.Web.Mvc;
using EligibilityList.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Controller;
using UCDArch.Web.Helpers;
using UCDArch.Core.Utils;

namespace EligibilityList.Controllers
{
    /// <summary>
    /// CRUD for Committee
    /// </summary>
    public class CommitteeController : SuperController
    {
        private readonly IRepository<Committee> _committeeRepository;

        public CommitteeController(IRepository<Committee> committeeRepository)
        {
            _committeeRepository = committeeRepository;
        }

        //
        // GET: /Committee/
        public ActionResult Index()
        {
            var committees = _committeeRepository.Queryable.Where(x => x.Inactive == false).OrderBy(x => x.Name);

            return View(committees.ToList());
        }

        //
        // GET: /Committee/Create
        public ActionResult Create()
        {
            var committee = new Committee();
            
            return View(committee);
        } 

        //
        // POST: /Committee/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Committee committee)
        {
            var committeeToCreate = new Committee();

            TransferValues(committee, committeeToCreate);

            committeeToCreate.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                _committeeRepository.EnsurePersistent(committeeToCreate);

                Message = "Committee Created Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View(committee);
            }
        }

        private void TransferValues(Committee source, Committee destination)
        {
            destination.Name = source.Name;
        }


        //
        // GET: /Committee/Edit/5
 
        public ActionResult Edit(int id)
        {
            var committee = _committeeRepository.GetNullableById(id);

            Check.Require(committee != null, "Committee Not Found");

            return View(committee);
        }

        //
        // POST: /Committee/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Committee committee)
        {
            var committeeToEdit = _committeeRepository.GetNullableById(id);

            Check.Require(committeeToEdit != null);

            TransferValues(committee, committeeToEdit);

            committeeToEdit.TransferValidationMessagesTo(ModelState);

            if (ModelState.IsValid)
            {
                _committeeRepository.EnsurePersistent(committeeToEdit);

                Message = "Committee Edited Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                return View(committee);
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Remove(int id)
        {
            var committee = _committeeRepository.GetNullableById(id);

            Check.Require(committee != null);

            _committeeRepository.Remove(committee);

            Message = "Committee Removed Successfully";

            return RedirectToAction("Index");
        }
    }
}
