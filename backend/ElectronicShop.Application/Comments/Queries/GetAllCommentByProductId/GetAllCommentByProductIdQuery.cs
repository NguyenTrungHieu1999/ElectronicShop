using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Models;
using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Comments.Queries.GetAllCommentByProductId
{
    public class GetAllCommentQuery : IRequest<ApiResult<List<CommentVm>>>
    {
        public GetAllCommentQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class GetAllCommentHandle : IRequestHandler<GetAllCommentQuery, ApiResult<List<CommentVm>>>
    {
        private readonly ICommentService _commentService;

        public GetAllCommentHandle(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<ApiResult<List<CommentVm>>> Handle(GetAllCommentQuery request, CancellationToken cancellationToken)
        {
            return await _commentService.GetAllByProductIdAsync(request.ProductId);
        }
    }
}