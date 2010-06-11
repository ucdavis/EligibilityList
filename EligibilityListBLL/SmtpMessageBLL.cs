using EligibilityList.Core.Domain;
using System.Text;

namespace EligibilityListBLL
{
    public interface IMessageBLL
    {
        /// <summary>
        /// Send a review message notifying the admins of the need to review an eligibility
        /// </summary>
        /// <param name="modifiedEligibility">Eligibility that was reviewed</param>
        /// <param name="comments">Review Comment</param>
        /// <param name="accepted">True if accepted, false if rejected</param>
        /// <param name="editorEmail">Email of the editor who should get a copy of the review</param>
        void SendReviewMessage(Eligibility modifiedEligibility, string comments, bool accepted, string editorEmail);
    }

    public class SmtpMessageBLL : IMessageBLL
    {
        public static readonly string ReviewSubject = "CAESDO Eligibility List Review for {0}";

        /// <summary>
        /// Send a review message notifying the admins of the need to review an eligibility
        /// </summary>
        /// <param name="modifiedEligibility">Eligibility that was reviewed</param>
        /// <param name="comments">Review Comment</param>
        /// <param name="accepted">True if accepted, false if rejected</param>
        /// <param name="editorEmail">Email of the editor who should get a copy of the review</param>
        public void SendReviewMessage(Eligibility modifiedEligibility, string comments, bool accepted, string editorEmail)
        {
            //send emails to the editor of this eligibility and the associated analyst
            var to = editorEmail + ", " + modifiedEligibility.AnalystEmail;

            var subject = string.Format(ReviewSubject, modifiedEligibility.Employee.FullName);

            var body = new StringBuilder();
            body.AppendLine("An Eligibility List Review Has Been " + (accepted ? "Accepted" : "Rejected") + " With The Following Comments (If Any): ");
            body.AppendLine("");
            body.AppendLine(comments);

            SendMessage(to, subject, body.ToString());
        }

        /// <summary>
        /// Generic method to send a message using SMTP
        /// </summary>
        private static void SendMessage(string to, string subject, string body)
        {
            var message = new System.Net.Mail.MailMessage("automatedemail@caes.ucdavis.edu", to, subject, body); //TODO: Move to web.config

            var smtpClient = new System.Net.Mail.SmtpClient("smtp.ucdavis.edu");

            smtpClient.Send(message);
        }
    }
}