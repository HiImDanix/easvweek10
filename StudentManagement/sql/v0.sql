IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [Course] (
    [id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Credits] int NOT NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY ([id])
);

CREATE TABLE [Enrollments] (
    [id] int NOT NULL IDENTITY,
    [StudentId] uniqueidentifier NOT NULL,
    [CourseId] int NOT NULL,
    [Grade] int NOT NULL,
    CONSTRAINT [PK_Enrollments] PRIMARY KEY ([id])
);

CREATE TABLE [Student] (
    [id] uniqueidentifier NOT NULL,
    [Firstname] nvarchar(max) NOT NULL,
    [Lastname] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [EnrollmentDate] date NOT NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY ([id])
);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303085828_InitialCreate', N'9.0.2');

COMMIT;
GO

