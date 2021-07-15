using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.DisableProduct
{
    public class DisableProductCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; }

        public DisableProductCommand(int productId)
        {
            ProductId = productId;
        }
    }

    public class DisableProductHandle : IRequestHandler<DisableProductCommand, ApiResult<string>>
    {
        private readonly IProductService _service;

        public DisableProductHandle(IProductService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(DisableProductCommand request, CancellationToken cancellationToken)
        {
            return await _service.DisableAsync(request.ProductId);
        }
    }
}
