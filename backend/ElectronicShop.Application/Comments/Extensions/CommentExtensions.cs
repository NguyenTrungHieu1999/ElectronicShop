using System;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Comments.Extensions
{
    public static class CommentExtensions
    {
        public static void Map(this Comment comment, EditCommentCommand command)
        {
            comment.Text = command.Text;
            comment.ModifiedDate = DateTime.Now;
        }
    }
}