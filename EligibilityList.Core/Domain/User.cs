using System;
using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class User : DomainObject
    {
        public virtual string Login { get; set; }

        public virtual IList<Unit> Units { get; set; }

        public virtual string Email { get; set; }

        public virtual string FirstName { get; set; }

        public virtual string LastName { get; set; }

        public virtual string EmployeeID { get; set; }

        public virtual string SID { get; set; }

        public virtual Guid UserKey { get; set; }

        public virtual string FullName
        {
            get
            {
                return string.Format("{0} {1}", FirstName, LastName);
            }
        }

        public User()
        {
            Units = new List<Unit>();
        }
    }
}