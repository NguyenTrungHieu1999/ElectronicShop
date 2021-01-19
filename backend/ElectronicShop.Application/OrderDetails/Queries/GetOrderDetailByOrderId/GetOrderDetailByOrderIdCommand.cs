using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.OrderDetails.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.OrderDetails.Queries.GetOrderDetailByOrderId
{
    public class GetOrderDetailByOrderIdCommand : IRequest<ApiResult<List<OrderDetail>>>
    {
        public GetOrderDetailByOrderIdCommand(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }
    
    public class GetOrderDetailByOrderIdHandle : IRequestHandler<GetOrderDetailByOrderIdCommand, ApiResult<List<OrderDetail>>>
    {
        private readonly IOrderDetailService _orderDetail;

        public GetOrderDetailByOrderIdHandle(IOrderDetailService orderDetail)
        {
            _orderDetail = orderDetail;
        }

        public async Task<ApiResult<List<OrderDetail>>> Handle(GetOrderDetailByOrderIdCommand request, CancellationToken cancellationToken)
        {
            return await _orderDetail.GetOrderDetailByOrderIdAsync(request.OrderId);
        }
    }
}