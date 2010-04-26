using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.EL.BLL;
using System.ComponentModel;
using EL.Core.Domain;
using CAESDO.EL.Data;

namespace EL.BLL
{
    /* ------------  Instance BLLS ----------------------*/
    public class ActionTypeBLL : LookupBLLBase<ActionType, int> { }


    /* ------------ Base Class ------------------------*/
    [DataObject]
    public abstract class LookupBLLBase<T, IdT> : GenericBLL<T, IdT> where T : LookupBase<T, IdT>, new()
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<T> GetActive()
        {
            var obj = new T();
            obj.IsActive = true;

            return LookupBLLBase<T, IdT>.GetByInclusionExample(obj, "Name", true, "IsActive");
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public new static T GetByName(string name)
        {
            var obj = new T();
            obj.Name = name;

            List<T> results = LookupBLLBase<T, IdT>.GetByInclusionExample(obj, "Name");

            if (results.Count() > 0) // check if there were results
            {
                return results[0];  // return the first result
            }
            else
            {
                return null;    // return nothing, no match on the name
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(T obj)
        {
            obj.IsActive = true;    // This value needs to be set to true by default

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(T obj)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static void Delete(T obj)
        {
            var deleteObj = LookupBLLBase<T, IdT>.GetByID(obj.ID);

            deleteObj.IsActive = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref deleteObj);

                ts.CommittTransaction();
            }
        }
    }
}
