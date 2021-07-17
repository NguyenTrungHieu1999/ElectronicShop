using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class updateproducttableandproductcategorytable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ModifiedBy",
                table: "Product",
                maxLength: 100,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 30,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Product",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 30);

            migrationBuilder.AlterColumn<string>(
                name: "ModifiedBy",
                table: "Category",
                maxLength: 100,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 30,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Category",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 30);

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "2cb48413-4b03-491f-a24d-6dc499034218");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "5301a35b-544f-4583-9f1e-c23cc99e56b3");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "4440538e-0c39-4da1-90bf-fcf1e929a7fd");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "1170e0d1-6a4e-49fd-bda2-8f6ddfeadb78", "AQAAAAEAACcQAAAAEBcL1xICLUhbKUFYrVrQmKsZIaHb9rNr+kVF7AYTaNzRg3pDq8Sr/5yIZbVD6PfpUA==", "fff76992-e8d3-45a9-a9bc-2b905f22ec25" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "d3dfe2fb-c753-4fc9-9988-f8653b9b5f66", "AQAAAAEAACcQAAAAECs/w9NieQUvJ059QVBcl2ZIcdczWgvC+PlmCvUt7HwMjCGnCq5iPReXsKzaLAoasg==", "68f40dd8-cf5e-4649-bc36-8a7f80ac067d" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "7399040d-5ec1-4512-aa96-af57f69c0279", "AQAAAAEAACcQAAAAEB3+wOfGD726vIB/O/SDzA1o4HlFtCvhoFTBhFhytLWWYUI4YTeYWHb5uM1EV9liNA==", "7c07f92e-97b0-44a3-84e9-00d5c5ef78f5" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "ModifiedBy",
                table: "Product",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 100,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Product",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<string>(
                name: "ModifiedBy",
                table: "Category",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 100,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Category",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 100);

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "11adff5c-1ae1-4f38-a703-0f9e1d4c1aa4");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "c688f184-42fb-4012-b448-23ac10bf6abc");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "c7190e9f-5646-4db6-bde1-80f46d33866b");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "cfcf2e74-2c45-4d9a-a0ba-753bceebf046", "AQAAAAEAACcQAAAAEKB5V1RDKRIdOTzfOxkIVUgijeZ6wTuMm9jEAyNJSiYES9O++N+YGdbEX+baAJNB4Q==", "5476481d-3162-4231-bedc-fa293c696400" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "29f1171b-b084-442d-8788-eb010dc37f65", "AQAAAAEAACcQAAAAEJwa3otdOAjVeYmd0FXV9UczlbIdTgtutoNY6POaUOG8II2U4+dcSDtbnyBj04fl2w==", "1b649e12-486e-428c-9d88-93c59637b77a" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "35d91909-b6a0-47ea-81cb-a1a8ce19f8d3", "AQAAAAEAACcQAAAAEIWlsoQ9MkjZia5QQI6LJrWlwMNQWn5SmhRA25U3Gsj1mWplZ9Rys+CsytINFyvKvw==", "9c32b7ba-8fe1-474e-b911-a723e7b39448" });
        }
    }
}
