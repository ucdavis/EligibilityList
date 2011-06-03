using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Domain
{
    public class PayrollPerson : DomainObjectWithTypedId<string>
    {
        public virtual string EmployeeID { get; set; }
        public virtual string Department { get; set; }
        public virtual string HomeDepartment { get; set; }
        public virtual string TitleCode { get; set; }
        public virtual string Name { get; set; }
    }
}