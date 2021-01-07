using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Commands.CreateOrder
{
    public class CreateOrderCommand : IRequest<ApiResult<string>>
    {
        //public DateTime CreatedDate { get; set; }

        //public DateTime? ModifiedDate { get; set; }

        //public DateTime DeliveryDate { get; set; }//Ngày giao dự kiến

        public bool Paid { get; set; }//Đã thanh toán

        public string Receiver { get; set; }

        public string ReceiversAddress { get; set; }

        public string PhoneNumber { get; set; }

        public decimal TotalMoney { get; set; }

        //public int StatusId { get; set; }
    }

    public class CreateOrderHandle : IRequestHandler<CreateOrderCommand, ApiResult<string>>
    {
        private readonly IOrderService _orderService;

        public CreateOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<string>> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CreateAsync(request);
        }
    }
}
