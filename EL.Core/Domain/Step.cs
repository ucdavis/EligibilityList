using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class Step : DomainObject<Step, int>
    {
        public virtual string Name { get; set; }
    }
}
