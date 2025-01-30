-- Script para criar um banco de dados estruturado com os níveis: Empreendimentos, Tipologias e Unidades no SQL Server

-- Criação do banco de dados
CREATE DATABASE Imoveis;
GO

USE Imoveis;
GO

-- Tabela de Empreendimentos
CREATE TABLE Empreendimentos (
    EmpreendimentoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(255) NOT NULL,
    Endereco NVARCHAR(500) NOT NULL,
    Status NVARCHAR(50) CHECK (Status IN ('Lançamento', 'Em Construção', 'Pronto')) NOT NULL,
    Construtora NVARCHAR(255) NOT NULL,
    FaixaPrecoMin DECIMAL(18, 2),
    FaixaPrecoMax DECIMAL(18, 2),
    TotalUnidades INT NOT NULL
);

-- Tabela de Tipologias
CREATE TABLE Tipologias (
    TipologiaID INT IDENTITY(1,1) PRIMARY KEY,
    EmpreendimentoID INT FOREIGN KEY REFERENCES Empreendimentos(EmpreendimentoID),
    Descricao NVARCHAR(255) NOT NULL,
    AreaMedia DECIMAL(10, 2) NOT NULL,
    PrecoMedio DECIMAL(18, 2) NOT NULL,
    UnidadesDisponiveis INT NOT NULL
);

-- Tabela de Unidades
CREATE TABLE Unidades (
    UnidadeID INT IDENTITY(1,1) PRIMARY KEY,
    TipologiaID INT FOREIGN KEY REFERENCES Tipologias(TipologiaID),
    NumeroQuartos INT NOT NULL,
    NumeroBanheiros INT NOT NULL,
    VagasGaragem INT NOT NULL,
    AreaPrivativa DECIMAL(10, 2) NOT NULL,
    Preco DECIMAL(18, 2) NOT NULL,
    LinkAnuncio NVARCHAR(500)
);

-- Inserindo dados de exemplo na tabela de Empreendimentos
INSERT INTO Empreendimentos (Nome, Endereco, Status, Construtora, FaixaPrecoMin, FaixaPrecoMax, TotalUnidades)
VALUES
('Residencial Bella Vista', 'Rua das Flores, 123, Bairro A', 'Lançamento', 'Construtora A', 300000.00, 500000.00, 100),
('Edifício Porto Seguro', 'Av. Central, 456, Bairro B', 'Em Construção', 'Construtora B', 500000.00, 800000.00, 80);

-- Inserindo dados de exemplo na tabela de Tipologias
INSERT INTO Tipologias (EmpreendimentoID, Descricao, AreaMedia, PrecoMedio, UnidadesDisponiveis)
VALUES
(1, 'Apartamento 2 quartos', 65.00, 350000.00, 50),
(1, 'Apartamento 3 quartos', 85.00, 450000.00, 50),
(2, 'Apartamento 2 quartos', 70.00, 550000.00, 40),
(2, 'Apartamento 3 quartos', 90.00, 750000.00, 40);

-- Inserindo dados de exemplo na tabela de Unidades
INSERT INTO Unidades (TipologiaID, NumeroQuartos, NumeroBanheiros, VagasGaragem, AreaPrivativa, Preco, LinkAnuncio)
VALUES
(1, 2, 2, 1, 65.00, 350000.00, 'https://exemplo.com/anuncio1'),
(1, 2, 2, 1, 65.00, 360000.00, 'https://exemplo.com/anuncio2'),
(2, 3, 3, 2, 85.00, 450000.00, 'https://exemplo.com/anuncio3'),
(3, 2, 2, 1, 70.00, 550000.00, 'https://exemplo.com/anuncio4'),
(4, 3, 3, 2, 90.00, 750000.00, 'https://exemplo.com/anuncio5');

-- Consultando os dados inseridos
SELECT * FROM Empreendimentos;
SELECT * FROM Tipologias;
SELECT * FROM Unidades;
