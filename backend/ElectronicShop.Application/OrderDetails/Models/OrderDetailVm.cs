namespace ElectronicShop.Application.OrderDetails.Models
{
    public class OrderDetailVm
    {
        public int ProductId { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }
    }
}