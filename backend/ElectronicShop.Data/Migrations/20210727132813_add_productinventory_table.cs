using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class add_productinventory_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ProductInventory",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductId = table.Column<int>(nullable: false),
                    GoodsReceipt = table.Column<int>(nullable: false),
                    CostPrice = table.Column<decimal>(type: "decimal", nullable: false),
                    UserId = table.Column<int>(nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductInventory", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProductInventory_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductInventory_User_UserId",
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
                value: "9d086ddb-5c75-489d-bd74-ed8a01cf73df");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "10d6a280-bacf-41a3-a5a5-a610dfa8514b");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "a4b341ff-1378-41eb-a72f-d11052d6ece1");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c7fbe909-bf7a-4a59-8602-e28b59e00d50", "AQAAAAEAACcQAAAAEFSnpnXD9w+tqRpB5jCBMMiRS7C98CLhRE/gSaaG8F3VGFEiKIMBDDFCZW76zhbwWQ==", "09ed54c9-553d-4636-b28a-4d7884c9f397" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "9c1b7222-db81-4bd5-8ede-c2107f25f208", "AQAAAAEAACcQAAAAEDDk1yxVUwB3LMbIMatV2dhCQAhyX9kFaeyiTVhvW3WZmKIvdB+EniY1j9UzG1l12A==", "ccfb0799-6c77-4c27-a6f5-4778846a1849" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "735893cc-096a-4def-be50-ef097d562489", "AQAAAAEAACcQAAAAECDJ/wAjwaO2XHXXgOToqiL+GsuLM/QveYjPokqEGiCB0Lg2GCvMZkuWpFCmjcjstA==", "aae0ce9d-b7b2-4a25-89d1-5bd052a8e249" });

            migrationBuilder.CreateIndex(
                name: "IX_ProductInventory_ProductId",
                table: "ProductInventory",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductInventory_UserId",
                table: "ProductInventory",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductInventory");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "02a5a1ba-890d-4efc-aa83-6b95acaca752");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "6d7e4971-f5c1-4781-8270-24b848f3d6cd");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "dc38c50b-3b18-4785-a956-e90a712906ff");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "f8226829-054f-4a21-a30c-40358f734ac1", "AQAAAAEAACcQAAAAEAssMRdj7ZcdyqrmBWqlC5FaKgrk+sJu+0sq/QfXdr2iwGyDelbpADKFAlalOh5RWg==", "f7a892cf-7d88-48e2-9c26-8205d041dea9" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "6b4c3277-5240-41a9-8e38-034f3c25027e", "AQAAAAEAACcQAAAAEJ7KsKU+7WWOPJIcGShXZdE+ilaj1lbsMtrZaKifTGmQIozDAKkbTc9VMHXq6BQz0w==", "f31ca290-be80-4657-b13e-a4edc6d1b01e" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "8bd582e6-5b1c-4e47-8575-2c11a4ea17eb", "AQAAAAEAACcQAAAAEC7nccoQzW28wkdSUQ4S3NZOEagjP9pzT9iOrB+9Z/h14a3F9Uah6ascYJSBM4eZ6A==", "9bc66d37-e822-4f1d-98b7-50282485a9b4" });
        }
    }
}
