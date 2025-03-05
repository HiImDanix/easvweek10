BEGIN TRANSACTION;
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303094731_V1__InitialSchema', N'9.0.2');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303094919_WithMiddleName', N'9.0.2');

ALTER TABLE [Students] ADD [Middlename] nvarchar(max) NOT NULL DEFAULT N'';

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303123036_AddedMiddleName', N'9.0.2');

COMMIT;
GO

