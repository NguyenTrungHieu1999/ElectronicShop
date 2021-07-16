using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Enums;
using MediatR;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.UpdateProduct
{
    public class UpdateProductCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        public string Specifications { get; set; }//Thông số kỹ thuật

        [Required]
        public string Description { get; set; }

        [Required]
        public int GoodsReceipt { get; set; }//Số lượng nhập

        [Required]
        public int Inventory { get; set; }//Số lượng tồn

        public ProductStatus Status { get; set; }

        [Required]
        public int CategoryId { get; set; }

        [Required]
        public string Alias { get; set; }
    }

    public class UpdateProductHandle : IRequestHandler<UpdateProductCommand, ApiResult<string>>
    {
        private readonly IProductService _productService;

        public UpdateProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<string>> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            return await _productService.UpdateAsync(request);
        }
    }
}
