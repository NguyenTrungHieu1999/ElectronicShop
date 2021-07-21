using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.DeleteUser;
using ElectronicShop.Application.Users.Commands.DisableAccount;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Queries.GetAllUser;
using ElectronicShop.Application.Users.Queries.GetLoginHistory;
using ElectronicShop.Application.Users.Queries.GetUserById;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.EnableAccount;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : BaseController
    {
        private readonly IMediator _mediator;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public UsersController(IMediator mediator, IHttpContextAccessor httpContextAccessor)
        {
            _mediator = mediator;
            _httpContextAccessor = httpContextAccessor;
        }

        [HttpPost("create")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        [AllowAnonymous]
        public async Task<IActionResult> Create([FromBody] CreateUserCommand request)
        {
            return Ok(await _mediator.Send(request));
        }

        [HttpPut("update")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> Update([FromBody] UpdateUserCommand request)
        {
            return Ok(await _mediator.Send(request));
        }

        [HttpPut("update/me")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> UpdateMe([FromBody] UpdateUserCommand request)
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            return !userId.Equals(request.Id.ToString()) ? Ok(new ApiErrorResult<string>("Thông tin chỉnh sửa không khớp với người dùng hiện tại.")) : Ok(await _mediator.Send(request));
        }

        [HttpDelete("delete/{userId}")]
        [Authorize(Roles = Constants.ADMIN)]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Delete(int userId)
        {
            var query = new DeleteUserCommand(userId);

            return Ok(await _mediator.Send(query));
        }

        [HttpPut("disable/{userId}")]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> DisableAccount(int userId)
        {
            var command = new DisableAccountCommand(userId);

            return Ok(await _mediator.Send(command));
        }

        [HttpPut("enable/{userId}")]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> EnableAccount(int userId)
        {
            return Ok(await _mediator.Send(new EnableAccountCommand(userId)));
        }

        [HttpGet("{userId}")]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> GetUserById(int userId)
        {
            var query = new GetByIdUserQuery(userId);

            return Ok(await _mediator.Send(query));
        }

        [HttpGet("me")]
        [Authorize]
        public async Task<IActionResult> GetProfile()
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var query = new GetByIdUserQuery(int.Parse(userId));

            return Ok(await _mediator.Send(query));
        }

        [HttpGet("get-all")]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> GetAllUser()
        {
            var query = new GetAllUserQuery();

            return Ok(await _mediator.Send(query));
        }

        [HttpGet("get-login-history")]
        [Authorize(Roles = Constants.ADMIN)]
        public async Task<IActionResult> GetLoginHistory([FromQuery] GetLoginHistoryQuery query)
        {            
            return Ok(await _mediator.Send(query));
        }
    }
}
