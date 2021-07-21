using ElectronicShop.Application.Authentications.Commands.Authenticate;
using ElectronicShop.Application.Authentications.Commands.ExternalLogins;
using ElectronicShop.Application.Authentications.Commands.ForgotPassword;
using ElectronicShop.Application.Authentications.Commands.ResetPassword;
using ElectronicShop.Application.Authentications.Commands.SignOut;
using ElectronicShop.Infrastructure.SendMail;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
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

        public AuthController(IMediator mediator, IMailer mailer)
        {
            _mediator = mediator;
            _mailer = mailer;
        }

        [HttpPost]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Authenticate([FromBody] AuthenticateCommand request)
        {
            var result = await _mediator.Send(request);

            return Ok(result);
        }

        [HttpPost("external-logins")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ExternalLogins(ExternalLoginsCommand command)
        {
            var result = await _mediator.Send(command);

            return Ok(result);
        }

        [HttpPost("forgot-password")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordCommand request)
        {
            var result = await _mediator.Send(request);

            if (!result.IsSuccessed)
            {
                return BadRequest(result);
            }
            
            string href = "https://electronicshop-client.herokuapp.com/tao-moi-mat-khau/" + request.Email + "/" + result.ResultObj;
            ////string href = "http://localhost:3001/tao-moi-mat-khau/" + request.Email + "/" + result.ResultObj;
            try
            {
                string body =
                "<h3> Quý khách vui lòng click vào đường link bên dưới để chuyển đến trang thay đổi mật khẩu.</h3>" +
                "<a href=\"" + href + "\">Click vào đây</a>";

                await _mailer.SenEmailAsync(request.Email, "Reset Password", body);
            }
            catch
            {

            }

            return Ok(result);
        }

        [HttpPost("reset-password")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordCommand request)
        {
            return Ok(  await _mediator.Send(request));
        }

        [HttpPost("sign-out")]
        public async Task<IActionResult> SignOut() 
        {
            await _mediator.Send(new SignOutCommand());

            return NoContent();
        }
    }
}
