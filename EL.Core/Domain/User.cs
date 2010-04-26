using System;
using System.Collections.Generic;
using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class User : DomainObject<User, int>
    {
        public virtual string Login { get; set; }

        public virtual IList<Unit> Units { get; set; }

        public virtual string FirstName { get; set; }

        public virtual string LastName { get; set; }

        public virtual string EmployeeID { get; set; }

        public virtual string StudentID { get; set; }

        public virtual string SID { get; set; }

        public virtual Guid UserKey { get; set; }

        public virtual bool Inactive { get; set; }

        public static List<string> FindUCDKerberosIDs(string NameToMatch)
        {
            throw new NotImplementedException();
        }
    }
}