using System.Threading.Tasks;
using ElectronicShop.Application.OrderDetails.Queries.GetOrderDetailByOrderId;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailsController : BaseController
    {
        private readonly IMediator _mediator;

        public OrderDetailsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("orderId={orderId}")]
        [Authorize]
        public async Task<IActionResult> GetOrderDetailByOrderId(int orderId)
        {
            return Ok(await _mediator.Send(new GetOrderDetailByOrderIdCommand(orderId)));
        }
    }
}