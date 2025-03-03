
namespace StudentManagement.models;

public class Student
{
    public Guid id { get; set; }
    public string Firstname { get; set; }
    public string Middlename { get; set; }
    public string Lastname { get; set; }
    public string Email { get; set; }
    public DateOnly EnrollmentDate { get; set; }
}