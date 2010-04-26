using System;
using UCDArch.Core.DomainModel;

namespace EligibilityList.Core.Queries
{
    public class EligibilityListQuery : DomainObject
    {
        public virtual string Name { get; set; }

        public virtual string ActionType { get; set; }

        public virtual string FisCode { get; set; }

        public virtual int YearsAtRank { get; set; }
        public virtual int YearsAtStep { get; set; }
        public virtual int? YearsAccelerated { get; set; }
        public virtual int? YearsDecelerated { get; set; }

        public virtual string Committee { get; set; }

        public virtual DateTime? DateDue { get; set; }

        public virtual bool Defer { get; set; }
        public virtual bool HasOriginalEligibility { get; set; }

        public virtual decimal CurrentAppointmentPercent { get; set; }
        public virtual string CurrentTitle { get; set; }
        public virtual string CurrentStep { get; set; }
        public virtual string CurrentStatus { get; set; }

        public virtual decimal ProposedAppointmentPercent { get; set; }
        public virtual string ProposedTitle { get; set; }
        public virtual string ProposedStep { get; set; }
        public virtual string ProposedStatus { get; set; }
    }
}