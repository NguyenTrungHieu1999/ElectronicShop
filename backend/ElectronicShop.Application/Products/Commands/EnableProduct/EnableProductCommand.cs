using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.EnableProduct
{
    public class EnableProductCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; }

        public EnableProductCommand(int productId)
        {
            ProductId = productId;
        }
    }

    public class EnableProductHandle : IRequestHandler<EnableProductCommand, ApiResult<string>>
    {
        private readonly IProductService _service;
        public async Task<ApiResult<string>> Handle(EnableProductCommand request, CancellationToken cancellationToken)
        {
            return await _service.EnableAsync(request.ProductId);
        }
    }
}
