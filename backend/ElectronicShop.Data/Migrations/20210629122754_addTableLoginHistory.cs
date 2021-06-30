using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class addTableLoginHistory : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "LoginHistory",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(nullable: false),
                    AccessTime = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoginHistory", x => x.Id);
                    table.ForeignKey(
                        name: "FK_LoginHistory_User_UserId",
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
                value: "9784d1bf-7605-4291-9bd9-c5baa3389905");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "a221ee9c-c00d-4214-80a1-5ab0a604c922");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "86184f5a-1b34-4253-a012-aa917874b773");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c434a246-a621-4b39-a817-21e81a60fd94", "AQAAAAEAACcQAAAAEJU7dMw15kIt1GxRhox6Hzk90p2HtugsQa4qubbljrIrle0lq7+lVs/gISzYIk5aIg==", "8fca84cf-27f0-4a02-8534-baebd5c14da8" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "9e976eec-49dd-461b-9fdd-3ecb9f9d9b72", "AQAAAAEAACcQAAAAEO44YY/gyZG7W+QedSO4P2e7jKwS42fw6DXOnqhHDg8tWDMy4+MsqyE8kWzZam0mFw==", "4d113e87-65f1-41d9-84d0-0a3229bda083" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "5c7c0813-293e-4053-926a-46a49277daf8", "AQAAAAEAACcQAAAAEL2/vfEsy1DoGTSPiSVbVQau1aKspDMEa99TLZMDycq6/3MK5AyGa3mzk2CEcnj+VQ==", "f272ffcf-3d79-43bb-8e0e-2bd6e69fc185" });

            migrationBuilder.CreateIndex(
                name: "IX_LoginHistory_UserId",
                table: "LoginHistory",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "LoginHistory");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "de01072b-8703-44d2-9ae6-afa7f04f2332");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "17db01ac-0820-49e5-9271-852bb4ee8b3a");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "40046b90-268e-4e91-a6e8-07495ffd02f0");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "b5472e48-9006-4cac-a5be-cf323d89b0fc", "AQAAAAEAACcQAAAAELXwY2JCEsYxDLAkVGtK+b/31rIAIqDJYgkaS/YWxznqJbfuMqxTjAymYJ69IjJRrA==", "f8be4d4b-dd24-4f87-982b-e1878f180417" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "dd015b3d-cd1a-4868-9077-6c0e032c3bdc", "AQAAAAEAACcQAAAAELvMZ+6t8vPHDl4Oxfma5kWQ4IyNhoeaTe4Dys/1hezGJAorAczxXCTQEUDc6aOZKg==", "c227b8ab-304e-4c5a-8e51-f6681ba0a2a9" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "4b44ec32-7acd-40d3-b251-166ada6f563d", "AQAAAAEAACcQAAAAEIlsJH+H/cQKuDv0ZHXLteqvuGoVUAH3Z3jahr/X7AVw138/d4Uga8tQWQ3lxWRVVA==", "7f632cc2-2b7c-4638-8981-4d67bcdb758a" });
        }
    }
}
