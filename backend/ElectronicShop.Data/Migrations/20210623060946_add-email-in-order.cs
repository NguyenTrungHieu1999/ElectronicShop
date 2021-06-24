using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class addemailinorder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Order",
                nullable: true);

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Email",
                table: "Order");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "998c220f-5f7e-41fa-bc82-82f28ed3e573");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "e12467a9-3251-4208-a8f0-12b9761337d8");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "e602db19-9c4b-4d6d-9703-8a1aed658a3c");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "9b361495-7d2f-4c7c-8dc4-7e8000f3d7a1", "AQAAAAEAACcQAAAAEPsJ7XhtfQxFEoUurBXmkS8dEOI+CFr7wUV5pxO9zczJvg8834zm19bS88VM0GsOMg==", "0fdcfd55-c439-4272-a187-ed3372e5946a" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "ab85b22a-d7ab-4dd4-88e7-9d9cd5df3671", "AQAAAAEAACcQAAAAEBtcSWRxc2LCxPBwGcI7RnjHz2XGjFWCI/3k12mFQ95Mnh+20XwQa3ZaLDgIIx/NOg==", "47f88517-461a-4b37-b5b6-873df125e8d7" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "d7038ab2-b359-4528-8822-7de7af1cdfb2", "AQAAAAEAACcQAAAAENWVn4kvQWdE2s3k21pQJr45HIFZR8CSAeQ51m96Wgo9s5lgKSh01eOmxb5W1I5N0w==", "efdab32e-fce0-4c51-82bd-4c7df929577e" });
        }
    }
}
