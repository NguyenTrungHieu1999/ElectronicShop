using System;

namespace ElectronicShop.Application.Categories.Models
{
    public class CategoryVm
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Alias { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public DateTime? ModifiedDate { get; set; }
        
        public string CreatedBy { get; set; }
        
        public string ModifiedBy { get; set; }
    }
}