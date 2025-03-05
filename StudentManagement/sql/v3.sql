BEGIN TRANSACTION;
ALTER TABLE [Courses] ADD [InstructorIdid] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';

CREATE TABLE [Instructor] (
    [id] uniqueidentifier NOT NULL,
    [Firstname] nvarchar(max) NOT NULL,
    [Lastname] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [HireDate] date NOT NULL,
    CONSTRAINT [PK_Instructor] PRIMARY KEY ([id])
);

CREATE INDEX [IX_Courses_InstructorIdid] ON [Courses] ([InstructorIdid]);

ALTER TABLE [Courses] ADD CONSTRAINT [FK_Courses_Instructor_InstructorIdid] FOREIGN KEY ([InstructorIdid]) REFERENCES [Instructor] ([id]) ON DELETE CASCADE;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303124007_AddedInstructor', N'9.0.2');

COMMIT;
GO

