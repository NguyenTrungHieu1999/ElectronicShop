using ElectronicShop.Application.Users.Command;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UsersController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost]
        [AllowAnonymous]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Register([FromBody] RegisterUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        [HttpPut]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        [HttpDelete("delete/{userId}")]
        [Authorize(Roles = "Admin")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Delete(int userId)
        {
            var query = new DeleteUserCommand(userId);

            var result = await _mediator.Send(query);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }
    }
}
