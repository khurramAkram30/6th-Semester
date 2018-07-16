using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NationalLevelPaper.Models;

namespace NationalLevelPaper.ViewModel
{
    public class Multipledata
    {
        public IEnumerable<User> user { get; set; }
        public IEnumerable<Event> events { get; set; }
    }
}