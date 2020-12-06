﻿using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Categories.Queries.GetAllCategory;
using ElectronicShop.Application.Categories.Queries.GetCategoryById;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
    public class CategoryController : ControllerBase
    {
        private readonly IMediator _mediator;

        public CategoryController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromBody] CreateCategoryCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult) Ok(result) : BadRequest(result);
        }

        [HttpPut("update")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateCategoryCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult) Ok(result) : BadRequest(result);
        }

        [HttpGet("{cateId}")]
        public async Task<IActionResult> GetById(int cateId)
        {
            var query = new GetCategoryByIdQuery(cateId);

            return Ok(await _mediator.Send(query));
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var query = new GetAllCategoryQuery();

            return Ok(await _mediator.Send(query));
        }
    }
}