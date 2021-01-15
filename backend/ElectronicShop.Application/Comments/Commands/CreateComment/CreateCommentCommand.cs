using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Comments.Commands.CreateComment
{
    public class CreateCommentCommand : IRequest<ApiResult<string>>
    {
        // public int Id { get; set; }

        // public int UserId { get; set; }

        public int ProductId { get; set; }

        // public int? ParentId { get; set; }

        public string Text { get; set; }

        // public DateTime CreatedDate { get; set; }
        //
        // public DateTime? ModifiedDate { get; set; }
    }
    
    public class CreateCommentHandle : IRequestHandler<CreateCommentCommand, ApiResult<string>>
    {
        private readonly ICommentService _commentService;

        public CreateCommentHandle(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<ApiResult<string>> Handle(CreateCommentCommand request, CancellationToken cancellationToken)
        {
            return await _commentService.CreateAsync(request);
        }
    }
}