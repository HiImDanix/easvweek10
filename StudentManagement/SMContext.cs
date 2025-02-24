using System.Reflection;
using Microsoft.EntityFrameworkCore;
using StudentManagement.models;

namespace StudentManagement;

public class SMContext : DbContext
{
    public DbSet<Student> Student { get; set; }
    public DbSet<Course> Course { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    
    public SMContext(DbContextOptions<SMContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
    }
    
}