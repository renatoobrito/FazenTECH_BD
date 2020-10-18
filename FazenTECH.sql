CREATE DATABASE fazendabd;
USE fazendabd;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

CREATE TABLE funcionarios (
  id INT NOT NULL IDENTITY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  cpf VARCHAR(11) NOT NULL,
  salario INT
);

CREATE TABLE producao_de_leite (
  id INT NOT NULL IDENTITY,
  especie VARCHAR(20) NOT NULL,
  última_ordenha DATE NOT NULL,
  temperatura_leite CHAR(4) NOT NULL,
  produtividade_quarto CHAR(5),
  inseminacoes CHAR(2),
  estimativa_parto CHAR(3) CHECK(estimativa_parto IN('Sim', 'Não')) NOT NULL DEFAULT 'Não',
  secagem_esperada VARCHAR(12) CHECK(secagem_esperada IN('Positivo', 'Negativo')) NOT NULL,
  min_ruminacao_dia INT NOT NULL DEFAULT '00 min'
);

CREATE TABLE produtos (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  qtd INT NOT NULL,
  estoque CHAR(3) CHECK(estoque IN('Sim', 'Não')) NOT NULL DEFAULT 'Sim',
  preço INT NOT NULL
);

CREATE TABLE equipamento (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  qtd INT NOT NULL,
  estoque CHAR(3) CHECK(estoque IN('Sim', 'Não')) NOT NULL DEFAULT 'Sim',
  preço INT NOT NULL
);

SELECT * FROM funcionarios;
SELECT * FROM producao_de_leite;
SELECT * FROM produtos;
SELECT * FROM equipamento;