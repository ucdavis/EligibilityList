using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EL.Core.Domain
{
    public class Action : DomainObject<Action, int>
    {
        public virtual string Name { get; set; }

        public Action()
        {

        }
    }
}
