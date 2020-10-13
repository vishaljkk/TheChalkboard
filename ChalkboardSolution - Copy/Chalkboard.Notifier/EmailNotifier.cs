using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Notifier
{
    public class EmailNotifier : INotifier
    {
        public bool Send(NotificationModel notificationModel)
        {
            try
            {
                
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress(notificationModel.From);
                message.To.Add(notificationModel.To);
                message.CC.Add(notificationModel.Cc);
                message.Bcc.Add(notificationModel.BCc);
                message.Subject = notificationModel.Subject;
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = notificationModel.Body;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("ashwin225@gmail.com", "P@ss1onC1n3ma");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
