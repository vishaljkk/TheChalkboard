using Chalkboard.Business;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chalkboard.Controllers
{
    public class ActivityLoungeController : BaseController
    {
        private IActivityLounge _activityLounge;

        public ActivityLoungeController()
        {
            _activityLounge = new ActivityLounge();
        }
        // GET: ActivityLounge
        public ActionResult Index()
        {
            var groups = _activityLounge.GetAllGroups(GetSelectedProfile().ProfileId);
            return View("", groups);
        }
        public ActionResult Search(int activityTypeId, List<int> groupIds, List<int> groupMemberIds, List<GroupModel> groups)
        {
            if (activityTypeId > 0)
            {
                foreach (var group in groups)
                {
                    group.ActivityModels = group.ActivityModels.Where(_a => _a.ActivityTypeId == activityTypeId).ToList();
                }
            }
            if (groupIds.Count > 0)
            {
                groups = groups.Where(_g => groupIds.Contains(_g.GroupId)).ToList();
            }
            if (groupMemberIds.Count > 0)
            {
                foreach (var group in groups)
                {
                    group.GroupMembers = group.GroupMembers.Where(_g => groupMemberIds.Contains(_g.GroupMemberId)).ToList();
                }
            }

            return View("", groups);
        }
        public ActionResult ShowAllEntries(int activityId)
        {
            var entries = _activityLounge.ListActivityEntries(activityId);
            return RedirectToAction("", "", entries);
        }

    }
}