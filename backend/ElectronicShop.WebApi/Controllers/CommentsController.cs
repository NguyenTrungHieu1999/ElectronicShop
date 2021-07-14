using System.Threading.Tasks;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.DisableOrEnableComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Comments.Queries.GetAllComment;
using ElectronicShop.Application.Comments.Queries.GetAllCommentByProductId;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
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
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create(CreateCommentCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpGet("{productId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllByProductId(int productId)
        {
            var query = new GetAllCommentByProductIdQuery(productId);
            return Ok(await _mediator.Send(query));
        }

        [HttpGet]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _mediator.Send(new GetAllCommentQuery()));
        }

        [HttpPut("disable-or-enable/{commentId}")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> DisableOrEnable(int commentId)
        {
            return Ok(await _mediator.Send(new DisableOrEnableCommentCommand(commentId)));
        }

        [HttpPut("edit")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Edit(EditCommentCommand command)
        {
            return Ok(await _mediator.Send(command));
        }
    }
}