namespace ElectronicShop.Application.Orders.Models
{
    public class OrderVm
    {
        public int ProductId { get; set; }
        public int CateId { get;set; }
        public int OrderId { get; set; }
        public string Alias { get; set; }
        public string ProductName { get; set; }
        public string ProductPhoto { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }
        public string OrderStatus { get; set; }
    }
}