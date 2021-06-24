using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class fnsoundex : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            var fn = @"CREATE FUNCTION [dbo].[udfSoundex]
                        (
                            @Soundex nvarchar(100)
                        )
                        RETURNS nvarchar(100)
                        AS
                        BEGIN
                            RETURN Soundex(@Soundex)
                        END";

            migrationBuilder.Sql(fn);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
    }
}
