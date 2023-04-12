using Microsoft.EntityFrameworkCore;
using PasswordManagerAPI.Models;

namespace PasswordManagerAPI.Data
{
    public class PasswordManagerContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DbSet<Password> Password { get;set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                    .AddJsonFile("appsettings.json")
                    .Build();

                optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            }
        }
    }
}
