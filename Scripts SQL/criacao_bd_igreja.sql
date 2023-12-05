CREATE DATABASE GerenciamentoIgreja

USE GerenciamentoIgreja

CREATE TABLE Pessoas (
	IdPessoa INT IDENTITY(1,1),
	Nome VARCHAR(80),
	Rua VARCHAR(120),
	Bairro VARCHAR(50),
	Cidade VARCHAR(80),
	Estado VARCHAR(2),
	Pais VARCHAR(50),
	DataNasc DATE,
	Sexo CHAR,
	EstadoCivil VARCHAR(50),
	Telefone1 VARCHAR(11),
	Telefone2 VARCHAR(11),
	Telefone3 VARCHAR(11),
	PRIMARY KEY (IdPessoa)
)

CREATE TABLE Departamentos (
	IdDepartamento INT IDENTITY(1,1),
	Nome VARCHAR(80),
	PRIMARY KEY (IdDepartamento)
)

CREATE TABLE PessoasDepartamentos (
	IdPessoa INT,
	IdDepartamento INT,
	Funcao VARCHAR(80),
	FOREIGN KEY (IdPessoa) REFERENCES Pessoas(IdPessoa),
	FOREIGN KEY (IdDepartamento) REFERENCES Departamentos(IdDepartamento)
)

CREATE TABLE Celulas (
	IdCelula INT IDENTITY(1,1),
	Nome VARCHAR(80),
	DiaDaSemana VARCHAR(30),
	Rua VARCHAR(120),
	Bairro VARCHAR(50),
	Cidade VARCHAR(80),
	Estado VARCHAR(2),
	Pais VARCHAR(50),
	PRIMARY KEY (IdCelula)
)

CREATE TABLE PessoasCelulas (
	IdPessoa INT,
	IdCelula INT,
	Funcao VARCHAR(80),
	FOREIGN KEY (IdPessoa) REFERENCES Pessoas(IdPessoa),
	FOREIGN KEY (IdCelula) REFERENCES Celulas(IdCelula)
)

INSERT INTO Departamentos (Nome) VALUES 
('300 - Rede de Homens'),
('Rede de Mulheres'),
('Rede de Jovens Revival'),
('Rede Kids')