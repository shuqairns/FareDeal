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
    
    public partial class photo
    {
        public System.Guid id { get; set; }
        public System.Guid vanue_id { get; set; }
        public string pic_url { get; set; }
    
        public virtual venue venue { get; set; }
    }
}
