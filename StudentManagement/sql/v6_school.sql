
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


ALTER TABLE Department ADD CONSTRAINT FK_Head
    FOREIGN KEY (DepartmentHead)
        REFERENCES Instructor (Id);
GO