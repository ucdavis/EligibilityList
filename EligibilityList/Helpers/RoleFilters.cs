using System;
using System.Web.Mvc;

namespace EligibilityList.Helpers
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AdminOnlyAttribute : AuthorizeAttribute
    {
        public AdminOnlyAttribute()
        {
            Roles = RoleNames.Admin;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class UserManagerOnly : AuthorizeAttribute
    {
        public UserManagerOnly()
        {
            Roles = RoleNames.ManageAllUsers;
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class UserOnlyAttribute : AuthorizeAttribute
    {
        public UserOnlyAttribute()
        {
            Roles = RoleNames.User;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AnyoneWithRoleAttribute : AuthorizeAttribute
    {
        public AnyoneWithRoleAttribute()
        {
            var allRoles = string.Join(",", new[] {RoleNames.Admin, RoleNames.User, RoleNames.Dean});

            Roles = allRoles;//Set the roles prop to a comma delimited string of allowed roles
        }
    }

    public static class RoleNames
    {
        public static readonly string Admin = "Admin"; //Adminstrator /Analyst
        public static readonly string User = "User"; //Departmental User
        public static readonly string Dean = "Dean"; //Dean
        public static readonly string ManageAllUsers = "ManageAll"; //Manage All Users
    }
}