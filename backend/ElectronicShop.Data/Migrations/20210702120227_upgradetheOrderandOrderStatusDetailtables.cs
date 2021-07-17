using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class upgradetheOrderandOrderStatusDetailtables : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "EmpId",
                table: "OrderStatusDetail",
                nullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "TotalMoney",
                table: "Order",
                type: "decimal(18,0)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,0)");

            migrationBuilder.AddColumn<string>(
                name: "Note",
                table: "Order",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "15a0a73c-eb36-427b-a57a-ecef5ffad17f");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "112ae06e-5b43-4e01-9a42-899d573a4a01");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "7872877c-eebb-4e7a-b998-e283b9a421b5");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "cd25075c-8835-4f55-94aa-ecc459d933c9", "AQAAAAEAACcQAAAAEOstkkpKRw/XKQ4GE2nh9DvlCKOKBpZH+Zj04duzUAObQUT+i6IYpO4VQaT6/3c8Hw==", "72d202cd-5e46-46ff-afe4-ade6085aec3d" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "21b37a4d-cba3-4bc2-bf3e-0e412aab6b62", "AQAAAAEAACcQAAAAEAVLFQu7hLJ5093NQa7vncuZWMYQpTXaEUHOWtVJsOzGIphOFwyYEpX231v9vBr5Gg==", "0de9b17f-b7fd-4b83-9dab-f0166385a275" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "bfa476cf-fc15-4b60-b1f1-846b31f5ba26", "AQAAAAEAACcQAAAAEBujDbRlIK1w3GJQcYwM6kz1bXlstuBxlZtiDPfQp1INgC5VUWU41/4iqCDynud1kw==", "ffcaf89a-7195-4583-9331-17e268fdeb0b" });

            migrationBuilder.CreateIndex(
                name: "IX_OrderStatusDetail_EmpId",
                table: "OrderStatusDetail",
                column: "EmpId");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderStatusDetail_User_EmpId",
                table: "OrderStatusDetail",
                column: "EmpId",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderStatusDetail_User_EmpId",
                table: "OrderStatusDetail");

            migrationBuilder.DropIndex(
                name: "IX_OrderStatusDetail_EmpId",
                table: "OrderStatusDetail");

            migrationBuilder.DropColumn(
                name: "EmpId",
                table: "OrderStatusDetail");

            migrationBuilder.DropColumn(
                name: "Note",
                table: "Order");

            migrationBuilder.AlterColumn<decimal>(
                name: "TotalMoney",
                table: "Order",
                type: "decimal(18,0)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,0)",
                oldDefaultValue: 0m);

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
        }
    }
}
