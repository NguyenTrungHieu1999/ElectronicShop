using ElectronicShop.Application.Authentications.Commands.Authenticate;
using ElectronicShop.Application.Authentications.Commands.ForgotPassword;
using ElectronicShop.Application.Authentications.Commands.ResetPassword;
using ElectronicShop.Infrastructure.SendMail;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IMailer _mailer;
        private readonly IUrlHelper _urlHelper;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AuthController(IMediator mediator, IMailer mailer, IUrlHelper urlHelper, IHttpContextAccessor httpContextAccessor)
        {
            _mediator = mediator;
            _mailer = mailer;
            _urlHelper = urlHelper;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// Chức năng đăng nhập
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Authenticate([FromBody] AuthenticateCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        /// <summary>
        /// Chức năng quên mật khẩu
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("forgot-password")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordCommand request)
        {
            var result = await _mediator.Send(request);

            if (!result.IsSuccessed)
            {
                return BadRequest(result);
            }

            var callbackUrl = _urlHelper.Action(
               controller: "ForgotPassword",
               action: "ResetPassword",
               values: new { email = request.Email, result.ResultObj },
               protocol: _httpContextAccessor.HttpContext.Request.Scheme,
               host: "localhost:5001"
           );

            await _mailer.SenEmailAsync(request.Email, "Reset Password", callbackUrl);

            return Ok(result);
        }

        /// <summary>
        /// Chức năng tạo lại mật khẩu
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("reset-password")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordCommand request)
        {
            await _mediator.Send(request);

            return NoContent();
        }
    }
}
