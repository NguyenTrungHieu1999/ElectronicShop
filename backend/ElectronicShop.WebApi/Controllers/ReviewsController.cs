using ElectronicShop.Application.ProductReviews.Commands.CreateReview;
using ElectronicShop.Application.ProductReviews.Commands.DeleteReview;
using ElectronicShop.Application.ProductReviews.Commands.EditReview;
using ElectronicShop.Application.ProductReviews.Queries.GetAllByProductId;
using ElectronicShop.Application.ProductReviews.Queries.GetAllReviews;
using ElectronicShop.Application.ProductReviews.Queries.TotalRate;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewsController : BaseController
    {
        private readonly IMediator _mediator;

        public ReviewsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("total-rate/{productId}")]
        [AllowAnonymous]
        public async Task<IActionResult> TotalRate(int productId)
        {
            var query = new TotalRateQuery(productId);

            var result = await _mediator.Send(query);
            
            return Ok(result);
        }

        [HttpPost("create")]
        [Authorize]
        public async Task<IActionResult> Create(CreateReviewCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPost("delete/{reviewId}")]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> Delete(int reviewId)
        {
            var query = new DeleteReviewCommand(reviewId);
            return Ok(await _mediator.Send(query));
        }

        [AllowAnonymous]
        [HttpGet("{productId}/get-all")]
        public async Task<IActionResult> GetAll(int productId)
        {
            return Ok(await _mediator.Send(new GetAllByProductIdQuery(productId)));
        }

        [HttpPut("edit")]
        [Authorize]
        public async Task<IActionResult> Edit(EditReviewCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpGet]
        [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _mediator.Send(new GetAllReviewsQuery()));
        }
    }
}