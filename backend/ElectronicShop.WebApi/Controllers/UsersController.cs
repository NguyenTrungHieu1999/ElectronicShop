using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.DeleteUser;
using ElectronicShop.Application.Users.Commands.DisableAccount;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Queries.GetAllUser;
using ElectronicShop.Application.Users.Queries.GetUserById;
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

        /// <summary>
        /// Đăng ký thông tin tài khoản
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("create")]
        [AllowAnonymous]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromBody] CreateUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        /// <summary>
        /// Cập nhật thông tin người dùng (chức năng dành cho Admin)
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut("update")]
        [Authorize(Roles = "Admin")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateUserCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        /// <summary>
        /// Cập nhật thông tin cá nhân người đăng nhập hiện tại
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut("update/me")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> UpdateMe([FromBody] UpdateUserCommand request)
        {
            // Kiểm tra mã người dùng hiện tại thông qua session và request có khớp không

            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        } 

        /// <summary>
        /// Xóa tài khoản người dùng (chức năng của Admin)
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpDelete("delete/{userId}")]
        [Authorize(Roles = "Admin")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Delete(int userId)
        {
            var query = new DeleteUserCommand(userId);

            var result = await _mediator.Send(query);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        /// <summary>
        /// Khóa tài khoản người dùng (chức năng dành cho Admin)
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpPut("disable/{userId}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DisableAccount(int userId)
        {
            var query = new DisableAccountCommand(userId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }

        /// <summary>
        /// Lấy thông tin người dùng theo mã userId
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("{userId}")]
        [Authorize]
        public async Task<IActionResult> GetUserById (int userId)
        {
            var query = new GetByIdUserQuery(userId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }

        /// <summary>
        /// Lấy thông tin của tất cả người dùng (chức năng dành cho Admin)
        /// </summary>
        /// <returns></returns>
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
