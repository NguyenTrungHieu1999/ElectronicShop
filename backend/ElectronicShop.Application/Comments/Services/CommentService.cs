using AutoMapper;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Commands.EditComment;
using ElectronicShop.Application.Comments.Extensions;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

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

        public async Task<ApiResult<List<Comment>>> GetAllByProductIdAsync(int productId)
        {
            var comments = await _context.Comments
                .Where(x => x.ProductId.Equals(productId))
                .Include(x => x.Children)
                .Include(x => x.User)
                .Where(x => x.Deleted == false)
                .ToListAsync();

            var results = comments.Where(x => x.ParentId == null).ToList();

            return await Task.FromResult(new ApiSuccessResult<List<Comment>> { Message = comments.Count.ToString(), ResultObj = results });
        }

        public async Task<ApiResult<string>> CreateAsync(CreateCommentCommand command)
        {
            var comment = _mapper.Map<Comment>(command);

            comment.UserId = _userId;
            comment.CreatedDate = DateTime.Now;
            comment.Status = true;

            await _context.AddAsync(comment);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm bình luận thành công."));
        }

        public async Task<ApiResult<string>> EditAsync(EditCommentCommand command)
        {
            var comment = await _context.Comments.Where(x => x.Id.Equals(command.Id) && x.UserId.Equals(_userId)).SingleOrDefaultAsync();

            if (comment is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Bạn không thể chỉnh sửa bình luận này"));
            }

            comment.Map(command);
            _context.Update(comment);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật bình luận thành công."));
        }

        public async Task<ApiResult<string>> DisableOrEnableAsync(int commentId)
        {
            var comment = await _context.Comments.Where(x => x.Id.Equals(commentId)).SingleOrDefaultAsync();

            if (comment is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy bình luận"));
            }

            comment.Status = !comment.Status;

            _context.Update(comment);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>(comment.Status == false ? "Khóa bình luận thành công" : "Mở khóa bình luận thành công"));
        }

        public async Task<ApiResult<List<Comment>>> GetAllAsync()
        {
            var comments = await _context.Comments.ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Comment>>(comments));
        }

        public async Task<ApiResult<string>> DeleteAsync(int commentId)
        {
            var comment = await _context.Comments.Where(x => x.Id == commentId)
                .Include(x => x.Children)
                .SingleOrDefaultAsync();

            await Comment(comment);

            _context.Update(comment);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa bình luận thành công"));
        }

        public async Task Comments(List<Comment> comments)
        {
            foreach (var comment in comments)
            {
                await Comment(comment);
            }
        }

        public async Task Comment(Comment comment)
        {
            comment.Deleted = true;

            if(comment.Children != null)
            {
                await Comments(comment.Children);
            }
        }
    }
}