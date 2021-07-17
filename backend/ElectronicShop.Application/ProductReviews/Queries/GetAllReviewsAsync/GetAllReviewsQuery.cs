using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.ProductReviews.Queries.GetAllReviewsAsync
{
    public class GetAllReviewsQuery : IRequest<ApiResult<List<ProductReview>>>
    {
    }

    public class GetAllHandle : IRequestHandler<GetAllReviewsQuery, ApiResult<List<ProductReview>>>
    {
        private readonly IProductReviewService _service;

        public GetAllHandle(IProductReviewService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<ProductReview>>> Handle(GetAllReviewsQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetAllAsync();
        }
    }
}
