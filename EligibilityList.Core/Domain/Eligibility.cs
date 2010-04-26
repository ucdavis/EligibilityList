using System;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;

/// FIXED: Fix error when all records are selected due to not having Action Type due to no data in table

namespace EligibilityList.Core.Domain
{
    // Instance class
    public class Eligibility : DomainObject
    {
        public Eligibility(){}
                
        //[NotNullValidator]
        //[StringLengthValidator(9)]
        //public virtual string EmployeeID { get; set; }
        public virtual Employee Employee { get; set; }

        [NotNull]
        public virtual Unit Unit { get; set; }

        public virtual User Dean { get; set; }

        protected virtual string DeanKerb { get; set; }

        public virtual string DeanSafeName
        {
            get
            {
                if (Dean != null)
                {
                    return Dean.FullName;
                }

                return DeanKerb ?? "No Dean";
            }
        }

        public virtual User Analyst { get; set; }

        protected virtual string AnalystKerb { get; set; }

        public virtual string AnalystSafeName
        {
            get
            {
                if (Analyst != null)
                {
                    return Analyst.FullName;
                }

                return AnalystKerb ?? "No Analyst";
            }
        }

        [NotNull]
        public virtual Action Action { get; set; }

        [NotNull]
        public virtual int YearsAtRank { get; set; }

        [NotNull]
        public virtual int YearsAtStep { get; set; }

        [NotNull]
        [Range(1,100)]
        public virtual decimal CurrentAppointmentPercent { get; set; }

        [NotNull]
        public virtual Committee Committee { get; set; }

        [NotNull]
        public virtual Title CurrentTitle { get; set; }

        [NotNull]
        public virtual Step CurrentStep { get; set; }

        public virtual string CurrentStatus
        {
            get
            {
                return string.Format("{0} Step:{1} {2}%", CurrentTitle.AbbreviatedName, CurrentStep.Name, CurrentAppointmentPercent);
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

        [Length(50)]
        public virtual string CurrentBlankTitle { get; set; }

        public virtual Title ProposedTitle { get; set; }

        //public virtual int? ProposedStep { get; set; }
        public virtual Step ProposedStep { get; set; }

        [Length(50)]
        public virtual string ProposedBlankTitle { get; set; }

        public virtual int? YearsAccelerated { get; set; }

        public virtual int? YearsDecelerated { get; set; }

        public virtual bool? Defer { get; set; }

        public virtual DateTime? DateDue { get; set; }

        public virtual DateTime? DateToCommittee { get; set; }

        public virtual DateTime? DateCommitteeReceived { get; set; }

        public virtual DateTime? DateEffective { get; set; }

        [Length(2048)]
        public virtual string Comment { get; set; }

        public virtual bool? FinalAction { get; set; }

        [Length(4)]
        public virtual string TPCCode { get; set; }

        public virtual int? AppNum { get; set; }

        public virtual DateTime? LastUpdated { get; set; }

        [NotNull]
        public virtual decimal ProposedAppointmentPercent { get; set; }

        [NotNull]
        public virtual bool Inactive { get; set; }

        public virtual Eligibility OriginalEligibility { get; set; }
    }   
}
