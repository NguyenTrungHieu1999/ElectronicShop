using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Enums;
using MediatR;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Commands.CreateProduct
{
    public class CreateProductCommand : IRequest<ApiResult<string>>
    {
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

        public ProductStatus Status { get; set; }

        [Required]
        public int CategoryId { get; set; }

        [Required]
        public string Alias { get; set; }

        [Required]
        public List<IFormFile> ThumbnailImages { get; set; }
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