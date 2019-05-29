info: Microsoft.EntityFrameworkCore.Infrastructure[10403]
      Entity Framework Core 2.2.4-servicing-10062 initialized 'PortfolioDbContext' using provider 'Microsoft.EntityFrameworkCore.SqlServer' with options: MaxPoolSize=128 
IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Sections] (
    [SectionId] int NOT NULL IDENTITY,
    [Header] nvarchar(100) NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [ParentSectionId] int NULL,
    CONSTRAINT [PK_Sections] PRIMARY KEY ([SectionId]),
    CONSTRAINT [FK_Sections_Sections_ParentSectionId] FOREIGN KEY ([ParentSectionId]) REFERENCES [Sections] ([SectionId]) ON DELETE NO ACTION
);

GO

CREATE INDEX [IX_Sections_ParentSectionId] ON [Sections] ([ParentSectionId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20190516094425_InitialCreate', N'2.2.4-servicing-10062');

GO


