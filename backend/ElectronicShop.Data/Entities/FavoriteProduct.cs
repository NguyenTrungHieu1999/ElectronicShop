﻿namespace ElectronicShop.Data.Entities
{
    public class FavoriteProduct
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int ProductId { get; set; }
        
        public bool Status { get; set; }

        public User User { get; set; }

        public Product Product { get; set; }
    }
}