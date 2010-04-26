using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class Unit : DomainObject
    {
        public virtual string ShortName { get; set; }

        public virtual string FullName { get; set; }

        public virtual string PPSCode { get; set; }

        public virtual string FISCode { get; set; }

        public virtual string SchoolCode { get; set; }
    }
}