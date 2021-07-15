using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.DeleteProduct;
using ElectronicShop.Application.Products.Commands.DisableProduct;
using ElectronicShop.Application.Products.Commands.EnableProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Application.Products.Queries.FilterProduct;
using ElectronicShop.Application.Products.Queries.GetAllProduct;
using ElectronicShop.Application.Products.Queries.GetNewProducts;
using ElectronicShop.Application.Products.Queries.GetProductByCateId;
using ElectronicShop.Application.Products.Queries.GetProductById;
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

        [HttpGet("cateId={cateId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetByCateId(int cateId)
        {
            var query = new GetProductByCateIdQuery(cateId);
            return Ok(await _mediator.Send(query));
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _mediator.Send(new GetAllProductQuery()));
        }

        [HttpGet("get-new-products")]
        [AllowAnonymous]
        public async Task<IActionResult> GetNew()
        {
            return Ok(await _mediator.Send(new GetNewProductsQuery()));
        }
        
        [HttpGet("search")]
        [AllowAnonymous]
        public async Task<IActionResult> Search([FromQuery] SearchProductQuery query)
        {
            return Ok(await _mediator.Send(query));
        }

        [HttpGet("filter")]
        [AllowAnonymous]
        public async Task<IActionResult> Filter([FromQuery]FilterProductQuery query)
        {
            return Ok(await _mediator.Send(query));
        }

        [HttpPut("disable/{productId}")]
        public async Task<IActionResult> Disable(int productId)
        {
            return Ok(await _mediator.Send(new DisableProductCommand(productId)));
        }

        [HttpPut("enable/{productId}")]
        public async Task<IActionResult> Enable(int productId)
        {
            return Ok(await _mediator.Send(new EnableProductCommand(productId)));
        }
    }
}
