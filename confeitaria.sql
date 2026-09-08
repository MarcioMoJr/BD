CREATE DATABASE db_confeitaria;

USE db_confeitaria;

CREATE TABLE tbl_cliente (
			id_cliente INT,
			nome VARCHAR (100),
			PRIMARY KEY (id_cliente)
);

INSERT INTO tbl_cliente (id_cliente, nome) VALUES
			(1, 'João'),
			(2, 'Leornardo'),
			(3, 'Nicollas'),
			(4, 'Bruno'),
			(5, 'David');

CREATE TABLE tbl_produto (
			id_produto INT,
			valor_kg FLOAT,
			descricao VARCHAR (200)
			PRIMARY KEY (id_produto)
);

INSERT INTO tbl_produto (id_produto, descricao, valor_kg) VALUES
			(101, 'Bolo de Chocolate', 45.90),
			(102, 'Torta de Morango', 52.50),
			(103, 'Bolo de Cenoura com Chocolate', 38.00),
			(104, 'Torta de Limão', 48.75),
			(105, 'Bolo Red Velvet', 65.00);

CREATE TABLE tbl_pedido (
			id_pedido INT,
			data DATE,
			valor_total FLOAT,
			id_cliente INT,
			PRIMARY KEY (id_pedido),
			FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_pedido (id_pedido, data, valor_total, id_cliente) VALUES
			(10, '2026-08-10', 91.80, 1),
			(20, '2026-08-11', 52.50, 2),
			(30, '2026-08-12', 114.00, 3),
			(40, '2026-08-13', 48.75, 4),
			(50, '2026-08-14', 130.00, 5);

CREATE TABLE tbl_telefone_cliente (
			id_cliente INT,
			telefone VARCHAR (20),
			PRIMARY KEY (id_cliente, telefone),
			FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
		);

INSERT INTO tbl_telefone_cliente (id_cliente, telefone) VALUES
			(1, '(11) 98765-4321'),
			(2, '(11) 3456-7890'),
			(3, '(11) 91234-5678'),
			(4, '(11) 92345-6789'),
			(5, '(11) 2345-6789');

CREATE TABLE tbl_item_pedido (
			id_pedido INT,
			id_produto INT,
			quantidade INT,
			PRIMARY KEY (id_pedido, id_produto),
			FOREIGN KEY (id_pedido) REFERENCES tbl_pedido (id_pedido),
			FOREIGN KEY (id_produto) REFERENCES tbl_produto (id_produto)
);

INSERT INTO tbl_item_pedido (id_pedido, id_produto, quantidade) VALUES
			(10, 101, 2),
			(20, 103, 1),
			(30, 102, 3),
			(40, 104, 1),
			(50, 105, 2);

		 