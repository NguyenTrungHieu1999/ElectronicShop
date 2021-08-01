using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Comments.Commands.DeleteComment
{
    public class DeleteCommentCommand : IRequest<ApiResult<string>>
    {
        public int CommentId { get; set; }

        public DeleteCommentCommand(int commentId)
        {
            CommentId = commentId;
        }
    }

    public class DeleteCommentHandle : IRequestHandler<DeleteCommentCommand, ApiResult<string>>
    {
        private readonly ICommentService _service;

        public DeleteCommentHandle(ICommentService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(DeleteCommentCommand request, CancellationToken cancellationToken)
        {
            return await _service.DeleteAsync(request.CommentId);
        }
    }
}
