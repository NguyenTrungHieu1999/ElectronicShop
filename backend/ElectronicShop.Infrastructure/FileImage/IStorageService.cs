using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace ElectronicShop.Infrastructure.FileImage
{
    public interface IStorageService
    {
        string CreatePath(int cateId, string fileName);

        Task<string> SaveFile(string path, IFormFile image);

        Task DeleteFileAsync(string filePath);
    }
}
