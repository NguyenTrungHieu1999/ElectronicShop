using ElectronicShop.Infrastructure.SendMail;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestMailController : ControllerBase
    {
        private readonly IMailer _mailer;

        public TestMailController(IMailer mailer)
        {
            _mailer = mailer;
        }

        [HttpGet("test")]
        public async Task<IActionResult> Testmail()
        {
            await _mailer.SenEmailAsync("hieutanmy321@gmail.com", "testmail", "djjdhbd");

            return Ok();
        }
    }
}
