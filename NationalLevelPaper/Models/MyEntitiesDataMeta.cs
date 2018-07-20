using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NationalLevelPaper.Models
{



    public class UserMetaData
    {

        
        [Required]
        [StringLength(50,MinimumLength=3)]
        public string Name { get; set; }
                [Required]

            public Nullable<int> Age { get; set; }
                [Required]
        
            public string Qualification { get; set; }
                [Required]
                [StringLength(50, MinimumLength = 10)]
            public string Address { get; set; }
                [Required]
        [DataType(DataType.PhoneNumber)]
         public string Phone { get; set; }
                 [Required]
                [DataType(DataType.EmailAddress)]
           public string Email { get; set; }
                [Required]
                [DataType(DataType.Password)]
            public string Password { get; set; }
    }

    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {

    }
}