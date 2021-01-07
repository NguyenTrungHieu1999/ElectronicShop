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
            return Ok(await _mediator.Send(request));
        }

        [HttpPut("update")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateProductCommand update)
        {
            return Ok(await _mediator.Send(update));
        }
        
        [HttpDelete("delete/{productId}")]
        public async Task<IActionResult> Delete(int productId)
        {
            var query = new DeleteProductCommand(productId);

            return Ok(await _mediator.Send(query));
        }

        [HttpGet("{productId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(int productId)
        {
            var query = new GetProductByIdQuery(productId);

            return Ok(await _mediator.Send(query));
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll([FromQuery] GetAllProductQuery request)
        {
            return Ok(await _mediator.Send(request));
        }
    }
}
