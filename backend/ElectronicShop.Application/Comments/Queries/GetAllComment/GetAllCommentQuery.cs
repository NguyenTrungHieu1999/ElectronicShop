using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Comments.Queries.GetAllComment
{
    public class GetAllCommentQuery : IRequest<ApiResult<List<Comment>>>
    {
    }

    public class GetAllCommentHandle : IRequestHandler<GetAllCommentQuery, ApiResult<List<Comment>>>
    {
        private readonly ICommentService _service;

        public GetAllCommentHandle(ICommentService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<Comment>>> Handle(GetAllCommentQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetAllAsync();
        }
    }
}
