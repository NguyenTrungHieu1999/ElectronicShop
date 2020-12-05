using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.DeleteUser;
using ElectronicShop.Application.Users.Commands.DisableAccount;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Queries.GetAllUser;
using ElectronicShop.Application.Users.Queries.GetUserById;
using ElectronicShop.Data.Entities;
using ElectronicShop.Utilities.Session;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
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
        public async Task<IActionResult> Create([FromBody] CreateUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }
        
        [HttpPut("update")]
        [Authorize(Roles = "Admin")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }
        
        [HttpPut("update/me")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> UpdateMe([FromBody] UpdateUserCommand request)
        {
            var userId =  _httpContextAccessor.HttpContext.Session
                .GetComplexData<User>(Constants.CURRENTUSER).Id;

            if (userId.Equals(request.Id))
            {
                var result = await _mediator.Send(request);

                return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
            }

            return BadRequest();
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
        
        [HttpPut("disable/{userId}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DisableAccount(int userId)
        {
            var query = new DisableAccountCommand(userId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }
        
        [HttpGet("{userId}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetUserById (int userId)
        {
            var query = new GetByIdUserQuery(userId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }

        [HttpGet("me")]
        [Authorize]
        public async Task<IActionResult> GetProfile()
        {
            var userId =  _httpContextAccessor.HttpContext.Session
                .GetComplexData<User>(Constants.CURRENTUSER).Id;

            var query = new GetByIdUserQuery(userId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }
        
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAllUser()
        {
            var query = new GetAllUserQuery();

            var result = await _mediator.Send(query);

            return Ok(result);
        }
    }
}
