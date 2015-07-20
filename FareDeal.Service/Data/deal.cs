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
    
    public partial class deal
    {
        public deal()
        {
            this.deal_transcation = new HashSet<deal_transcation>();
        }
    
        public System.Guid id { get; set; }
        public System.Guid venue_id { get; set; }
        public bool active { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public short tier { get; set; }
        public System.DateTime start_time { get; set; }
        public System.DateTime end_time { get; set; }
        public int original_value { get; set; }
        public int deal_value { get; set; }
        public int credit_required { get; set; }
        public System.Guid deal_category_id { get; set; }
    
        public virtual ICollection<deal_transcation> deal_transcation { get; set; }
        public virtual venue venue { get; set; }
        public virtual deal_category deal_category { get; set; }
    }
}
