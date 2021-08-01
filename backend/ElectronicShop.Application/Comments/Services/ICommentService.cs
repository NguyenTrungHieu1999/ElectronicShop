using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Comments.Services
{
    public interface ICommentService
    {
        Task<ApiResult<List<Comment>>> GetAllByProductIdAsync(int productId);
        Task<ApiResult<string>> CreateAsync(CreateCommentCommand command);
        Task<ApiResult<string>> EditAsync(EditCommentCommand command);
        Task<ApiResult<string>> DisableOrEnableAsync(int commentId);
        Task<ApiResult<List<Comment>>> GetAllAsync();
        Task<ApiResult<string>> DeleteAsync(int commentId);
    }
}