//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FareDeal.Service.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class venue
    {
        public venue()
        {
            this.deals = new HashSet<deal>();
        }
    
        public System.Guid Id { get; set; }
        public string name { get; set; }
        public bool chain { get; set; }
        public string url { get; set; }
        public bool verified { get; set; }
        public string status { get; set; }
        public bool hasMenu { get; set; }
        public short priceTier { get; set; }
        public string defaultPicUrl { get; set; }
        public bool isOpen { get; set; }
        public Nullable<int> likes { get; set; }
        public Nullable<int> favourites { get; set; }
        public string contactName { get; set; }
        public string phone { get; set; }
        public string weekdayHours { get; set; }
        public string weekendHours { get; set; }
    
        public virtual ICollection<deal> deals { get; set; }
        public virtual category category { get; set; }
        public virtual location location { get; set; }
    }
}
