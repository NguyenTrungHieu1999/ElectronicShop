using System.Threading.Tasks;

namespace ElectronicShop.Infrastructure.SendMail
{
    public interface IMailer
    {
        Task SenEmailAsync(string email, string subject, string body);
    }
}
