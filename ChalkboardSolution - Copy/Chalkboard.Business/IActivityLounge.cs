using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface IActivityLounge
    {
        /// <summary>
        /// Get All Groups based on profile Id
        /// </summary>
        /// <param name="profileId"></param>
        /// <returns></returns>
        List<GroupModel> GetAllGroups(int profileId);
        /// <summary>
        /// Get GroupAdmins based on group ids
        /// </summary>
        /// <param name="groupIds"></param>
        /// <returns></returns>
        List<ProfileModel> GetGroupAdmins(List<int> groupIds);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="activityId"></param>
        /// <returns></returns>
        List<ActivityEntryModel> ListActivityEntries(int activityId);
    }
}
