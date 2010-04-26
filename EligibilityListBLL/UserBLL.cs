using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
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
        IDictionary<string, string> GetUsersInRole(string role);
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

        /// <summary>
        /// Return the user represented by the given login
        /// </summary>
        /// <param name="login">Kerberos login ID</param>
        /// <returns>User or null if no user found</returns>
        public User GetByLogin(string login)
        {
            var user = _userRepository.Queryable.Where(x => x.Login == login).SingleOrDefault();

            return user;
        }

        public IDictionary<string, string> GetUsersInRole(string role)
        {
            //Return a list of users in the role given
            var usersInRole = Roles.GetUsersInRole(role);

            var userDictionary = new Dictionary<string, string>();

            foreach (var login in usersInRole)
            {
                string userName = login;
                
                var user = _userRepository.Queryable.Where(x => x.Login == userName).SingleOrDefault();

                if (user != null)
                {
                    userName = user.FullName;
                }

                userDictionary.Add(login, userName);
            }

            return userDictionary;
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
