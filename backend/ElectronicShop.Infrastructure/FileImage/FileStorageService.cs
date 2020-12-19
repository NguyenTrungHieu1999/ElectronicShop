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
        private readonly ElectronicShopDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public FileStorageService(ElectronicShopDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
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

            return Path.Combine(path, uniqueFileName);
        }

        public string CreatePath(int cateId, string fileName)
        {
            var query = from c in _context.Categories
                        where c.Id.Equals(cateId)
                        join r in _context.Categories
                            on c.RootId equals r.Id
                        join t in _context.ProductTypes
                            on c.ProductTypeId equals t.Id
                        select new
                        {
                            C = c.Name,
                            R = r.Name,
                            T = t.Name
                        };

            string path = null;

            foreach (var i in query)
            {
                path = i.T + @"\" + i.R + @"\" + i.C + @"\" + fileName;
            }

            return path;
        }

        public async Task DeleteFileAsync(string filePath)
        {
            string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), _webHostEnvironment.WebRootPath, filePath);

            if (File.Exists(filePath))
            {
                await Task.Run(() => File.Delete(filePath));
            }
        }
    }
}