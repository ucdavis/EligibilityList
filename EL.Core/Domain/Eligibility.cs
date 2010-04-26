using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using EL.Core.Domain;

namespace EL.Core.Domain
{
    // Instance class
    public class Eligibility : DomainObject<Eligibility, int>
    {
        public Eligibility(){}

        [NotNullValidator]
        [StringLengthValidator(9)]
        public virtual string EmployeeID { get; set; }

        [NotNullValidator]
        [StringLengthValidator(6)]
        public virtual string DeptCode { get; set; }

        [NotNullValidator]
        public virtual int DeanID { get; set; }

        [NotNullValidator]
        public virtual int AnalystID { get; set; }

        [NotNullValidator]
        public virtual int ActionID { get; set; }

        [NotNullValidator]
        public virtual int YearsAtRank { get; set; }

        [NotNullValidator]
        public virtual int YearsAtStep { get; set; }

        [NotNullValidator]
        public virtual decimal AppointmentPercent { get; set; }

        [NotNullValidator]
        public virtual int CommitteeID { get; set; }

        [NotNullValidator]
        [StringLengthValidator(4)]
        public virtual string TitleCode { get; set; }

        [NotNullValidator]
        public virtual int CurrentStep { get; set; }

        [StringLengthValidator(50)]
        public virtual string CurrentBlankTitle { get; set; }

        [StringLengthValidator(4)]
        public virtual string ProposedTitleCode { get; set; }

        public virtual int? ProposedStep { get; set; }

        [StringLengthValidator(50)]
        public virtual string ProposedBlankTitle { get; set; }

        public virtual int? YearsAccelerated { get; set; }

        public virtual int? YearsDecelerated { get; set; }

        public virtual bool? Defer { get; set; }

        public virtual DateTime? DateDue { get; set; }

        public virtual DateTime? DateToCommittee { get; set; }

        public virtual DateTime? DateCommitteeReceived { get; set; }

        public virtual DateTime? DateEffective { get; set; }

        [StringLengthValidator(2048)]
        public virtual string Comment { get; set; }

        public virtual bool? FinalAction { get; set; }

        [StringLengthValidator(4)]
        public virtual string TPCCode { get; set; }

        public virtual int? AppNum { get; set; }

        public virtual DateTime? LastUpdated { get; set; }

        [NotNullValidator]
        public virtual decimal ProposedAppointmentPercent { get; set; }

        [NotNullValidator]
        public virtual bool IsActive { get; set; }
    }   
}
