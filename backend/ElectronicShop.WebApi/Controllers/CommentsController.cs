using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Queries.GetAllCommentByProductId;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentsController : BaseController
    {
        private readonly IMediator _mediator;

        public CommentsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [Authorize]
        public async Task<IActionResult> Create(CreateCommentCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpGet("{productId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllByProductId(int productId)
        {
            var query = new GetAllCommentQuery(productId);
            return Ok(await _mediator.Send(query));
        }
    }
}