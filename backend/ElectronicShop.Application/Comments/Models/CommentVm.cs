using System;

namespace ElectronicShop.Application.Comments.Models
{
    public class CommentVm
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int ProductId { get; set; }

        public int? ParentId { get; set; }

        public string Text { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string UserName { get; set; }
    }
}