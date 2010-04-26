using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EL.Core.Domain
{
    public class Title : DomainObject<Title, string>
    {
        public virtual string AbbreviatedName { get; set; }

        public Title()
        {

        }

        public Title(string ID)
        {
            this.id = ID;
        }
    
    }
}
