using System.Linq;
using System.Security.Principal;
using System.ComponentModel;
using EL.Core.Domain;

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
        public static IQueryable<Eligibility> GetActive(IPrincipal principal)
        {
            return Queryable.Where(el => el.IsActive == true);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IQueryable<Eligibility> GetChanged(IPrincipal principal)
        {
            return Queryable.Where(el => el.OriginalEligibility != null);
            //return Queryable.Where(el => el.IsActive == false).ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IQueryable<Eligibility> GetChanged(bool changed, IPrincipal userContext)
        {
            if (changed)
            {
                return GetChanged(userContext);
            }
            else
            {
                return GetActive(userContext);
            }
        }

    }

    public class EligibilityBLL2 : GenericBLL2<Eligibility,int>
    {
        public IQueryable<Eligibility> GetActive(IPrincipal principal)
        {
            return Repository.Queryable.Where(el => el.IsActive);
        }

        public IQueryable<Eligibility> GetChanged(IPrincipal principal)
        {
            return Repository.Queryable.Where(el => el.OriginalEligibility != null);
        }

        public IQueryable<Eligibility> GetChanged(bool changed, IPrincipal userContext)
        {
            return changed ? GetChanged(userContext) : GetActive(userContext);
        }
    }
}
