using System;

namespace EligibilityListBLL
{
    public interface IMessageBLL
    {
        /// <summary>
        /// Send a review message notifying the admins of the need to review an eligibility
        /// </summary>
        /// <param name="id">Id of the Eligibility to be reviewed</param>
        void SendReviewMessage(int id);
    }

    public class SmtpMessageBLL : IMessageBLL
    {
        /// <summary>
        /// Send a review message notifying the admins of the need to review an eligibility
        /// </summary>
        /// <param name="id">Id of the Eligibility to be reviewed</param>
        public void SendReviewMessage(int id)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Generic method to send a message using SMTP
        /// </summary>
        private void SendMessage(string to, string subject, string body)
        {
            var message = new System.Net.Mail.MailMessage("automatedemail@caes.ucdavis.edu", to, subject, body);
            
            var smtpClient = new System.Net.Mail.SmtpClient();

            smtpClient.Send(message);
        }
    }
}