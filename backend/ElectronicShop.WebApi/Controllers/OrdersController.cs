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
using ElectronicShop.Application.Orders.Commands.CancleMyOrder;
using ElectronicShop.Application.Orders.Commands.CancleOrder;
using ElectronicShop.Application.Orders.Queries.GetOrderById;
using ElectronicShop.Application.Orders.Queries.MyOrderById;

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
        [AllowAnonymous]
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

        [HttpGet("{orderId}")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> GetOrderById(int orderId)
        {
            return Ok(await _mediator.Send(new GetOrderByIdQuery(orderId)));
        }

        [HttpGet("my-order/id={orderId}")]
        [Authorize]
        public async Task<IActionResult> MyOrderById(int orderId)
        {
            return Ok(await _mediator.Send(new MyOrderByIdQuery(orderId)));
        }

        [HttpPost("cancle-order/id={orderId}")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> CancleOrder(int orderId)
        {
            return Ok(await _mediator.Send(new CancleOrderCommand(orderId)));
        }
        
        [HttpPost("cancle-my-order/id={orderId}")]
        [Authorize]
        public async Task<IActionResult> CancleMyOrder(int orderId)
        {
            return Ok(await _mediator.Send(new CancleMyOrderCommand(orderId)));
        }
    }
}
