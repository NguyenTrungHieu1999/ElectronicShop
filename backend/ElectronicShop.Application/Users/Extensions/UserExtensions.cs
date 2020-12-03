using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Users.Extensions
{
    public static class UserExtensions
    {
        public static void Map(this User user, UpdateUserCommand request)
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
