using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Comments.Extensions;
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
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;
        private readonly int userId;
        
        public CommentService(ElectronicShopDbContext context, IMapper mapper, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            userId = int.Parse(_httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
        }

        public async Task<ApiResult<List<Comment>>> GetAllAsync()
        {
            var comments = await _context.Comments.ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Comment>>(comments));
        }

        public async Task<ApiResult<string>> CreateAsync(CreateCommentCommand command)
        {
            var comment = _mapper.Map<Comment>(command);

            comment.UserId = userId;
            comment.CreatedDate = DateTime.Now;

            await _context.AddAsync(command);
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

            comment.UserId = userId;

            _context.Update(comment);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật bình luận thành công."));
        }
    }
}