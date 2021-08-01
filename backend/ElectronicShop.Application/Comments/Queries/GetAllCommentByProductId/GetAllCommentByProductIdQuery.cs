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
    public class GetAllCommentByProductIdQuery : IRequest<ApiResult<List<Comment>>>
    {
        public GetAllCommentByProductIdQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class GetAllCommentHandle : IRequestHandler<GetAllCommentByProductIdQuery, ApiResult<List<Comment>>>
    {
        private readonly ICommentService _commentService;

        public GetAllCommentHandle(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<ApiResult<List<Comment>>> Handle(GetAllCommentByProductIdQuery request, CancellationToken cancellationToken)
        {
            return await _commentService.GetAllByProductIdAsync(request.ProductId);
        }
    }
}