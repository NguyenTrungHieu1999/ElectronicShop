using System.ComponentModel.DataAnnotations;

namespace ElectronicShop.Application.Carts.Models
{
    public class CartModel
    {
        [Required]
        public int ProductId { get; set; }
        [Required]
        public int Quantity { get; set; }
    }
}