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
        public static List<Eligibility> GetActive()
        {
            //return Queryable.Where(el => el.EmployeeID.StartsWith("9")).ToList();
            return Queryable.Where(el => el.IsActive == true).ToList();
            //var obj = new Eligibility();
            //obj.IsActive = true;
            //return EligibilityBLL.GetByInclusionExample(obj, "EmployeeID", true, "IsActive");
            //return EligibilityBLL.GetAll();
            //var query = 
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Eligibility> GetChanged()
        {
            return Queryable.Where(el => el.IsActive == false).ToList();
        }

    }
}
