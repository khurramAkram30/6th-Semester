//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NationalLevelPaper.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Event
    {
        public Event()
        {
            this.Enrollments = new HashSet<Enrollment>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<decimal> Fees { get; set; }
        public string Eligibility { get; set; }
        public string Spearker { get; set; }
        public string Topics { get; set; }
        public Nullable<decimal> Prize { get; set; }
        public string Email { get; set; }
        public string TermsAndCondition { get; set; }
        public Nullable<int> Winner { get; set; }
    
        public virtual ICollection<Enrollment> Enrollments { get; set; }
        public virtual User User { get; set; }
    }
}