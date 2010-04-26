using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using EL.Core.Domain;

namespace EL.Core.Domain
{
    //Instances
    public class ActionType : LookupBase<ActionType, int> {}
    
    //Base Class
    public abstract class LookupBase<T, IdT> : DomainObject<T, IdT>
    {
        public LookupBase() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }

        [NotNullValidator]
        public virtual bool IsActive { get; set; }
    }
}
