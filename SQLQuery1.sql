IF DB_ID('RegistroGastos') IS NULL
    CREATE DATABASE RegistroGastos;
GO

USE RegistroGastos;
GO

IF OBJECT_ID('dbo.Categorias', 'U') IS NULL
    CREATE TABLE dbo.Categorias (
        Id     INT IDENTITY(1,1) PRIMARY KEY,
        Nombre NVARCHAR(100) NOT NULL UNIQUE
    );
GO

IF OBJECT_ID('dbo.Gastos', 'U') IS NULL
    CREATE TABLE dbo.Gastos (
        Id          INT IDENTITY(1,1) PRIMARY KEY,
        Descripcion NVARCHAR(500) NOT NULL,
        Monto       DECIMAL(18,2) NOT NULL,
        Fecha       DATE NOT NULL,
        CategoriaId INT NOT NULL
            CONSTRAINT FK_Gastos_Categorias REFERENCES dbo.Categorias(Id)
    );
GO

IF OBJECT_ID('dbo.Ingresos', 'U') IS NULL
    CREATE TABLE dbo.Ingresos (
        Id          INT IDENTITY(1,1) PRIMARY KEY,
        Descripcion NVARCHAR(500) NOT NULL,
        Monto       DECIMAL(18,2) NOT NULL,
        Fecha       DATE NOT NULL
    );
GO