using EligibilityList.Core.Domain;

namespace EligibilityList.Helpers
{
    public class CopyHelper
    {
        public static void TransferAppointmentValuesTo(Eligibility source, Eligibility destination)
        {
            destination.Action = source.Action;
            destination.Committee = source.Committee;
            destination.Dean = source.Dean;
            destination.Analyst = source.Analyst;
            destination.CurrentStep = source.CurrentStep;
            //destination.CurrentAppointmentPercent = source.CurrentAppointmentPercent;
            destination.CurrentBlankTitle = source.CurrentBlankTitle;
            destination.YearsAtRank = source.YearsAtRank;
            destination.YearsAtStep = source.YearsAtStep;

            destination.ProposedStep = source.ProposedStep;
            //destination.ProposedAppointmentPercent = source.ProposedAppointmentPercent;
            destination.ProposedBlankTitle = source.ProposedBlankTitle;

            destination.Defer = source.Defer;
            destination.YearsAccelerated = source.YearsAccelerated;
            destination.YearsDecelerated = source.YearsDecelerated;

            destination.DateDue = source.DateDue;
            destination.DateEffective = source.DateEffective;

            destination.Comment = source.Comment;
        }

        public static void TransferValuesTo(Eligibility source, Eligibility destination)
        {
            destination.Employee = source.Employee;

            destination.Unit = source.Unit;
            destination.Action = source.Action;
            destination.Committee = source.Committee;
            destination.Dean = source.Dean;
            destination.Analyst = source.Analyst;
            destination.CurrentTitle = source.CurrentTitle;
            destination.CurrentStep = source.CurrentStep;
            destination.CurrentAppointmentPercent = source.CurrentAppointmentPercent;
            destination.CurrentBlankTitle = source.CurrentBlankTitle;
            destination.YearsAtRank = source.YearsAtRank;
            destination.YearsAtStep = source.YearsAtStep;

            destination.ProposedTitle = source.ProposedTitle;
            destination.ProposedStep = source.ProposedStep;
            destination.ProposedAppointmentPercent = source.ProposedAppointmentPercent;
            destination.ProposedBlankTitle = source.ProposedBlankTitle;

            destination.Defer = source.Defer;
            destination.YearsAccelerated = source.YearsAccelerated;
            destination.YearsDecelerated = source.YearsDecelerated;

            destination.DateDue = source.DateDue;
            destination.DateEffective = source.DateEffective;

            destination.Comment = source.Comment;
        }
    }
}