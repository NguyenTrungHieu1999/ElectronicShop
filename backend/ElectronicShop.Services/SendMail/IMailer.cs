using System.Threading.Tasks;

namespace ElectronicShop.Services.SendMail
{
    public interface IMailer
    {
        Task SenEmailAsync(string email, string subject, string body);
    }
}
