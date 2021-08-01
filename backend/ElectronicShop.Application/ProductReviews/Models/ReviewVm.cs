using System;

namespace ElectronicShop.Application.ProductReviews.Models
{
    public class ReviewVm
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public double RateStar { get; set; }
        public string Text { get; set; }
        public DateTime CreateDate { get; set; }
        public bool Status { get; set; }      
        public string UserName { get; set; }
    }
}