using ElectronicShop.Data.EF;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace ElectronicShop.Infrastructure.FileImage
{
    public class FileStorageService : IStorageService
    {
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ElectronicShopDbContext _context;

        public FileStorageService(IWebHostEnvironment webHostEnvironment, ElectronicShopDbContext context)
        {
            _webHostEnvironment = webHostEnvironment;
            _context = context;
        }

        public async Task<string> SaveFile(string path, IFormFile image)
        {
            string uniqueFileName = null;

            if (image != null)
            {
                var originalFileName = ContentDispositionHeaderValue.Parse(image.ContentDisposition).FileName.Trim('"');
                uniqueFileName = $"{Guid.NewGuid()}{Path.GetExtension(originalFileName)}";

                // Specify the directory you want to manipulate.
                string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), _webHostEnvironment.WebRootPath, path);

                try
                {
                    // Determine whether the directory exists.
                    if (!Directory.Exists(uploadsFolder))
                    {
                        // Try to create the directory.
                        DirectoryInfo di = Directory.CreateDirectory(uploadsFolder);

                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await image.CopyToAsync(stream);
                        }
                    }
                }
                catch
                {
                    return null;
                }
            }

            return uniqueFileName;
        }

        public async Task DeleteFileAsync(string filePath)
        {
            string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), _webHostEnvironment.WebRootPath, filePath);

            if (File.Exists(filePath))
            {
                await Task.Run(() => File.Delete(filePath));
            }
        }

        public string CreateProductPath(int cateId, string productName)
        {
            var query = from c in _context.Categories
                where c.Id.Equals(cateId)
                join t in _context.ProductTypes
                    on c.ProductTypeId equals t.Id
                select new
                {
                    C = c.Name,
                    T = t.Name
                };

            string path = null;

            foreach (var i in query)
            {
                path = "images/products/" + i.T + "/" + productName;
            }

            return path;
        }
        
        public void ChangeNameFolder(string fromFolder, string toFolder)
        {
            string source = Path.Combine(Directory.GetCurrentDirectory(), _webHostEnvironment.WebRootPath, fromFolder);

            string destination = Path.Combine(Directory.GetCurrentDirectory(), _webHostEnvironment.WebRootPath, toFolder);

            Directory.Move(source, destination);
        }
    }
}