
namespace StudentManagement.models;

public class Instructor
{
    public Guid id { get; set; }
    public string Firstname { get; set; }
    public string Lastname { get; set; }
    public string Email { get; set; }
    public DateOnly HireDate { get; set; }
    public Department Department{ get; set; }
}