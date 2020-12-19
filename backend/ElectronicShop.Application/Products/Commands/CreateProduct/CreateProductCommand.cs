using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Enums;
using MediatR;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.CreateProduct
{
    public class CreateProductCommand : IRequest<ApiResult<string>>
    {
        public string Name { get; set; }

        public decimal Price { get; set; }

        public string Specifications { get; set; }//Thông số kỹ thuật

        public string Description { get; set; }

        public int GoodsReceipt { get; set; }//Số lượng nhập

        public int Inventory { get; set; }//Số lượng tồn

        public ProductStatus Status { get; set; }

        public int CategoryId { get; set; }

        public string Alias { get; set; }
        
        public IFormFile ThumbnailImage { get; set; }
    }

    public class CreateProductHandle : IRequestHandler<CreateProductCommand, ApiResult<string>>
    {
        private readonly IProductService _productService;

        public CreateProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<string>> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
            return await _productService.CreateAsync(request);
        }
    }
}