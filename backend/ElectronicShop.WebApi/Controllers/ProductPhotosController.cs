using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Application.ProductPhotos.Commands.DeleteProductPhoto;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
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
        [AllowAnonymous]
        public async Task<IActionResult> Delete(int photoId)
        {
            var command = new DeleteProductPhotoCommand(photoId);

            var result = await _mediator.Send(command);

            return Ok(result);
        }
    }
}