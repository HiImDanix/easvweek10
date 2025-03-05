BEGIN TRANSACTION;
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250305095314_RemoveGradeColumn', N'9.0.2');

EXEC sp_rename 'Enrollment.Grade', 'FinalGrade', 'COLUMN';

COMMIT;
GO

