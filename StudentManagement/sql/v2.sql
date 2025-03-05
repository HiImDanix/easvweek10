BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [DateofBirth] nvarchar(max) NOT NULL DEFAULT N'';

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303123143_AddedDateOfBirth', N'9.0.2');

COMMIT;
GO

