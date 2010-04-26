using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using EL.Core.Domain;

/// FIXED: Fix error when all records are selected due to not having Action Type due to no data in table

namespace EL.Core.Domain
{
    // Instance class
    public class Eligibility : DomainObject<Eligibility, int>
    {
        public Eligibility(){}
                
        //[NotNullValidator]
        //[StringLengthValidator(9)]
        //public virtual string EmployeeID { get; set; }
        public virtual Employee Employee { get; set; }

        //[NotNullValidator]
        //[StringLengthValidator(6)]
        //public virtual string DeptCode { get; set; }
        public virtual Department Department { get; set; }

        [NotNullValidator]
        public virtual int DeanID { get; set; }

        [NotNullValidator]
        public virtual int AnalystID { get; set; }

        //[NotNullValidator]
        //public virtual int ActionID { get; set; }
        public virtual Action Action { get; set; }

        [NotNullValidator]
        public virtual int YearsAtRank { get; set; }

        [NotNullValidator]
        public virtual int YearsAtStep { get; set; }

        [NotNullValidator]
        public virtual decimal AppointmentPercent { get; set; }

        [NotNullValidator]
        public virtual int CommitteeID { get; set; }

        //[NotNullValidator]
        //[StringLengthValidator(4)]
        //public virtual string TitleCode { get; set; }
        public virtual Title CurrentTitle { get; set; }

        //[NotNullValidator]
        //public virtual int CurrentStep { get; set; }
        public virtual Step CurrentStep { get; set; }

        public virtual string CurrentStatus
        {
            get
            {
                return string.Format("{0} Step:{1} {2}%", CurrentTitle.AbbreviatedName, CurrentStep.Name, AppointmentPercent);
            }
        }

        public virtual string ProposedStatus
        {
            get
            {
                if (ProposedTitle == null)
                    return "No Title";
                else
                    return string.Format("{0} Step:{1} {2}%", ProposedTitle.AbbreviatedName, ProposedStep.Name, ProposedAppointmentPercent);
            }
        }
        [StringLengthValidator(50)]
        public virtual string CurrentBlankTitle { get; set; }

        //[StringLengthValidator(4)]
        //public virtual string ProposedTitleCode { get; set; }
        [IgnoreNulls]
        public virtual Title ProposedTitle { get; set; }

        //public virtual int? ProposedStep { get; set; }
        public virtual Step ProposedStep { get; set; }

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

        [IgnoreNulls]
        public virtual Eligibility OriginalEligibility { get; set; }
    }   
}
