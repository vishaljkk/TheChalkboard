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
    
    public partial class GroupCategory
    {
        public int Id { get; set; }
        public int GroupId { get; set; }
        public int CategoryId { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Group Group { get; set; }
    }
}
