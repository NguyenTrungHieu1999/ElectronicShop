using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
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
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Application.Orders.Queries.GetOrderById;
using ElectronicShop.Application.Orders.Queries.HaveOrder;
using ElectronicShop.Application.Orders.Queries.MyOrderById;
using ElectronicShop.Data.EF;
using ElectronicShop.Infrastructure.SendMail;
using Microsoft.AspNetCore.Http;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : BaseController
    {
        private readonly IMediator _mediator;
        private readonly ElectronicShopDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMailer _mailer;

        public OrdersController(IMediator mediator, ElectronicShopDbContext context, IHttpContextAccessor httpContextAccessor, IMailer mailer)
        {
            _mediator = mediator;
            _context = context;
            _httpContextAccessor = httpContextAccessor;
            _mailer = mailer;
        }
        
        [HttpPost("create")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        [AllowAnonymous]
        public async Task<IActionResult> Create(CreateOrderCommand command)
        {
            var result = await _mediator.Send(command);

            if (result.IsSuccessed)
            {
                var orderDetails = new List<OrderDetailForMail>();
                foreach (var order in command.OrderDetails)
                {
                    var product = await _context.Products.FindAsync(order.ProductId);
                    orderDetails.Add(new OrderDetailForMail
                    {
                        Id = order.ProductId,
                        Price = order.Price,
                        ProductName = product.Name,
                        Quantity = order.Quantity
                    });
                }
                string body = "<h3>Cảm ơn quý khách " + command.Receiver + " đã đặt hàng tại ElectronicShop,</h3><p>Đơn hàng sẽ được giao đến địa chỉ của quý khách trong thời gian sớm nhất, ElectronicShop sẽ thông báo đến quý khách ngay khi hàng chuẩn bị được giao.</p>" + "<h3>Thông tin đơn hàng của quý khách bao gồm:</h3>"
                              + "<p><strong> Người nhận:</strong> " + command.Receiver + "</p>"
                              + "<p><strong> Địa chỉ:</strong> " + command.ReceiversAddress + "</p>"
                              + "<p><strong> Số điện thoại:</strong> " + command.PhoneNumber + "</p>"
                              + "<div style=\"position: absolute;\">" + "<table border=\"1px\" style=\"border-spacing: 0\"><tr><th>Mã Sản phẩm</th><th>Tên sản phẩm</th><th>Số lượng</th><th>Đơn giá</th></tr>";
                body = orderDetails.Aggregate(body, (current, item) => current + ("<tr><th><p>" + item.Id + "</p></th>" + "<th><p>" + item.ProductName + "</p></th>" + "<th><p>" + item.Quantity + "</p></th>" + "<th><p>" + item.Price.ToString("N0") + " VND </p></th></tr>"));
                body += "</table><p style=\"padding-right:10px\" >Tổng tiền: <span style=\"color: red\">" + command.TotalMoney.ToString("N0") + " VND</span></p><h4>Một lần nữa ElectronicShop cảm ơn quý khách!!!</h4></div>";
                await _mailer.SenEmailAsync("hieutanmy321@gmail.com", "Thông tin đặt hàng", body);
            }
            return Ok(result);
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

        [HttpGet("haveOrder/{productId}")]
        [Authorize]
        public async Task<IActionResult> HaveOrder(int productId)
        {
            return Ok(await _mediator.Send(new HaveOrderQuery(productId)));
        }
    }
}
