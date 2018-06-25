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
    
    public partial class User
    {
        public User()
        {
            this.Enrollments = new HashSet<Enrollment>();
            this.Events = new HashSet<Event>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int UserTypeId { get; set; }
    
        public virtual ICollection<Enrollment> Enrollments { get; set; }
        public virtual ICollection<Event> Events { get; set; }
        public virtual UserType UserType { get; set; }
    }
}