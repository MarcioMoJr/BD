CREATE DATABASE db_firma;

USE db_firma;

CREATE TABLE tbl_produto (
		id INT,
		nome VARCHAR(100),
		categoria VARCHAR(100),
		preco VARCHAR(100),
		PRIMARY KEY (id)
);

INSERT INTO tbl_produto (id,nome,categoria,preco) VALUES 
		(1, 'SABAO', 'PO', '5.00') ,
		(2, 'DETERGENTE', 'LIQUIDO', '6.70') ,
		(3, 'CLORO', 'LIQUIDO', '22.00');

		SELECT * FROM tbl_produto;
  
CREATE TABLE tbl_cliente (
		cod_cliente INT,
		status_cliente VARCHAR(30),
		nome_cliente VARCHAR(100),
		limite_credito VARCHAR(30),
		PRIMARY KEY (cod_cliente)
);

INSERT INTO tbl_cliente (cod_cliente, status_cliente, nome_cliente, limite_credito) VALUES
		(101, 'BOM', 'FELIPE', '500'),
		(102, 'RUIM', 'LUCAS', '50'),
 		(103, 'MEDIO', 'ALEX', '240');

		SELECT * FROM tbl_cliente;

CREATE TABLE tbl_pedido (
		numero INT,
		data_elaboracao DATE,
		quantidade INT,
		id_produto INT,
		cod_cliente INT,
		PRIMARY KEY (numero),
		FOREIGN KEY (id_produto) REFERENCES tbl_produto (id),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_pedido (numero, id_produto, cod_cliente, quantidade, data_elaboracao) VALUES
		(24, 1, 103, 10, '2026/07/22'),
		(26, 3, 102, 50, '2026/07/19'),
		(8, 2, 101, 23, '2026/07/ 28');

		SELECT * FROM tbl_pedido;

CREATE TABLE tbl_endereco (
		id_endereco INT,
		rua VARCHAR (100),
		bairro VARCHAR (100),
		cidade VARCHAR (100),
		cep VARCHAR (100),
		logradouro VARCHAR (100),
		cod_cliente INT,
		PRIMARY KEY (id_endereco),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_endereco (id_endereco, cod_cliente, rua, bairro, cidade, cep, logradouro) VALUES
		(501, 101, 'Rua dos Têxteis, 100', 'Cidade Tiradentes', 'São Paulo', '08470-000', 'Rua'),
		(502, 103, 'Avenida Metalúrgicos, 550', 'Cidade Tiradentes', 'São Paulo', '08471-000', 'Avenida'),
		(503, 102, 'Rua Sara Kubitschek, 45', 'Cidade Tiradentes', 'São Paulo', '08474-000', 'Rua');

		SELECT * FROM tbl_endereco;

CREATE TABLE tbl_telefone (
		id_telefone INT ,
		cod_cliente INT,
		numero VARCHAR(20),
		tipo VARCHAR(20),
		PRIMARY KEY (id_telefone),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_telefone (id_telefone, cod_cliente, numero, tipo) VALUES
		(10, 101, '(11) 98765-4321', 'Celular'),
		(20, 103, '(11) 91234-5678', 'Celular'),
		(30, 102, '(11) 2345-6789', 'Residencial');

