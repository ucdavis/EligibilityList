using System.Collections.Generic;
using System.Linq;
using EligibilityList.Core.Domain;
using System.Security.Principal;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace EligibilityListBLL
{
    public interface IUserBLL
    {
        User GetCurrentUser(IPrincipal principal);
        IEnumerable<Unit> GetUnitsByUser(IPrincipal principal);
    }

    /// <summary>
    /// 
    /// </summary>
    public class UserBLL : IUserBLL
    {
        private readonly IRepository<User> _userRepository;
        private readonly IRepository<Unit> _unitRepository;

        public UserBLL(IRepository<User> userRepository, IRepository<Unit> unitRepository)
        {
            _userRepository = userRepository;
            _unitRepository = unitRepository;
        }

        public User GetCurrentUser(IPrincipal principal)
        {
            var username = principal.Identity.Name;

            var user = _userRepository.Queryable.Where(x => x.Login == username).SingleOrDefault();

            Check.Require(user != null, "User not found");

            return user;
        }

        public IEnumerable<Unit> GetUnitsByUser(IPrincipal principal)
        {
            if (principal.IsInRole("Admin"))
            {
                return _unitRepository.Queryable.OrderBy(x => x.ShortName);
            }
            else
            {
                var user = GetCurrentUser(principal);

                return user.Units;
            }
        }
    }
}
