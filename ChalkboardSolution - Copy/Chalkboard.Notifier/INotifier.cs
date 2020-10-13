using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Notifier
{
    public interface INotifier
    {
        bool Send(NotificationModel notificationModel);
    }
}
