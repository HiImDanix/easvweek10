using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

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
        var mySetting = configuration["MySetting"];
        Console.WriteLine($"MySetting: {mySetting}");

        var connectionString = configuration.GetConnectionString("DefaultConnection");
        Console.WriteLine($"ConnectionString: {connectionString}");

        // If using dependency injection, you can configure services here
        var serviceProvider = new ServiceCollection()
            .AddSingleton<IConfiguration>(configuration)
            .BuildServiceProvider();

        var configFromDI = serviceProvider.GetService<IConfiguration>();
        Console.WriteLine($"Config from DI: {configFromDI["MySetting"]}");
    }
}
