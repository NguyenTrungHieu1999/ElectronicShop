using ElectronicShop.Application.Orders.Commands.ChangeOrderStatus;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Application.Orders.Queries.GetAllOrder;
using ElectronicShop.Application.Orders.Queries.GetOrderByUserId;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : BaseController
    {
        private readonly IMediator _mediator;

        public OrdersController(IMediator mediator)
        {
            _mediator = mediator;
        }
        
        [HttpPost("create")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        [Authorize]
        public async Task<IActionResult> Create(CreateOrderCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPost("{orderId}/change-status")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> ChangeStatus(int orderId)
        {
            var command = new ChangeOrderStatusCommand(orderId);

            var result = await _mediator.Send(command);

            return Ok(result);
        }

        [HttpGet]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _mediator.Send(new GetAllOrderQuery()));
        }

        [HttpGet("my-order")]
        [Authorize]
        public async Task<IActionResult> GetOrderByUserId()
        {
            return Ok(await _mediator.Send(new GetOrderByUserIdQuery()));
        }
    }
}
