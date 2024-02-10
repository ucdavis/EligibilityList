using EligibilityList.Core.Domain;
using System;
using System.Net.Mail;
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
        private static readonly string EmailHost = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailHost"];
        private static readonly int    EmailPort = Convert.ToInt32(System.Web.Configuration.WebConfigurationManager.AppSettings["EmailPort"]);
        private static readonly string EmailUser = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailUser"];
        private static readonly string EmailPassword = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailPassword"];
        private static readonly string EmailFrom = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailFrom"];

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
            //send emails to the editor of this eligibility and the associated analyst, if they exist
            var to = editorEmail;

            var analystEmail = modifiedEligibility.AnalystEmail;

            if (!string.IsNullOrWhiteSpace(analystEmail))
            {
                to += (", " + analystEmail);
            }

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
            var message = new System.Net.Mail.MailMessage(EmailFrom, to, subject, body); 

            var smtpClient = new System.Net.Mail.SmtpClient();
            smtpClient.Host = EmailHost;
            smtpClient.Port = EmailPort;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential(EmailUser, EmailPassword);

            smtpClient.Send(message);
        }
    }
}