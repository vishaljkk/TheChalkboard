using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chalkboard.ViewModel;

namespace Chalkboard.Business
{
    public class ActivityEntry : BaseBusiness, IActivityEntry
    {
            
        public ActivityEntryModel CreateUpdateActivityEntry(ActivityEntryModel activityEntryModel, int pageNo)
        {
            //throw new NotImplementedException();
            var activityEntry = _mapper.Map<DatabaseModels.ActivityEntry>(activityEntryModel);
            var activity = _chalkboardEntities.Activities.FirstOrDefault(_f => _f.Id == activityEntry.ActivitiesId);
            
            string fileNames = "";
            if (activityEntry.Id == 0)
            {
                _chalkboardEntities.ActivityEntries.Add(activityEntry);
            }
            else
            {
                var activityEntryDb = _chalkboardEntities.ActivityEntries.FirstOrDefault(_a => _a.Id == activityEntry.Id);
                _chalkboardEntities.Entry(activityEntryDb).CurrentValues.SetValues(activityEntry);
            }
            _chalkboardEntities.SaveChanges();

            _mapper.Map<ActivityEntryModel>(activityEntry);

            return activityEntryModel;

        }

        public bool PublishActivityEntry(int activityEntryId)
        {
            throw new NotImplementedException();
        }
    }
}
