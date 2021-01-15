using System;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Data.Extensions
{
    public static class ModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
            var hasher = new PasswordHasher<User>();
            modelBuilder.Entity<User>().HasData(
                new User
                {
                    Id = 1,
                    UserName = "hieunguyen",
                    PasswordHash = hasher.HashPassword(null, "Hieu@123"),
                    FirstMiddleName = "Nguyễn Trung",
                    LastName = "Hiếu",
                    Address = "KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM",
                    Status = 0,
                    Gender = Gender.MALE,
                    Email = "hieutanmy321@gmail.com",
                    PhoneNumber = "0965924083",
                    SecurityStamp = Guid.NewGuid().ToString("D"),
                    NormalizedUserName = "HIEUNGUYEN",
                    NormalizedEmail = "HIEUTANMY321@GMAIL.COM"
                },
                new User
                {
                    Id = 2,
                    UserName = "hieuvo",
                    PasswordHash = hasher.HashPassword(null, "HieuVo@123"),
                    FirstMiddleName = "Võ Trọng",
                    LastName = "Hiếu",
                    Address = "KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM",
                    Status = 0,
                    Gender = Gender.MALE,
                    Email = "hieu@gmail.com",
                    SecurityStamp = Guid.NewGuid().ToString("D"),
                    NormalizedUserName = "HIEUVO",
                    NormalizedEmail = "HIEU@GMAIL.COM"
                },
                new User
                {
                    Id = 3,
                    UserName = "datle",
                    PasswordHash = hasher.HashPassword(null, "DatLe@123"),
                    FirstMiddleName = "Lê Tấn",
                    LastName = "Đạt",
                    Address = "KTX Cỏ May, khu phố 6, phường Linh Trung, quận Thủ Đức, TP.HCM",
                    Status = 0,
                    Gender = Gender.MALE,
                    Email = "dat@gmail.com",
                    SecurityStamp = Guid.NewGuid().ToString("D"),
                    NormalizedUserName = "DATLE",
                    NormalizedEmail = "DAT@GMAIL.COM"
                }
            );

            modelBuilder.Entity<Role>().HasData(
                new Role
                {
                    Id = 1,
                    Name = "Admin",
                    NormalizedName = "ADMIN",
                    Description = "Quản trị viên"
                },
                new Role
                {
                    Id = 2,
                    Name = "Emp",
                    NormalizedName = "EMP",
                    Description = "Nhân viên"
                },
                new Role
                {
                    Id = 3,
                    Name = "User",
                    NormalizedName = "USER",
                    Description = "Người dùng đã đăng ký"
                }
            );

            modelBuilder.Entity<UserRole>().HasData(
                new UserRole
                {
                    UserId = 1,
                    RoleId = 1
                },
                new UserRole
                {
                    UserId = 2,
                    RoleId = 2
                },
                new UserRole
                {
                    UserId = 3,
                    RoleId = 3
                }
            );

            modelBuilder.Entity<ProductType>().HasData(
                new ProductType
                {
                    Id = 1,
                    Name = "Laptop - Thiết bị IT",
                    Status = true
                },
                new ProductType
                {
                    Id = 2,
                    Name = "Điện Thoại - Máy tính bảng",
                    Status = true
                },
                new ProductType
                {
                    Id = 3,
                    Name = "Máy ảnh - Quay phim",
                    Status = true
                },
                new ProductType
                {
                    Id = 4,
                    Name = "Điện tử - Điện lạnh",
                    Status = true
                }
            );

            modelBuilder.Entity<OrderStatus>().HasData(
                new OrderStatus
                {
                    Id = 1,
                    Name = "Đặt hàng thành công"
                },
                new OrderStatus
                {
                    Id = 2,
                    Name = "Đã tiếp nhận"
                },
                new OrderStatus
                {
                    Id = 3,
                    Name = "Đang lấy hàng"
                },
                new OrderStatus
                {
                    Id = 4,
                    Name = "Đóng gói xong"
                },
                new OrderStatus
                {
                    Id = 5,
                    Name = "Bàn giao vận chuyển"
                },
                new OrderStatus
                {
                    Id = 6,
                    Name = "Đang vận chuyển"
                },
                new OrderStatus
                {
                    Id = 7,
                    Name = "Giao hàng thành công"
                },
                new OrderStatus
                {
                    Id = 8,
                    Name = "Hủy đơn hàng"
                }
            );
        }
    }
}