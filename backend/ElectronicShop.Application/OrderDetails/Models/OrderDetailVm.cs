using System.ComponentModel.DataAnnotations;

namespace ElectronicShop.Application.OrderDetails.Models
{
    public class OrderDetailVm
    {
        [Required]
        public int ProductId { get; set; }

        [Required]
        public int Quantity { get; set; }

        [Required]
        public decimal Price { get; set; }
    }
}