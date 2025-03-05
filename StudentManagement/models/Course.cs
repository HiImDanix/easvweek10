namespace StudentManagement.models;

public class Course
{
    public int id {get; set;}
    public string Title {get; set;}
    public decimal Credits {get; set;}
    public Instructor InstructorId {get; set;}
}