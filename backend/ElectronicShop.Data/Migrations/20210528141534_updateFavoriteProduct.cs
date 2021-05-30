using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class updateFavoriteProduct : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Status",
                table: "FavoriteProduct",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "6071e416-6e05-4b87-b508-b1d3f8d5e57f");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "0d7a3a68-04a1-4120-9352-f5587283dbff");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "77c7e9f9-538f-4e86-8263-9fd49d3c57b4");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "38164754-6f9a-4193-a961-567f65e5d806", "AQAAAAEAACcQAAAAEGuRrrBrgyCIFHjC4zxe8j2AnknC6rskDcmwtRhU+rjvKuiDM22F7n1lrNQh0YUj9A==", "a63e5047-4177-412c-a786-b5fa40643bf6" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "467238f9-b065-49e1-b287-3e2b86407206", "AQAAAAEAACcQAAAAEOqNwD9p+yU7tlf6SutKtsJ5n+cwre1OtsIM04jladRhGWQ8OR3HhPRxzOz1Y0xoZA==", "31b1efb3-4bfa-409a-b11b-6116d3201d44" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c7a4d59f-92f8-41e4-820e-fc03596c9731", "AQAAAAEAACcQAAAAEOZjFWpuGayUfnYCCZzVqvnz9xSxKsPsxwWNHe6P1QUCFtUYnd3lUTD/qFKG1aKusg==", "462c4ef2-6ab5-4429-b322-5389dcfe49b0" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "FavoriteProduct");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "84a6500c-1870-4d67-92cf-ce2a6f5b03d9");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "615e9f7d-cf79-4167-8c04-0e6bb71b0899");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "58c7258b-7e2b-4708-8bee-4ac78662979b");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "9a5bcf20-6a4b-4220-86bf-1210543a5264", "AQAAAAEAACcQAAAAEB5J757WrSf5l1ahs+oN6YiJFe7OvDxMDB0voL3dcZvbk4LeJ25n/AGJ7SmGiY5fQw==", "43d1af16-232c-4ff0-9a17-ecf14dc47143" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c97663f6-5df4-4098-81b3-891d80bc2c4b", "AQAAAAEAACcQAAAAEDwypp7zgac2roT5XrgEZ5+zeEDSvU9BYT4tny1Nu1bfOG4jJXc/hPYahWKXt4zuQA==", "d26634ac-5615-4c5a-b47c-06df855ef9e7" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "07385a15-5461-4e27-9719-74d7c320f9f0", "AQAAAAEAACcQAAAAEMjiVLIjrWzWz6lqk+44qSjPAxFd3myqzXgT8rTozgB210BYuUemx6N2jvozQ4CRJA==", "1d677c83-eb10-4167-965e-4bd796af7275" });
        }
    }
}
