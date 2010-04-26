using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class Action : DomainObject<Action, int>
    {
        public virtual string Name { get; set; }
    }
}
