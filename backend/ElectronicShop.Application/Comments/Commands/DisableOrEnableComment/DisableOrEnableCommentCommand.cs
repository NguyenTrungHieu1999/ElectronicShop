using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Comments.Commands.DisableOrEnableComment
{
    public class DisableOrEnableCommentCommand : IRequest<ApiResult<string>>
    {
        public int CommentId { get; }

        public DisableOrEnableCommentCommand(int commentId)
        {
            CommentId = commentId;
        }
    }

    public class DisableOrEnableHandle : IRequestHandler<DisableOrEnableCommentCommand, ApiResult<string>>
    {
        private readonly ICommentService _service;

        public DisableOrEnableHandle(ICommentService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(DisableOrEnableCommentCommand request, CancellationToken cancellationToken)
        {
            return await _service.DisableOrEnableAsync(request.CommentId);
        }
    }
}

