namespace ElectronicShop.Data.Entities
{
    public class ProductPhoto
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public string Url { get; set; }

        public bool IsDefault { get; set; }

        public Product Product { get; set; }
    }
}
