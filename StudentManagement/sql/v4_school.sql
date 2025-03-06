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