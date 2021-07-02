using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class upgradeordertable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ReceiversAddress",
                table: "Order",
                maxLength: 200,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldMaxLength: 200);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Order",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "DeliveryDate",
                table: "Order",
                type: "DateTime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "DateTime");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "555a6145-51c4-4413-bfa9-ef80d1d81dde");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "3961267c-07e0-49cc-8aca-d20078641a65");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "67f4e8bf-e77d-49b2-8111-eec10b0b4f23");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "e81c242f-d34a-42be-8923-663c7274f2ec", "AQAAAAEAACcQAAAAEIJcQVOSgTiTbN5tfqS70SCAY9s8UEMKQltPn8qBnQrbw47MafseeJWBilhhPsdvjQ==", "29957f59-f70f-4de4-933d-31e4ecc8dae8" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "d32d5264-b131-46f5-a9d1-30703d3d4529", "AQAAAAEAACcQAAAAEJhjbfx63PlqpwkD+c8reu/PO9E+48Z/0+3aMjVXOsGPg/4enS3OUdIBB17J34yvqg==", "2d874c4d-229c-492a-b938-20abe78f65cb" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "bf23719c-772b-4a16-81d9-8cfb60d969ab", "AQAAAAEAACcQAAAAELudhThfIJb0SAUNWpuEe3wdbEeBRMlaLhgROiOCzIefwU5B/isb26hmeNxdcLPthQ==", "42f14b45-e99e-4edc-9741-c6999731d12c" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ReceiversAddress",
                table: "Order",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 200,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Order",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string));

            migrationBuilder.AlterColumn<DateTime>(
                name: "DeliveryDate",
                table: "Order",
                type: "DateTime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "DateTime",
                oldNullable: true);

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
        }
    }
}
