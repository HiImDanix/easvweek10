-- Drop Tables if they Exist
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Department;


--                  Assignment 1 - Creating models
create table Student
(
    Id             uniqueidentifier PRIMARY KEY,
    FirstName      nvarchar(50) NOT NULL,
    LastName       nvarchar(50) NOT NULL,
    Email          nvarchar(50) NOT NULL,
    EnrollmentDate date         NOT NULL
);
GO

CREATE TABLE Course
(
    Id      INT IDENTITY(1, 1) PRIMARY KEY,
    Title   NVARCHAR(100) NOT NULL,
    Credits INT           NOT NULL
);
GO

CREATE TABLE Enrollment
(
    Id        INT IDENTITY(1, 1) PRIMARY KEY,
    StudentId uniqueidentifier NOT NULL,
    CourseId  INT              NOT NULL,
    Grade     DECIMAL(3, 2)    NULL,

    FOREIGN KEY (StudentId) REFERENCES Student (Id),
    FOREIGN KEY (CourseId) REFERENCES Course (Id)
);
GO


--                  Assignment 2 - Add Middlename
ALTER TABLE Student
    ADD MiddleName varchar(255);
GO


--                  Assignment 3 - Add BirthDate
ALTER TABLE Student
    ADD DateOfBirth date;
GO;

--                  Assignment 4 - Add Instructor and relation to course
CREATE TABLE Instructor
(
    Id          uniqueidentifier PRIMARY KEY NOT NULL,
    Firstname   nvarchar(255) NOT NULL,
    Lastname    nvarchar(255) NOT NULL,
    Email       nvarchar(255) NOT NULL,
    Hiredate    date          NOT NULL
);
GO

ALTER TABLE Course
    ADD InstructorId uniqueidentifier NULL;
GO

ALTER TABLE Course ADD CONSTRAINT FK_Instructor
    FOREIGN KEY (InstructorId)
        REFERENCES Instructor (Id);
GO


--                  Assignment 5 - Rename Grade to FinalGrade
EXEC sp_rename 'Enrollment.Grade', 'FinalGrade', 'COLUMN';
GO

--                  Assignment 6 - Add Department

CREATE TABLE Department
(
    Id          INT IDENTITY(1, 1)  PRIMARY KEY,
    Name        NVARCHAR(100)       NOT NULL,
    Budget      DECIMAL(5,2)        NOT NULL,
    StartDate   DATE
);
GO

ALTER TABLE Department
ADD DepartmentHead uniqueidentifier NULL;
GO

ALTER TABLE Department ADD CONSTRAINT FK_Head
    FOREIGN KEY (DepartmentHead)
        REFERENCES Instructor (Id);
GO

--                  Assignment 7 - Modify Course Credits
ALTER TABLE Course
    ALTER COLUMN Credits DECIMAL(5,2);