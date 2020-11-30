using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Users.Extensions
{
    public static class UserExtensions
    {
        public static void Map(this User user, UserUpdateRequest request)
        {
            user.FirstMiddleName = request.FirstMiddleName;
            user.LastName = request.LastName;
            user.PhoneNumber = request.PhoneNumber;
            user.Gender = request.Gender;
            user.Birthday = request.Birthday;
            user.Address = request.Address;
            user.Status = request.Status;
        }
    }
}
