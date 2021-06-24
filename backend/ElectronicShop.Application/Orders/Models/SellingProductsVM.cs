using ElectronicShop.Data.Enums;

namespace ElectronicShop.Application.Orders.Models
{
    public class SellingProductsVM
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public ProductStatus Status { get; set; }
    }
}