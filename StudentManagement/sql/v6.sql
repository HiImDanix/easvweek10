BEGIN TRANSACTION;
ALTER TABLE [Courses] DROP CONSTRAINT [FK_Courses_Instructor_InstructorIdid];

ALTER TABLE [Instructor] DROP CONSTRAINT [PK_Instructor];

EXEC sp_rename N'[Instructor]', N'Instructors', 'OBJECT';

ALTER TABLE [Instructors] ADD CONSTRAINT [PK_Instructors] PRIMARY KEY ([id]);

CREATE TABLE [Departments] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Budget] int NOT NULL,
    [StartDate] datetime2 NOT NULL,
    [DepartmentHeadId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Departments_Instructors_DepartmentHeadId] FOREIGN KEY ([DepartmentHeadId]) REFERENCES [Instructors] ([id]) ON DELETE SET NULL
);

CREATE UNIQUE INDEX [IX_Departments_DepartmentHeadId] ON [Departments] ([DepartmentHeadId]);

ALTER TABLE [Courses] ADD CONSTRAINT [FK_Courses_Instructors_InstructorIdid] FOREIGN KEY ([InstructorIdid]) REFERENCES [Instructors] ([id]) ON DELETE CASCADE;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250305103309_AddedDepartment', N'9.0.2');

COMMIT;
GO

