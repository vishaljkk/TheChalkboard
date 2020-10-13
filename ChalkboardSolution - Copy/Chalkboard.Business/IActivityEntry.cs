using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface IActivityEntry
    {
        ActivityEntryModel CreateUpdateActivityEntry(ActivityEntryModel activityEntryModel, int pageNo);
        bool PublishActivityEntry(int activityEntryId);

    }
}
