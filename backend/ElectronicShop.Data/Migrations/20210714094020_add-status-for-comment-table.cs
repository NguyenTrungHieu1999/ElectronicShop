using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class addstatusforcommenttable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Status",
                table: "Comment",
                nullable: false,
                defaultValue: false);

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Comment");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "ba27fd86-ece5-4f43-9036-936ba1674ab1");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "c5ddc999-faa3-4acb-925b-5636264bdc88");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "de719138-4d33-4979-a248-22fb71893d45");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "5fe46cb8-83c4-4c6a-a6b0-6ccbe18b9cd4", "AQAAAAEAACcQAAAAEH+FwG8YlCIgBqEzDEstvarC1dgF2d7IZ6DQ0ydWQCFRH4dvFJX0PmAbcBYBWZXGyw==", "e05eb894-a529-4ef1-b3e8-633834d18946" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "1e70d7de-46d5-49b4-85aa-75de3f3d0762", "AQAAAAEAACcQAAAAEJxtmqPBr+kDE2khwlP28jnbPjG9dLdUxnmBf7mXQSpvSM1/XAAuqoxYx2iIMx7+dg==", "32a2eb8f-c59f-4901-8642-1f0b74fbba51" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c673a018-2e4a-44c0-9a28-8f132dc3a5b5", "AQAAAAEAACcQAAAAEJ7xL9kLPlrlFpy95wCLxwATwb7jN3TWONQWnUW3p6aNL+NmR3AA/Ih/dUnEfusYEQ==", "26bec708-3158-4dba-b0de-3ab8fcf496ff" });
        }
    }
}
