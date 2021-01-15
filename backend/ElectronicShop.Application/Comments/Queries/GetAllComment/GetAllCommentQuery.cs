using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Comments.Queries.GetAllComment
{
    public class GetAllCommentQuery : IRequest<ApiResult<List<Comment>>>
    {
        
    }
    
    public class GetAllCommentHandle : IRequestHandler<GetAllCommentQuery, ApiResult<List<Comment>>>
    {
        private readonly ICommentService _commentService;

        public GetAllCommentHandle(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<ApiResult<List<Comment>>> Handle(GetAllCommentQuery request, CancellationToken cancellationToken)
        {
            return await _commentService.GetAllAsync();
        }
    }
}