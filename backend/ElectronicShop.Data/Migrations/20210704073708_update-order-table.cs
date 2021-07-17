using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class updateordertable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ReceiversAddress",
                table: "Order",
                maxLength: 200,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldMaxLength: 200,
                oldNullable: true);

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
                value: "d93db9c3-3984-44e9-8ccd-aa83a4920445");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "2f5ed3f2-370e-45d6-9cec-eae24ebd3d84");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "b8a5167d-f7fd-428e-9c14-07e235d94ea5");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "6b8d905c-28e9-451e-89c3-18603e2bfb1a", "AQAAAAEAACcQAAAAEB5poc7DjzBhESi4aMWHVfbwcelwTSAc1IsL1JteY0+h9/GRY+0dyIKpRANg5sDyLg==", "a34917ca-a186-41f8-85f0-415b938fe2a8" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c455d2cf-6bb7-4805-9541-2acd58871a1c", "AQAAAAEAACcQAAAAEHLZ+EKsYfzAZ1p8rIo/D9SBBwBzvmRxzzI7AV5TmkCKYgk+0HPJXRBGMeek8DYv1A==", "789c9373-4516-41e7-ae7d-eb100c41e2e2" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "7c62c16e-b797-4346-8e74-49b0b9a2d319", "AQAAAAEAACcQAAAAEMwgiOtJ5YYPZjJuE2AkSTIY0kqJlwSooIMSvmGJscDBx0bMaiWNNPutCWZ1nlvAeA==", "31096827-ea4e-45dd-a224-5369a867f4b3" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ReceiversAddress",
                table: "Order",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 200);

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
    }
}
