using Chalkboard.DatabaseModels;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public class ActivityLounge : BaseBusiness, IActivityLounge
    {

        public ActivityLounge()
        {
        }

        //TODO: List only published Activities
        //TODO: Show only Active Groups and Sub-Groups
        public List<GroupModel> GetAllGroups(int profileId)
        {
            //Get group ids for which the user has access to
            var ownGroups = _chalkboardEntities.GroupMembers.Where(_g => _g.UserId == profileId);
            //If parent group then get all sub groups also
            if (ownGroups.Count(_g => _g.Group.ParentGroupId != null) > 0)
            {
                var parentGroupIds = ownGroups.Where(_g => _g.Group.ParentGroupId == null).Select(_g => _g.Id).ToList();
                var childGroups = _chalkboardEntities.Groups.Include("Activities").Where(_g => parentGroupIds.Contains(_g.ParentGroupId.Value));

                return ownGroups.Select(_c => _c.Group).ToList().Union(childGroups).Select(_c => _mapper.Map<GroupModel>(_c)).ToList();
            }
            return ownGroups.Select(_o => _o.Group).Select(_c => _mapper.Map<GroupModel>(_c)).ToList();
        }

        public List<ProfileModel> GetGroupAdmins(List<int> groupIds)
        {
            var profiles = _chalkboardEntities.GroupMembers.Where(_g => groupIds.Contains(_g.GroupId) && _g.GroupRole.RoleCode == "GA").Select(_g => _mapper.Map<ProfileModel>(_g.Profile)).ToList();
            return profiles;
        }

        //TODO: List only published entries
        public List<ActivityEntryModel> ListActivityEntries(int activityId)
        {
            var entries = _chalkboardEntities.ActivityEntries.Where(_a => _a.ActivitiesId == activityId && _a.IsPublished).ToList();
            var entriesViewModels = _mapper.Map<List<ActivityEntryModel>>(entries);
            string groupPath = entries.First().Activity.Group.Path;

            foreach (var entry in entriesViewModels)
            {
                string result = System.Text.Encoding.UTF8.GetString(entry.Entry);
                entry.EntryContent = (EntryContent)Newtonsoft.Json.JsonConvert.DeserializeObject<EntryContent>(result);
                entry.ActivityEntryPath = $"{groupPath}\\{activityId}\\{entry.ActivityEntryId}";
            }
            return entriesViewModels;
        }



    }
}
//private string GroupFilePath(int groupId, string path = "")
//{
//    var group = _chalkboardEntities.Groups.FirstOrDefault(_g => _g.Id == groupId);
//    path += group.Id.ToString() + "/";
//    while (group.ParentGroupId.HasValue)
//    {
//        GroupFilePath(group.ParentGroupId.Value, path);
//    }
//    return path;
//}
