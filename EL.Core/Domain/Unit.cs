using CAESArch.Core.Domain;

namespace EL.Core.Domain
{
    public class Unit : DomainObject<Unit, string>
    {
        public virtual string ShortName { get; set; }

        public virtual string FullName { get; set; }

        public virtual string PPSCode { get; set; }

        public virtual int UnitID { get; set; }

        public virtual string SchoolCode { get; set; }

        public Unit(string fisCode)
        {
            this.id = fisCode;
        }

        public Unit()
        {
        }
    }
}