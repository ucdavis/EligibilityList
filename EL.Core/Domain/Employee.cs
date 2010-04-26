using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class Employee : DomainObject<Employee, string>
    {
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string FullName { get; set; }

        public Employee()
        {

        }

        public Employee(string ID)
        {
            this.id = ID;
        }
    }
}
