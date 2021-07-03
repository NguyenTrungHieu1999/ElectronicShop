using ElectronicShop.Application.Orders.Commands.CancleMyOrder;
using ElectronicShop.Application.Orders.Commands.CancleOrder;
using ElectronicShop.Application.Orders.Commands.ChangeOrderStatus;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Application.Orders.Commands.EmpCreateOrder;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Application.Orders.Queries.GetAllOrder;
using ElectronicShop.Application.Orders.Queries.GetOrderById;
using ElectronicShop.Application.Orders.Queries.GetOrderByUserId;
using ElectronicShop.Application.Orders.Queries.GetSellingProducts;
using ElectronicShop.Application.Orders.Queries.HaveOrder;
using ElectronicShop.Application.Orders.Queries.MyOrderById;
using ElectronicShop.Data.EF;
using ElectronicShop.Infrastructure.SendMail;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : BaseController
    {
        private readonly IMediator _mediator;
        private readonly ElectronicShopDbContext _context;
        private readonly IMailer _mailer;

        public OrdersController(IMediator mediator, ElectronicShopDbContext context, IMailer mailer)
        {
            _mediator = mediator;
            _context = context;
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
                body += "</table><p style=\"padding-right:10px\" >Tổng tiền: <span style=\"color: red\">" + result.ResultObj.TotalMoney.ToString("N0") + " VND</span></p><h4>Một lần nữa ElectronicShop cảm ơn quý khách!!!</h4></div>";
                await _mailer.SenEmailAsync(command.Email, "Thông tin đặt hàng", body);
            }
            return Ok(result);
        }

        [HttpPost("emp-create")]
        [Authorize(Roles = Constants.EMP)]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> EmpCreate(EmpCreateOrderCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPost("{orderId}/change-status")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> ChangeStatus(int orderId)
        {
            var result = await _mediator.Send(new ChangeOrderStatusCommand(orderId));

            if (result.IsSuccessed)
            {
                if (result.ResultObj.StatusId.Equals(2) || result.ResultObj.StatusId.Equals(7))
                {
                    string body = "<h3>Đơn hàng có mã số " + result.ResultObj.Id + " đặt ngày " + result.ResultObj.CreatedDate.ToShortDateString() + " của quý khách đang ở trạng thái: " + result.ResultObj.OrderStatus.Name + ". Cảm ơn quý khách đã mua hàng ở ElectronicShop. Nếu quý khách muốn theo dõi trạng thái đơn hàng thì hãy đăng nhập vào hệ thống website vào phần đơn hàng để kiểm tra." + "</h3>";
                    await _mailer.SenEmailAsync(result.ResultObj.Email, "Cập nhật trạng thái đơn hàng", body);
                }
            }

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
            var result = await _mediator.Send(new CancleOrderCommand(orderId));
            if (result.IsSuccessed)
            {
                var str = "";
                if (result.ResultObj.Paid)
                {
                    str = " Chúng tôi sẽ hoàn tiền cho quý khách trong thời gian sớm nhất.";
                }
                string body = "<h3>Đơn hàng có mã số " + result.ResultObj.Id + " đặt ngày " + result.ResultObj.CreatedDate.ToShortDateString() + " đã được hủy." + str + " Cảm ơn quý khách đã mua hàng ở ElectronicShop." + "</h3>";
                await _mailer.SenEmailAsync(result.Message, "Thông báo đơn hàng được hủy", body);
            }
            return Ok();
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

        [HttpGet("sellingProducts/m={month}/y={year}")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> SellingProducts(int month, int year)
        {
            return Ok(await _mediator.Send(new GetSellingProductsQuery(month, year)));
        }
    }
}
