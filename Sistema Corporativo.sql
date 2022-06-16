Drop Schema projetointegrador;
CREATE SCHEMA projetointegrador;
use projetointegrador;
drop table produto;
CREATE TABLE IF NOT EXISTS produto (
idProduto int (50) not null auto_increment,
nome varchar (100) not null,
descricao varchar (50) not null,
quantidade int (50) not null,
categoria varchar (50) not null,
marca varchar (50) not null,
valor double not null,
PRIMARY KEY(idProduto));

drop table controle_entrada;
CREATE TABLE IF NOT EXISTS controle_entrada (
idEntrada smallint not null auto_increment,
quantidadeEntrada int(45) not null,
dataEntrada date,
valorProduto double not null,
nomeProdutoEntrada varchar(50) not null,
IdProduto int (50) not null,
Idfornecedor smallint not null,
PRIMARY KEY(idEntrada),
CONSTRAINT fk_controle_entrada_produto FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
CONSTRAINT fk_controle_entrada_fornecedor FOREIGN KEY (Idfornecedor) REFERENCES fornecedor(idFornecedor));

drop table controle_saida;
CREATE TABLE IF NOT EXISTS controle_saida(
idSaida smallint not null auto_increment,
quantidadeSaida int(50) UNSIGNED,
dataSaida date,
estoque int (50) not null,
idProduto int (50),
valor double not null,
PRIMARY KEY(idSaida),
CONSTRAINT fk_controle_saida_produto FOREIGN KEY (idProduto) REFERENCES produto(idProduto));

drop table fornecedor;
CREATE TABLE IF NOT EXISTS fornecedor(
idFornecedor smallint not null auto_increment,
cnpj int (50) not null UNIQUE,
produto varchar (50) not null,
nome varchar(50) not null,
telefone varchar (20),
email varchar (50),
endereco varchar (100) not null,
PRIMARY KEY(idFornecedor))
ENGINE = InnoDB;

Create table if not exists logins(
id int not null auto_increment,
nome varchar(100) not null,
login varchar(200) not null,
senha varchar(100) not null,
PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS funcionario(
id int (100) not null auto_increment,
nome varchar (100) not null,
cpf varchar (50) not null,
email varchar (50) not null,
endereco varchar(50) not null,
telefone varchar(50) not null,
sexo varchar(50) not null,
PRIMARY KEY (id))
ENGINE = InnoDB;

Create table if not exists funcionariolog(
id int not null auto_increment,
nome varchar(100) not null,
login varchar(200) not null,
senha varchar(100) not null,
PRIMARY KEY (id))
ENGINE = InnoDB;





