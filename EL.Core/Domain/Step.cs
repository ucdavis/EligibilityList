using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class Step : DomainObject<Step, int>
    {
        public virtual string Name { get; set; }

        public Step()
        {
                
        }
    }
}
