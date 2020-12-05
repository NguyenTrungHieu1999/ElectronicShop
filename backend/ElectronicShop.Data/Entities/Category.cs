using System;
using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class Category
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

        public List<Product> Products { get; set; }

        public ProductType ProductType { get; set; }
    
        public Category Parent { get; set; }

        public List<Category> Children { get; set; }
    }
}
