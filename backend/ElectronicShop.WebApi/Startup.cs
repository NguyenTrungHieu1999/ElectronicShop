using AutoMapper;
using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Mapper;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Application.Users.Services;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;
using ElectronicShop.Infrastructure.SendMail;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Text;
using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Comments.Services;
using ElectronicShop.Application.Favorites.Services;
using ElectronicShop.Application.OrderDetails.Services;
using ElectronicShop.Application.ProductPhotos.Services;
using ProductService = ElectronicShop.Application.Products.Services.ProductService;
using ElectronicShop.Application.Orders.Services;
using ElectronicShop.Application.ProductReviews.Services;
using Microsoft.AspNetCore.Authentication.Cookies;

namespace ElectronicShop.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
            {
                builder.WithOrigins("http://localhost:3001/", "http://localhost:3000/")
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials()
                    .SetIsOriginAllowed((host) => true);
            }));

            // Model state validation filter ASP.NET Core
            services.AddScoped<ValidationFilterAttribute>();

            // Handler for MediatR query ASP.Net Core
            services.AddMediatR(AppDomain.CurrentDomain.GetAssemblies());

            // Fix .Net Core 3.1 possible object cycle was detected which is not supported
            services.AddControllers()
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                );

            // Compatibility version for ASP.NET Core MVC
            services.AddMvc(); //.SetCompatibilityVersion(CompatibilityVersion.Latest);

            // For use Session
            services.AddDistributedMemoryCache();
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromHours(3);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            // In the accepted answer "Bearer " is required to be written before the actual token. 
            // A similar approach in which typing "Bearer " can be skipped is the following:
            // Enable Swagger   
            services.AddSwaggerGen(swagger =>
            {
                //This is to generate the Default UI of Swagger Documentation  
                swagger.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "JWT Token Authentication API",
                    Description = "ASP.NET Core 3.1 Web API"
                });
                // To Enable authorization using Swagger (JWT)  
                swagger.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description =
                        "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 12345abcdef\"",
                });
                swagger.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            }
                        },
                        new string[] { }
                    }
                });
            });

            services.AddAuthentication(option =>
                {
                    option.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    option.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                    option.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = false,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = Configuration["Jwt:ValidIssuer"],
                        ValidAudience = Configuration["Jwt:ValidAudience"],
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Secret"]))
                    };
                });

            // For use AutoMapper
            services.AddAutoMapper(typeof(ElectronicShopProfile));

            // For use ElectronicShopDbContext
            services.AddDbContext<ElectronicShopDbContext>();
            services.AddIdentity<User, Role>()
                .AddEntityFrameworkStores<ElectronicShopDbContext>()
                .AddDefaultTokenProviders();

            // Insert SMTP settings parser and initialize a singleton object that will handle mail service
            services.Configure<SmtpSettings>(Configuration.GetSection("SmtpSettings"));
            services.AddSingleton<IMailer, Mailer>();

            // DI
            services.AddTransient<IStorageService, FileStorageService>();
            services.AddTransient<IProductReviewService, ProductReviewService>();
            services.AddTransient<ICommentService, CommentService>();
            services.AddTransient<IOrderDetailService, OrderDetailService>();
            services.AddTransient<IOrderService, OrderService>();
            services.AddTransient<IProductPhotoService, ProductPhotoService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IAuthService, AuthService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<UserManager<User>, UserManager<User>>();
            services.AddTransient<SignInManager<User>, SignInManager<User>>();
            services.AddTransient<ICartService, CartService>();
            services.AddTransient<IFavoriteService, FavoriteService>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseRouting();

            // Configure the authentication schema with JWT bearer options
            app.UseAuthorization();

            app.UseAuthentication();

            app.UseCors("MyPolicy");

            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c => { c.SwaggerEndpoint("/swagger/v1/swagger.json", "ElectronicShop API V1"); });

            app.UseSession();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Users}/{action=GetAllUser}");
            });
        }
    }
}