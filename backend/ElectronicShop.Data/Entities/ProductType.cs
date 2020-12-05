using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class ProductType
    {
        public int Id { get; set; }

        public string Icon { get; set; }

        public string Name { get; set; }

        public bool Status { get; set; }

        public List<Category> Categories { get; set; }
    }
}
