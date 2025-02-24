namespace StudentManagement.models;

public class Enrollment
{
    public int id { get; set; }
    public Guid StudentId { get; set; }
    public int CourseId { get; set; }
    public Grade Grade { get; set; }
}

public enum Grade
{
    Minusthree = -03,
    Zero = 00,
    Two = 02,
    Four = 04,
    Seven = 7,
    Ten = 10,
    Twelve = 12,
}