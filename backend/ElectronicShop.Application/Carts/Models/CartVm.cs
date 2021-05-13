using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Carts.Models
{
    public class CartVm
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}