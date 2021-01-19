using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Application.ProductPhotos.Commands.DeleteProductPhoto;
using ElectronicShop.Application.ProductPhotos.Queries.GetPhotoByProductId;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
    public class ProductPhotosController : BaseController
    {
        private readonly IMediator _mediator;

        public ProductPhotosController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [Consumes("multipart/form-data")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromForm]CreateProductPhotoCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpDelete("delete/{photoId}")]
        public async Task<IActionResult> Delete(int photoId)
        {
            var command = new DeleteProductPhotoCommand(photoId);

            var result = await _mediator.Send(command);

            return Ok(result);
        }

        [HttpGet("productId={productId}/get-all")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll(int productId)
        {
            var query = new GetPhotoByProductIdQuery(productId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }
    }
}