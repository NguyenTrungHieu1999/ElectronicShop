using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;

namespace ElectronicShop.Application.Orders.Queries.GetSellingProducts
{
    public class GetSellingProductsQuery : IRequest<ApiResult<List<SellingProductsVM>>>
    {
        public GetSellingProductsQuery(int month, int year)
        {
            Month = month;
            Year = year;
        }

        [Required]
        public int Month { get;}
        [Required]
        public int Year { get;}
    }
    public class GetSellingProductsHandle : IRequestHandler<GetSellingProductsQuery, ApiResult<List<SellingProductsVM>>>
    {
        private readonly IOrderService _service;

        public GetSellingProductsHandle(IOrderService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<SellingProductsVM>>> Handle(GetSellingProductsQuery request, CancellationToken cancellationToken)
        {
            return await _service.SellingProducts(request.Month, request.Year);
        }
    }
}