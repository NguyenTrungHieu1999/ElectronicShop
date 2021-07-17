using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.OrderDetails.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Commands.CreateOrder
{
    public class CreateOrderCommand : IRequest<ApiResult<Order>>
    {
        [Required]
        public bool Paid { get; set; }//Đã thanh toán

        [Required]
        public string Receiver { get; set; }

        [Required]
        public string ReceiversAddress { get; set; }

        [Required]
        public string PhoneNumber { get; set; }
        
        [Required]
        public string Email { get; set; }

        [Required]
        public decimal TotalMoney { get; set; }

        public string Note { get; set; }

        public string PaymentMethod { get; set; }

        public List<OrderDetailVm> OrderDetails { get; set; }
    }

    public class CreateOrderHandle : IRequestHandler<CreateOrderCommand, ApiResult<Order>>
    {
        private readonly IOrderService _orderService;

        public CreateOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<Order>> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CreateAsync(request);
        }
    }
}
