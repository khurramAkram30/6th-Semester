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
    
    public partial class EnrollementStatus
    {
        public EnrollementStatus()
        {
            this.Enrollments = new HashSet<Enrollment>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Enrollment> Enrollments { get; set; }
    }
}