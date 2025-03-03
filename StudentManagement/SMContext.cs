using System.Reflection;
using Microsoft.EntityFrameworkCore;
using StudentManagement.models;

namespace StudentManagement;

public class SMContext : DbContext
{
    public DbSet<Student> Student { get; set; }
    public DbSet<Course> Course { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    
    //Do not implement a constructor in this class!! Mainly because, it is not used.

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
    }
    
}