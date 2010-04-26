using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EL.BLL;
using System.ComponentModel;
using EL.Core.Domain;
using EL.Data;

namespace EL.BLL
{
    /// <summary>
    /// <TODO>
    /// Fix GetChanged so that it correctly retrieves OriginalApptID and all associated records
    /// Allows us to display Original & Current values to an Eligibility item
    /// For now Default.aspx is set to use GetActive() but this is not correct
    /// </TODO>
    /// </summary>

    [DataObject]
    public class EligibilityBLL : GenericBLL<Eligibility, int>
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IQueryable<Eligibility> GetActive()
        {
            return Queryable.Where(el => el.IsActive == true);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IQueryable<Eligibility> GetChanged()
        {
            return Queryable.Where(el => el.OriginalEligibility != null);
            //return Queryable.Where(el => el.IsActive == false).ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IQueryable<Eligibility> GetByStatus(bool getAll)
        {
            if (getAll)
            {
                return GetActive();
            }
            else
            {
                return GetChanged();
            }
        }

    }
}
