using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class Title : DomainObjectWithTypedId<string>
    {
        public virtual string Name { get; set; }

        public virtual string AbbreviatedName { get; set; }
    }
}
