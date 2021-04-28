CREATE DATABASE EcoFacilDB; 

USE EcoFacilDB;

CREATE TABLE Tipos_Usuarios
(
	ID_Tipo_Usuario INT NOT NULL PRIMARY KEY,
	Nome_Tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios
(
	ID_Usuario INT NOT NULL PRIMARY KEY,
	Nome_Usuario VARCHAR(100) NOT NULL,
    Email_Usuario VARCHAR(200) NOT NULL,
    Senha_Usuario VARCHAR(15) NOT NULL,
	ID_Tipo_Usuario INT NOT NULL,
	FOREIGN KEY (ID_Tipo_Usuario) REFERENCES Tipos_Usuarios(ID_Tipo_Usuario)
);

CREATE TABLE Telefones_Usuarios
(
	ID_Telefone_Usuario INT NOT NULL PRIMARY KEY,
	Numero_Telefone VARCHAR(15) NOT NULL,
	ID_Usuario INT NOT NULL,
	FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Enderecos_Usuarios
(
	ID_Endereco_Usuario INT NOT NULL PRIMARY KEY,
	Logradouro VARCHAR(200) NOT NULL,
	Numero VARCHAR(15) NOT NULL,
	Complemento VARCHAR(100),
    Cidade VARCHAR(100) NOT NULL,
    UF VARCHAR(2) NOT NULL,
	ID_Usuario INT NOT NULL,
	FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Empresas_Gerenciamento_Residuos
(
	ID_Empresa_Gerenciamento_Residuos INT NOT NULL PRIMARY KEY,
	Nome_Empresa_Gerenciamento_Residuos VARCHAR(100) NOT NULL,
    Email_Empresa_Gerenciamento_Residuos VARCHAR(200) NOT NULL,
    Senha_Empresa_Gerenciamento_Residuos VARCHAR(15) NOT NULL,
	ID_Tipo_Usuario INT NOT NULL,
	FOREIGN KEY (ID_Tipo_Usuario) REFERENCES Tipos_Usuarios(ID_Tipo_Usuario)
);

CREATE TABLE Telefones_Empresas_Gerenciamento_Residuos
(
	ID_Telefone_Empresa_Gerenciamento_Residuos INT NOT NULL PRIMARY KEY,
	Numero_Telefone VARCHAR(15) NOT NULL,
	ID_Empresa_Gerenciamento_Residuos INT NOT NULL,
	FOREIGN KEY (ID_Empresa_Gerenciamento_Residuos) REFERENCES Empresas_Gerenciamento_Residuos(ID_Empresa_Gerenciamento_Residuos)
);

CREATE TABLE Enderecos_Empresas_Gerenciamento_Residuos
(
	ID_Endereco_Empresa_Gerenciamento_Residuos INT NOT NULL PRIMARY KEY,
	Logradouro VARCHAR(200) NOT NULL,
	Numero VARCHAR(15) NOT NULL,
	Complemento VARCHAR(100),
	Cidade VARCHAR(100) NOT NULL,
    UF VARCHAR(2) NOT NULL,
	ID_Empresa_Gerenciamento_Residuos INT NOT NULL,
	FOREIGN KEY (ID_Empresa_Gerenciamento_Residuos) REFERENCES Empresas_Gerenciamento_Residuos(ID_Empresa_Gerenciamento_Residuos)
);

CREATE TABLE Tipos_Residuos
(
	ID_Tipo_Residuo INT NOT NULL PRIMARY KEY,
	Nome_Tipo_Residuo DECIMAL NOT NULL,
	Perigoso BOOLEAN NOT NULL
);

CREATE TABLE Orcamentos_Solicitados
(
	ID_Orcamento INT NOT NULL PRIMARY KEY,
	Quantidade_Residuos DECIMAL NOT NULL,
    Data_Solicitacao DATETIME  NOT NULL,
    ID_Empresa_Gerenciamento_Residuos INT NOT NULL,
	ID_Tipo_Residuo INT NOT NULL,
	ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Empresa_Gerenciamento_Residuos) REFERENCES Empresas_Gerenciamento_Residuos(ID_Empresa_Gerenciamento_Residuos),
    FOREIGN KEY (ID_Tipo_Residuo) REFERENCES Tipos_Residuos(ID_Tipo_Residuo),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Servicos_Oferecidos_Empresas_Gerenciamento_Residuos
(
	ID_Servico_Oferecido_Empresa_Gerenciamento_Residuos INT NOT NULL PRIMARY KEY,
	Nome_Servico VARCHAR(200) NOT NULL,
	Faz_Coleta BOOLEAN  NOT NULL,
	ID_Empresa_Gerenciamento_Residuos INT NOT NULL,
	FOREIGN KEY (ID_Empresa_Gerenciamento_Residuos) REFERENCES Empresas_Gerenciamento_Residuos(ID_Empresa_Gerenciamento_Residuos)
);

CREATE TABLE Pontos_Coletas
(
	ID_Ponto_Coleta INT NOT NULL PRIMARY KEY,
	ID_Tipo_Residuo INT NOT NULL
);

CREATE TABLE Enderecos_Pontos_Coletas
(
	ID_Endereco_Ponto_Coleta INT NOT NULL PRIMARY KEY,
	Logradouro VARCHAR(200) NOT NULL,
	Numero VARCHAR(15) NOT NULL,
	Complemento VARCHAR(100),
	Cidade VARCHAR(100) NOT NULL,
    UF VARCHAR(2) NOT NULL,
	ID_Ponto_Coleta INT NOT NULL,
	FOREIGN KEY (ID_Ponto_Coleta) REFERENCES Pontos_Coletas(ID_Ponto_Coleta)
);

CREATE TABLE Coordenadas_Pontos_Coletas
(
	ID_Coordenada_Ponto_Coleta INT NOT NULL PRIMARY KEY,
	Latitude VARCHAR(200) NOT NULL,
	Longitude VARCHAR(15) NOT NULL,
	ID_Ponto_Coleta INT NOT NULL,
	FOREIGN KEY (ID_Ponto_Coleta) REFERENCES Pontos_Coletas(ID_Ponto_Coleta)
);