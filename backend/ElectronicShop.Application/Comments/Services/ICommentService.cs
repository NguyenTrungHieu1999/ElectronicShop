﻿using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Comments.Models;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Comments.Services
{
    public interface ICommentService
    {
        Task<ApiResult<List<CommentVm>>> GetAllByProductIdAsync(int productId);
        Task<ApiResult<string>> CreateAsync(CreateCommentCommand command);
        Task<ApiResult<string>> EditAsync(EditCommentCommand command);
        Task<ApiResult<string>> DisableOrEnableAsync(int commentId);
        Task<ApiResult<List<Comment>>> GetAllAsync();
    }
}