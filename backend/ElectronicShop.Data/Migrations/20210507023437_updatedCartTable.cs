using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class updatedCartTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Status",
                table: "Cart",
                nullable: false,
                defaultValue: false);

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Cart");

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
        }
    }
}
