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
    
    public partial class credit_master
    {
        public credit_master()
        {
            this.credit_transactions = new HashSet<credit_transactions>();
        }
    
        public System.Guid id { get; set; }
        public int credit { get; set; }
        public decimal purchase_value { get; set; }
    
        public virtual ICollection<credit_transactions> credit_transactions { get; set; }
    }
}
