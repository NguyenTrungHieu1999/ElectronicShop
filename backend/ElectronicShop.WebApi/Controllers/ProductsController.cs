using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.DeleteProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using ElectronicShop.Application.Products.Queries.GetAllProduct;
using ElectronicShop.Application.Products.Queries.GetProductById;
using Microsoft.AspNetCore.Authorization;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
    public class ProductsController : BaseController
    {
        private readonly IMediator _mediator;

        public ProductsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [Consumes("multipart/form-data")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromForm] CreateProductCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest(result);
        }

        [HttpPut("update")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateProductCommand update)
        {
            var result = await _mediator.Send(update);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest();
        }
        
        [HttpDelete("delete/{productId}")]
        public async Task<IActionResult> Delete(int productId)
        {
            var query = new DeleteProductCommand(productId);

            var result = await _mediator.Send(query);

            return result.IsSuccessed ? (IActionResult)Ok(result) : BadRequest();
        }

        [HttpGet("{productId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(int productId)
        {
            var query = new GetProductByIdQuery(productId);

            var result = await _mediator.Send(query);

            return Ok(result);
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll([FromQuery] GetAllProductQuery request)
        {
            var result = await _mediator.Send(request);

            return Ok(result);
        }
    }
}
