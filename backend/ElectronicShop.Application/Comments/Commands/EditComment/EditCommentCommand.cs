using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Comments.Commands.EditComment
{
    public class EditCommentCommand : IRequest<ApiResult<string>>
    {
        public int Id { get; set; }
        
        public int ProductId { get; set; }
        
        public string Text { get; set; }
    }
    
    public class EditCommentHandle: IRequestHandler<EditCommentCommand, ApiResult<string>>
    {
        private readonly ICommentService _commentService;

        public EditCommentHandle(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<ApiResult<string>> Handle(EditCommentCommand request, CancellationToken cancellationToken)
        {
            return await _commentService.EditAsync(request);
        }
    }
}