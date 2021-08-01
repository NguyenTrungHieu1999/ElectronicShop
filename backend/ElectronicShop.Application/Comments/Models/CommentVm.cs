using ElectronicShop.Data.Entities;
using System;
using System.Collections.Generic;

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

        public bool Status { get; set; }

        public User User { get; set; }

        public Product Product { get; set; }

        public Comment Parent { get; set; }

        public List<Comment> Children { get; set; }

        public string ParentName { get; set; }
    }
}