using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Chalkboard.ViewModel
{
    public class GroupModel
    {
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public List<GroupMemberModel> GroupMembers { get; set; }
        public List<ActivityModel> ActivityModels { get; set; }
        public string Path { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    }

    public class GroupMemberModel
    {
        public int GroupMemberId { get; set; }
        public int GroupRoleId { get; set; }
        public ProfileModel Profile { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    }

    public class ActivityModel
    {
        public int ActivityId { get; set; }
        public int ActivityTypeId { get; set; }
        public string ActivityName { get; set; }
        public string ActivityDescription { get; set; }
        public int GroupId { get; set; }
        public Nullable<System.DateTime> ActivityStartDate { get; set; }
        public Nullable<System.DateTime> ActivityEndDate { get; set; }
        public List<ActivityEntryModel> ActivityEntryModels { get; set; }
        public bool IsPublished { get; set; }
        public string ActivityImages { get; set; }
        public HttpPostedFileBase[] Images { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    }

    public class ActivityEntryModel
    {
        public int ActivityEntryId { get; set; }
        public int ProfileId { get; set; }
        public byte[] Entry { get; set; }
        public EntryContent EntryContent { get; set; }
        public string ActivityEntryPath { get; set; }
        public bool IsPublished { get; set; }
        public HttpPostedFileBase[] Images { get; set; }
        public int ActivityId { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    }
}
