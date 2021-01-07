using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace ElectronicShop.Infrastructure.FileImage
{
    public interface IStorageService
    { 
        Task<string> SaveFile(string path, IFormFile image);

        Task DeleteFileAsync(string filePath);

        string CreateProductPath(int cateId, string productName);

        void ChangeNameFolder(string fromFoler, string toFolder);
    }
}
