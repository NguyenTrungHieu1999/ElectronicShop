using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.ToReceive
{
    public class ToReceiveCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; set; }
        public decimal CostPrice { get; set; }
        public int GoodsReceipt { get; set; }
    }

    public class ToReceiveHandle : IRequestHandler<ToReceiveCommand, ApiResult<string>>
    {
        private readonly IProductService _service;

        public ToReceiveHandle(IProductService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(ToReceiveCommand request, CancellationToken cancellationToken)
        {
            return await _service.ToReceive(request);
        }
    }
}
