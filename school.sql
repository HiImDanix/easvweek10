Create database studentMagementdatabase

create table Student(
	Id uniqueidentifier NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	EnrollmentDate date NOT NULL
);
GO

CREATE TABLE Course (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);
GO

CREATE TABLE Enrollment (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    StudentId uniqueidentifier NOT NULL,
    CourseId INT NOT NULL,
    Grade DECIMAL(3,2) NULL,

    FOREIGN KEY (StudentId) REFERENCES Student(Id),
    FOREIGN KEY (CourseId) REFERENCES Course(Id)
);
GO