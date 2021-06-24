using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class addCartTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Cart",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(nullable: false),
                    ProductId = table.Column<int>(nullable: false),
                    Quantity = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cart", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Cart_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Cart_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "346ac5e6-1217-4390-a0f7-0c6045b6896d");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "68327b95-9758-48b5-8f7a-dbfa568a9c30");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "d50647cc-540f-4aa2-a81d-b5e475492bc7");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "86cc804a-fe74-423a-a099-273f3227fb45", "AQAAAAEAACcQAAAAECUZGSk38/VnWzB/pZLoDG2H8UX1Qee70nmukRfss4y2j6NxN5SBej3EfhhhuXVgfg==", "3932f5ba-15d8-4870-9033-98fbeddaa2a5" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "edd5d714-2b6a-43a7-b6d4-f57d2576118a", "AQAAAAEAACcQAAAAEMoYTdz4+1x84qPmYq4gLuXmRBf96XaUv3YztjhIh+fM5GYKJbKmGbeBWm7/ZbSOXg==", "f52b36d3-cf1f-4976-b3ca-bb23959c49ad" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "444af209-e5bb-40f7-a17e-56bfc500cd9b", "AQAAAAEAACcQAAAAECTfGJ4Lbl0DjEwSl/CFWtpUM5p9z7ET9HFH/MJWbDZMVwgxtOg61bStki5HWQiCHw==", "7a0f133d-6c74-4fd0-b399-87789c4d2dbd" });

            migrationBuilder.CreateIndex(
                name: "IX_Cart_ProductId",
                table: "Cart",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Cart_UserId",
                table: "Cart",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Cart");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "dab6305e-2619-4ab6-b53c-29fce745d557");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "2bb9c6f0-1d32-47ba-9fd4-e66efb7cdb58");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "015146b3-5775-4ddf-a7a2-ee266bbe5077");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "9c3397f6-9ee6-457d-82d5-652ead15cce7", "AQAAAAEAACcQAAAAEKolkhJ+wjPlvK9dBmypi75IWMYLyEqRYyomU7XMruKg8PSnJQpSgblPieREQki7AQ==", "db831486-e741-4358-ac7a-4bab8db6781c" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "97bd01a5-bf65-424e-9a63-c2d0f979555e", "AQAAAAEAACcQAAAAEE2gEZxXeSRreF2b8zoyhaWl+AKk6mItwTk6W/sUZGK/yR9pVYGKF8FmslqMvm6RzQ==", "5dcbde7f-2bd2-4e21-b5d4-13fe54d2f426" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "af347fcc-da4a-4712-95da-a82f2a0607bb", "AQAAAAEAACcQAAAAEBfMXHBmT2UPt99k06iuR6guogSqNUcPyIkMmpxWqe0xlMUKmQW0JvAczGCXYJTA+Q==", "cba19fd2-e89d-48f9-9abb-b04ab39b871c" });
        }
    }
}
