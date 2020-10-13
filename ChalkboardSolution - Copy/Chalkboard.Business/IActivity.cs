using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface IActivity
    {
        ActivityModel CreateOrUpdateActivity(ActivityModel activityModel);
        bool PublishActivity(int activityId);

    }
}
