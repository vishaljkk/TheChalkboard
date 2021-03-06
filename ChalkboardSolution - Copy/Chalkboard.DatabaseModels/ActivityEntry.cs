//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Chalkboard.DatabaseModels
{
    using System;
    using System.Collections.Generic;
    
    public partial class ActivityEntry
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ActivityEntry()
        {
            this.ActivityEntryComments = new HashSet<ActivityEntryComment>();
            this.ActivityEntryReactions = new HashSet<ActivityEntryReaction>();
            this.ActivityEntryFlags = new HashSet<ActivityEntryFlag>();
        }
    
        public int Id { get; set; }
        public int ActivitiesId { get; set; }
        public int UserId { get; set; }
        public byte[] Entry { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public bool IsPublished { get; set; }
    
        public virtual Activity Activity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ActivityEntryComment> ActivityEntryComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ActivityEntryReaction> ActivityEntryReactions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ActivityEntryFlag> ActivityEntryFlags { get; set; }
        public virtual Profile Profile { get; set; }
    }
}
