
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/09/2016 20:39:07
-- Generated from EDMX file: C:\Workspace\Vanity\Makerspace\MakerspaceWeb\Models\MakerModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-MakerspaceWeb-20160308083404];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Areas'
CREATE TABLE [dbo].[Areas] (
    [AreaId] int IDENTITY(1,1) NOT NULL,
    [AreaName] nvarchar(max)  NOT NULL,
    [MinAge] int  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [MemberId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Birthdate] datetime  NOT NULL
);
GO

-- Creating table 'Classes'
CREATE TABLE [dbo].[Classes] (
    [ClassId] int IDENTITY(1,1) NOT NULL,
    [AreaId] int  NOT NULL,
    [ClassName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Credits'
CREATE TABLE [dbo].[Credits] (
    [CreditId] int IDENTITY(1,1) NOT NULL,
    [ClassId] int  NOT NULL,
    [MemberId] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL
);
GO

-- Creating table 'AreaAssignments'
CREATE TABLE [dbo].[AreaAssignments] (
    [AreaAssignmentId] int IDENTITY(1,1) NOT NULL,
    [AreaId] int  NOT NULL,
    [MemberId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AreaId] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [PK_Areas]
    PRIMARY KEY CLUSTERED ([AreaId] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [ClassId] in table 'Classes'
ALTER TABLE [dbo].[Classes]
ADD CONSTRAINT [PK_Classes]
    PRIMARY KEY CLUSTERED ([ClassId] ASC);
GO

-- Creating primary key on [CreditId] in table 'Credits'
ALTER TABLE [dbo].[Credits]
ADD CONSTRAINT [PK_Credits]
    PRIMARY KEY CLUSTERED ([CreditId] ASC);
GO

-- Creating primary key on [AreaAssignmentId] in table 'AreaAssignments'
ALTER TABLE [dbo].[AreaAssignments]
ADD CONSTRAINT [PK_AreaAssignments]
    PRIMARY KEY CLUSTERED ([AreaAssignmentId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClassId] in table 'Credits'
ALTER TABLE [dbo].[Credits]
ADD CONSTRAINT [FK_ClassesCredits]
    FOREIGN KEY ([ClassId])
    REFERENCES [dbo].[Classes]
        ([ClassId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassesCredits'
CREATE INDEX [IX_FK_ClassesCredits]
ON [dbo].[Credits]
    ([ClassId]);
GO

-- Creating foreign key on [MemberId] in table 'Credits'
ALTER TABLE [dbo].[Credits]
ADD CONSTRAINT [FK_MembersCredits]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersCredits'
CREATE INDEX [IX_FK_MembersCredits]
ON [dbo].[Credits]
    ([MemberId]);
GO

-- Creating foreign key on [AreaId] in table 'AreaAssignments'
ALTER TABLE [dbo].[AreaAssignments]
ADD CONSTRAINT [FK_AreasAreaAssignments]
    FOREIGN KEY ([AreaId])
    REFERENCES [dbo].[Areas]
        ([AreaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AreasAreaAssignments'
CREATE INDEX [IX_FK_AreasAreaAssignments]
ON [dbo].[AreaAssignments]
    ([AreaId]);
GO

-- Creating foreign key on [MemberId] in table 'AreaAssignments'
ALTER TABLE [dbo].[AreaAssignments]
ADD CONSTRAINT [FK_MembersAreaAssignments]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersAreaAssignments'
CREATE INDEX [IX_FK_MembersAreaAssignments]
ON [dbo].[AreaAssignments]
    ([MemberId]);
GO

-- Creating foreign key on [AreaId] in table 'Classes'
ALTER TABLE [dbo].[Classes]
ADD CONSTRAINT [FK_AreasClasses]
    FOREIGN KEY ([AreaId])
    REFERENCES [dbo].[Areas]
        ([AreaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AreasClasses'
CREATE INDEX [IX_FK_AreasClasses]
ON [dbo].[Classes]
    ([AreaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------