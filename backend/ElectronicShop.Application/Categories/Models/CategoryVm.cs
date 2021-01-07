using System;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Categories.Models
{
    public class CategoryVm
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Alias { get; set; }

        public int? RootId { get; set; }

        public int ProductTypeId { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public DateTime? ModifiedDate { get; set; }
        
        public string CreatedBy { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public ProductType ProductType { get; set; }
    }
}