CREATE DATABASE fazendabd;
USE fazendabd;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'produtos';

CREATE TABLE funcionarios (
  id INT NOT NULL IDENTITY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  cpf VARCHAR(11) NOT NULL,
  salario INT
);

CREATE TABLE producao_de_leite (
  id INT NOT NULL IDENTITY,
  especie VARCHAR(20) NOT NULL,
  última_ordenha DATETIME NOT NULL,
  temperatura_leite FLOAT NOT NULL,
  produtividade_quarto INT,
  inseminacoes INT,
  estimativa_parto CHAR(3) CHECK(estimativa_parto IN('Sim', 'Não')) NOT NULL DEFAULT 'Não',
  secagem_esperada VARCHAR(12) CHECK(secagem_esperada IN('Positivo', 'Negativo')) NOT NULL,
  min_ruminacao_dia INT NOT NULL DEFAULT '00 min'
);

CREATE TABLE produtos (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  qtd_kg_L INT NOT NULL,
  estoque CHAR(3) CHECK(estoque IN('Sim', 'Não')) NOT NULL DEFAULT 'Sim',
  preço FLOAT NOT NULL
);

CREATE TABLE equipamento (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  qtd INT NOT NULL,
  estoque CHAR(3) CHECK(estoque IN('Sim', 'Não')) NOT NULL DEFAULT 'Sim',
  preço FLOAT NOT NULL
);

CREATE TABLE varejistas (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  cnpj VARCHAR(18) NOT NULL
);


SELECT * FROM funcionarios;

INSERT INTO funcionarios
VALUES
('Ademar', 66804160440, 2800),
('Alcir', 08316387628, 2800),
('Amilton', 80207304210, 2800),
('Aleson', 45140921647, 2500),
('Jamilton', 62536189261, 2500),
('Alexsandro', 53479129286, 1500),
('Anderson', 18842939421, 1800),
('Davi', 15011124907, 2800),
('Ronaldo', 90421834132, 3300),
('Manoel', 36405794206, 4800),
('Marcio', 68616333444, 4800),
('Messias', 69836142987, 3300),
('Renato', 25682977066, 2500),
('Leandra', 84151465048, 2500),
('Elza', 80573545719, 3300),
('Cafu', 24575005296, 1800),
('Sr. Zoi', 09686145621, 3300),
('Leonardo', 03191687510, 1800),
('Marli', 23432076420, 2900),
('Thiago', 70903590307, 2900);


SELECT * FROM producao_de_leite;

INSERT INTO producao_de_leite
VALUES
('Holandesa', '2020/10/28', 37, 25, 1, 'Sim', 'Positivo', 403),
('Jersey', '2020/10/26', 38, 26, 1, 'Sim', 'Positivo', 409),
('Pardo Suiço', '2020/10/24', 37, 25, 1, 'Sim', 'Positivo', 421);

SELECT * FROM produtos;

INSERT INTO produtos (nome, tipo, qtd_kg_L, preço)
VALUES
('Leite', 'Laticínio', 2300, 1.585),
('Queijo', 'Laticínio', 600, 70),
('Abacaxi', 'Fruta', 500, 1.50),
('Melância', 'Fruta', 200, 6),
('Abacate', 'Fruta', 300, 1.585),
('Banana', 'Fruta', 100, 3),
('Mamão', 'Fruta', 150, 1.585),
('Acerola', 'Fruta', 5000, 90),
('Laranja', 'Fruta', 2500, 16),
('Manga', 'Fruta', 2500, 4),
('Coco', 'Fruta', 400, 2),
('Fruta Pão', 'Fruta', 200, 7),
('Peixe', 'Carne', 100, 20),
('Pele de Peixe', 'Artesanato', 100, 5),
('Café', 'Grãos', 2300, 540),
('Soja', 'Grãos', 20000, 92.35),
('Milheto', 'Grãos', 5000, 36),
('Carne Bovina', 'Carne', 500, 20),
('Ovos', 'Granja', 6000, 7),
('Shitake', 'Iguaria', 300, 170),
('Carneiro', 'Caprino', 300, 35),
('Cordeiro', 'Caprino', 300, 40),
('Mel', 'Iguaria', 200, 25),
('Alface', 'Verdura', 100, 0.50),
('Rúcula', 'Verdura', 100, 0.50),
('Acelga', 'Verdura', 100, 0.50),
('Mostarda', 'Verdura', 100, 0.50),
('Repolho', 'Verdura', 100, 0.50),
('Cebolinha', 'Verdura', 100, 0.50),
('Coentro', 'Verdura', 100, 0.50),
('Couve', 'Verdura', 100, 0.50),
('Almeirão', 'Verdura', 100, 0.50),
('Alface', 'Verdura', 100, 0.50),
('Abobrinha Verde', 'Legume', 60, 10),
('Alho', 'Legume', 60, 80),
('Batata Inglesa', 'Legume', 60, 40),
('Batata Baroa', 'Legume', 60, 35),
('Batata Doce', 'Legume', 60, 30),
('Berinjela', 'Legume', 60, 30),
('Beterraba', 'Legume', 60, 28),
('Cebola', 'Legume', 60, 40),
('Cenoura', 'Legume', 60, 40),
('Couve-flor', 'Legume', 60, 22),
('Pepino', 'Legume', 60, 35);


SELECT * FROM equipamento;

INSERT INTO equipamento (nome, tipo, qtd, preço)
VALUES
('Pá', 'Ferramenta', 10, 19.90),
('Enxada', 'Ferramenta', 10, 23.90),
('Picareta', 'Ferramenta', 10, 25.90),
('Ciscador', 'Ferramenta', 10, 16.90),
('Uniforme', 'Vestuário', 10, 39.90),
('Botas de Borracha', 'Vestuário', 4, 22.90),
('Botas de Couro', 'Vestuário', 6, 32.90),
('Colheitadeira', 'Maquinário', 1, 270000),
('4x4 da Fazenda', 'Veículo', 3, 139000),
('Carroça', 'Veículo', 3, 600);


SELECT * FROM varejistas;

INSERT INTO varejistas
VALUES
('Mercearia Bartolomeu', 31850912000186),
('Mercearia do China', 08055774000121),
('Hortifruti do Gaspar', 00519158000172),
('Sacolão do Zé', 21394647000115),
('Mercadinho da Esquina', 65299774000100);