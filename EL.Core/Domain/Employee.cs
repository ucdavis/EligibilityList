using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
    }
}
