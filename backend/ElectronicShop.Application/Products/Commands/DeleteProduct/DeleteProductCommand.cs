
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.DeleteProduct
{
    public class DeleteProductCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; }

        public DeleteProductCommand(int productId)
        {
            ProductId = productId;
        }
    }

    public class DeleteProductHandle : IRequestHandler<DeleteProductCommand, ApiResult<string>>
    {
        private readonly IProductService _productService;

        public DeleteProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<string>> Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            return await _productService.DeleteAsync(request.ProductId);
        }
    }
}
