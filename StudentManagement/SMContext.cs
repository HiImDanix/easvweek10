using System.Reflection;
using Microsoft.EntityFrameworkCore;
using StudentManagement.models;

namespace StudentManagement;

public class SMContext : DbContext
{
    
    public DbSet<Student> Students { get; set; }
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Instructor> Instructors { get; set; }
    public DbSet<Department> Departments { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(connectionString: "");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        modelBuilder.Entity<Department>()
        .HasOne(d => d.DepartmentHead)
        .WithOne(i => i.Department)
        .HasForeignKey<Department>(d => d.DepartmentHeadId)
        .OnDelete(DeleteBehavior.SetNull);

        modelBuilder.Entity<Course>()
        .Property(c => c.Credits)
        .HasColumnType("decimal(5,2)");
    }
    
}