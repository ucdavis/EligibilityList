using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class Title : DomainObjectWithTypedId<string>
    {
        public virtual string AbbreviatedName { get; set; }

        public Title()
        {

        }

        public Title(string id)
        {
            Id = id;
        }
    
    }
}
