using AutoMapper;
using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Mapper;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Users.Services;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.SendMail;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Text;
using ElectronicShop.Application.Categories.Services;

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
        [Obsolete]
        public void ConfigureServices(IServiceCollection services)
        {
            // Model state validation filter ASP.NET Core
            services.AddScoped<ValidationFilterAttribute>();

            // Handler for MediatR query ASP.Net Core
            services.AddMediatR(AppDomain.CurrentDomain.GetAssemblies());

<<<<<<< HEAD
<<<<<<< HEAD
            // Fix .Net Core 3.1 possible object cycle was detected which is not supported
            services.AddControllers()
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                );
=======
            services.AddControllers();
>>>>>>> parent of 0fd6cc0... temp

=======
>>>>>>> parent of dfe0bd1... fix bugs
            // Compatibility version for ASP.NET Core MVC
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Latest);

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
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "ElectronicShop", Version = "v1" });

                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme."
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
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
                             new string[] {}
                     }
                 });
            });

            // Configure the authentication schema with JWT bearer options
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
           // Adding Jwt Bearer
           .AddJwtBearer(options =>
           {
               options.SaveToken = true;
               options.RequireHttpsMetadata = false;
               options.TokenValidationParameters = new TokenValidationParameters()
               {
                   ValidateIssuerSigningKey = true,
                   ValidateIssuer = true,
                   ValidateAudience = true,
                   ValidAudience = Configuration["JWT:ValidAudience"],
                   ValidIssuer = Configuration["JWT:ValidIssuer"],
                   RequireExpirationTime = true,
                   ValidateLifetime = true,
                   ClockSkew = TimeSpan.Zero,
                   IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:Secret"]))
               };
           });

            // For use AutoMapper
            services.AddAutoMapper(typeof(ElectronicShopProfile));

            // For use ElectronicShopDbContext
            services.AddDbContext<ElectronicShopDbContext>();
            services.AddIdentity<User, Role>()
                .AddEntityFrameworkStores<ElectronicShopDbContext>()
                .AddDefaultTokenProviders();

            // For .NET Core MVC Page Not Refreshing After Changes
            services.AddControllersWithViews().AddRazorRuntimeCompilation();

            // Insert SMTP settings parser and initialize a singleton object that will handle mail service
            services.Configure<SmtpSettings>(Configuration.GetSection("SmtpSettings"));
            services.AddSingleton<IMailer, Mailer>();

            // DI
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IAuthService, AuthService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<UserManager<User>, UserManager<User>>();
            services.AddTransient<SignInManager<User>, SignInManager<User>>();
            services.AddTransient<IRepositoryWrapper, RepositoryWrapper>();

<<<<<<< HEAD
<<<<<<< HEAD
            // Fix Create Url.Action is null
=======
            services.AddControllers();

>>>>>>> parent of dfe0bd1... fix bugs
=======
            // Fix Url
>>>>>>> parent of 0fd6cc0... temp
            services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();
            services.AddScoped<IUrlHelper>(x => {
                var actionContext = x.GetRequiredService<IActionContextAccessor>().ActionContext;
                var factory = x.GetRequiredService<IUrlHelperFactory>();
                return factory.GetUrlHelper(actionContext);
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();

            // Configure the authentication schema with JWT bearer options
            app.UseAuthorization();

            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "ElectronicShop API V1");
            });

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
