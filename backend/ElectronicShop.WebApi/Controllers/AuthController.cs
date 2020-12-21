using ElectronicShop.Application.Authentications.Commands.Authenticate;
using ElectronicShop.Application.Authentications.Commands.ForgotPassword;
using ElectronicShop.Application.Authentications.Commands.ResetPassword;
using ElectronicShop.Application.Authentications.Commands.SignOut;
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

        public AuthController(IMediator mediator, IMailer mailer, IUrlHelper urlHelper)
        {
            _mediator = mediator;
            _mailer = mailer;
            _urlHelper = urlHelper;
        }

        [HttpPost]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Authenticate([FromBody] AuthenticateCommand request)
        {
            var result = await _mediator.Send(request);

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

            var callbackUrl = _urlHelper.Action(
               controller: "",
               action: "",
               values: new { email = request.Email, token = result.ResultObj },
               protocol: HttpContext.Request.Scheme,
               host: "localhost:3001"
           );

            await _mailer.SenEmailAsync(request.Email, "Reset Password", callbackUrl);

            return Ok(result);
        }

        [HttpPost("reset-password")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordCommand request)
        {
            await _mediator.Send(request);

            return Ok();
        }

        [HttpPost("sign-out")]
        public async Task<IActionResult> SignOut()
        {
            await _mediator.Send(new SignOutCommand());

            return NoContent();
        }
    }
}
