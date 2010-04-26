using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EL.Core.Domain
{
    public class Department : DomainObject<Department, string>
    {
        public virtual string Abbreviation { get; set; }
        
        public Department()
        {

        }

        public Department(string homeDeptNo)
        {
            this.id = homeDeptNo;
        }
    }
}
