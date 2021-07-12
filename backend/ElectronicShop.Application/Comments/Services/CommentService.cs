using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Comments.Extensions;
using ElectronicShop.Application.Comments.Models;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.Comments.Services
{
    public class CommentService : ICommentService
    {
        private readonly ElectronicShopDbContext _context;
        private readonly IMapper _mapper;
        private readonly int _userId;
        
        public CommentService(ElectronicShopDbContext context, IMapper mapper, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _mapper = mapper;

            if (httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
            {
                _userId = int.Parse(httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            }
        }

        public async Task<ApiResult<List<CommentVm>>> GetAllByProductIdAsync(int productId)
        {
            var comments = await _context.Comments
                .Where(x=>x.ProductId.Equals(productId) && x.ParentId == null)
                .Include(x=>x.Children)
                .ThenInclude(x=>x.User)
                .ToListAsync();

            var result = _mapper.Map<List<CommentVm>>(comments);

            foreach (var comment in result)
            {
                comment.UserName = (await _context.Users.FindAsync(comment.UserId)).UserName;
            }

            return await Task.FromResult(new ApiSuccessResult<List<CommentVm>>(result));
        }

        public async Task<ApiResult<string>> CreateAsync(CreateCommentCommand command)
        {
            var comment = _mapper.Map<Comment>(command);

            comment.UserId = _userId;
            comment.CreatedDate = DateTime.Now;

            await _context.AddAsync(comment);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm bình luận thành công."));
        }

        public async Task<ApiResult<string>> EditAsync(EditCommentCommand command)
        {
            var comment = await _context.Comments.FindAsync(command.Id);

            if (comment is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Bình luận không tồn tại."));
            }
            comment.Map(command);

            comment.UserId = _userId;

            _context.Update(comment);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật bình luận thành công."));
        }
    }
}