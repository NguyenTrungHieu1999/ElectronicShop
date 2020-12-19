﻿using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Enums;
using MediatR;
using System;

namespace ElectronicShop.Application.Products.Commands.UpdateProduct
{
    public class UpdateProductCommand : IRequest<ApiResult<string>>
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public decimal Price { get; set; }

        public string Specifications { get; set; }//Thông số kỹ thuật

        public string Description { get; set; }

        public int GoodsReceipt { get; set; }//Số lượng nhập

        public int Inventory { get; set; }//Số lượng tồn

        public ProductStatus Status { get; set; }

        public int CategoryId { get; set; }

        public string Alias { get; set; }

        public string ModifiedBy { get; set; } //UserName
    }
}
