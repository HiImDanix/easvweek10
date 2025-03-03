using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using System;
using StudentManagement;

class Program
{
    static void Main(string[] args)
    {
        // Set up configuration sources.
        var configuration = new ConfigurationBuilder()
            .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)  // Ensure it's looking in the right directory
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .Build();

        // Access configuration values
        var connectionString = configuration.GetConnectionString("DefaultConnection");
        Console.WriteLine($"ConnectionString: {connectionString}");

        // If using dependency injection, you can configure services here
        var serviceProvider = new ServiceCollection()
            .AddSingleton<IConfiguration>(configuration)
            .AddDbContext<SMContext>()
            .BuildServiceProvider();

        using (var context = serviceProvider.GetService<SMContext>())
        {
            if (context == null)
            {
                Console.WriteLine("Error: Could not resolve SMContext.");
            }
            else
            {
                Console.WriteLine("SMContext initialized successfully.");
            }
        }

        Console.WriteLine("Application setup complete.");
    }
}
