CREATE DATABASE db_concessionaria;
USE db_concessionaria;

CREATE TABLE tbl_carros (
	placa VARCHAR (10),
	marca VARCHAR (30),
	modelo VARCHAR (30),
	ano INT,
	combustivel VARCHAR (1),
	PRIMARY KEY (placa)
);

INSERT INTO tbl_carros (placa, marca, modelo, ano, combustivel) VALUES
	('ABC1234', 'Ford', 'Corcel II', 1982, 'G'),
	('JKG5678', 'Ford', 'Focus', 2001, 'A'),
	('LKO8954', 'Renault', 'Clio', 2007, 'F'),
	('MMS1609', 'VolksWagen', 'Fusca', 1973, 'G'),
	('ASD123', 'Honda', 'Civic', 2010, 'F'),
	('gtr4596', 'GM', 'Corsa', 2004, 'A');

CREATE TABLE tbl_vendedores (
	codigo INT,
	nome VARCHAR (30),
	carro VARCHAR (10),
	cidade VARCHAR (30),
	estado VARCHAR (10),
	comissao DECIMAL(4, 2),
	PRIMARY KEY (codigo),
	FOREIGN KEY (carro) REFERENCES tbl_carros (placa)
);

INSERT INTO tbl_vendedores (codigo, nome, carro, cidade, estado, comissao) VALUES
	(1,'Juca da Silva','ABC1234','Pelotas','RS',3.50),
	(3,'Antonio Vieira','JKG5678','Dois Vizinhos','PR',5.00),
	(44,'Julieta da Silva',NULL,'Verê','PR',2.50),
	(6,'Maria Francisca','LKO8954','Dois Vizinhos','PR',2.00),
	(45,'Marieta da Silva',NULL,'Verê','PR',2.80),
	(9,'juca silva',NULL,'PELOTAS','RS',3.50),
	(18,'Maria Guedes','MMS1609','Brasília','DF',5.40),
	(20,'Jian de Barros','ASD123','Curitiba','PR',3.40),
	(28,'Fagundes de azevedo',NULL,'Verê','PR',2.80),
	(40,'Ari Ribas','gtr4596','Erechim','RS',3.50);

INSERT INTO tbl_carros (placa, marca, modelo, ano, combustivel) VALUES
	('HIJ4050', 'Fiat', 'Uno',2000, 'F'),
	('WYZ6070', 'GM', 'Celta',2005, 'G'),
	('MNO1020', 'BMW', '320i', 2015, 'G'),
	('TUV8090', 'Volkswagen', 'Gol',2010, 'F');

SELECT * FROM tbl_carros;

UPDATE tbl_carros SET modelo = 'Uno Mille', ano = 2001 WHERE placa = 'HIJ4050';
UPDATE tbl_carros SET combustivel = 'A' WHERE placa = 'WYZ6070';

UPDATE tbl_vendedores SET carro = 'HIJ4050' WHERE codigo = 44;
UPDATE tbl_vendedores SET carro = 'WYZ6070' WHERE codigo = 45;
UPDATE tbl_vendedores SET carro = 'MNO1020' WHERE codigo = 28;
UPDATE tbl_vendedores SET carro = 'TUV8090' WHERE codigo = 9;

SELECT * FROM tbl_vendedores;


