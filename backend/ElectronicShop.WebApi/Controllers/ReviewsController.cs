using System.Threading.Tasks;
using ElectronicShop.Application.ProductReviews.Commands.CreateReview;
using ElectronicShop.Application.ProductReviews.Commands.DeleteReview;
using ElectronicShop.Application.ProductReviews.Queries.GetAllReviews;
using ElectronicShop.Application.ProductReviews.Queries.TotalRate;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewsController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ReviewsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("total-rate/{productId}")]
        public async Task<IActionResult> TotalRate(int productId)
        {
            var query = new TotalRateQuery(productId);

            var result = await _mediator.Send(query);
            
            return Ok(result);
        }

        [HttpPost("create")]
        public async Task<IActionResult> Create(CreateReviewCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPost("delete/{reviewId}")]
        public async Task<IActionResult> Delete(int reviewId)
        {
            var query = new DeleteReviewCommand(reviewId);
            return Ok(await _mediator.Send(query));
        }

        [HttpGet("{productId}/get-all")]
        public async Task<IActionResult> GetAll(int productId)
        {
            return Ok(await _mediator.Send(new GetAllReviewsQuery(productId)));
        }
    }
}