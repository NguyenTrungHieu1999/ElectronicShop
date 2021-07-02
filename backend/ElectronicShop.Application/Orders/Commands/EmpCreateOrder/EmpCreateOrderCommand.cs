using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.OrderDetails.Models;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Orders.Services;

namespace ElectronicShop.Application.Orders.Commands.EmpCreateOrder
{
    public class EmpCreateOrderCommand : IRequest<ApiResult<Order>>
    {
        [Required]
        public bool Paid { get; set; }//Đã thanh toán

        [Required]
        public string Receiver { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public decimal TotalMoney { get; set; }

        public string Note { get; set; }

        public List<OrderDetailVm> OrderDetails { get; set; }
    }

    public class EmpCreateOrderHandle : IRequestHandler<EmpCreateOrderCommand, ApiResult<Order>>
    {
        private readonly IOrderService _service;

        public EmpCreateOrderHandle(IOrderService service)
        {
            _service = service;
        }

        public async Task<ApiResult<Order>> Handle(EmpCreateOrderCommand request, CancellationToken cancellationToken)
        {
            return await _service.EmpCreateAsync(request);
        }
    }
}
