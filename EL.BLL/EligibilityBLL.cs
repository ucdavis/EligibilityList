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
    [DataObject]
    public class EligibilityBLL : GenericBLL<Eligibility, int>
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Eligibility> GetActive()
        {
            return Queryable.Where(el => el.IsActive == true).ToList();
            //var obj = new Eligibility();
            //obj.IsActive = true;
            //return EligibilityBLL.GetByInclusionExample(obj, "EmployeeID", true, "IsActive");
            //return EligibilityBLL.GetAll();
            //var query = 
        }
    }
}
