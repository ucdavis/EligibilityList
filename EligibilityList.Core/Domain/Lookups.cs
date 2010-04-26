using UCDArch.Core.DomainModel;
using UCDArch.Core.NHibernateValidator.Extensions;
using NHibernate.Validator.Constraints;

namespace EligibilityList.Core.Domain
{
    //Instances
    public abstract class LookupObject : DomainObject
    {
        [Length(50)]
        [Required]
        public virtual string Name { get; set; }

        public virtual bool Inactive { get; set; }
    }
}
