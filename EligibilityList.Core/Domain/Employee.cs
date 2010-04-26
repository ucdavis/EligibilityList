using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class Employee : DomainObjectWithTypedId<string>, IHasAssignedId<string>
    {
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string FullName { get; set; }

        public Employee()
        {

        }

        public Employee(string id)
        {
            Id = id;
        }

        public virtual void SetAssignedIdTo(string assignedId)
        {
            Id = assignedId;
        }
    }
}
