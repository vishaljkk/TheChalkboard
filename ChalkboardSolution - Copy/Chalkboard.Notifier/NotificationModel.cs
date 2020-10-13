using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Notifier
{
    /// <summary>
    /// Model for Notifications
    /// </summary>
    public class NotificationModel
    {
        public string From { get; set; }
        public string To { get; set; }
        public string Cc { get; set; }
        public string BCc { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public Dictionary<string, byte[]> Attachments { get; set; }

    }
}
