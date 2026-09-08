CREATE DATABASE db_automotiva;

USE db_automotiva;

CREATE TABLE tbl_tipo_cliente (
            status_cliente VARCHAR(20),
            percentagem_desconto FLOAT,
            PRIMARY KEY (status_cliente)
);

INSERT INTO tbl_tipo_cliente (status_cliente, percentagem_desconto) VALUES            
            ('Comum', 0.0),            
            ('Especial', 10.0);

CREATE TABLE tbl_fornecedor (
            id_fornecedor INT,
            razao_social VARCHAR(100),
            cnpj VARCHAR(20),
            email VARCHAR(100),
            PRIMARY KEY (id_fornecedor)
);

INSERT INTO tbl_fornecedor (id_fornecedor, razao_social, cnpj, email) VALUES            
            (501, 'AutoParts SP Distribuidora', '11.111.111/0001-11', 'contato@autopartssp.com.br'),            
            (502, 'Freios & Cia Ltda', '22.222.222/0001-22', 'vendas@freiosecia.com.br'),            
            (503, 'Lubrificantes BR', '33.333.333/0001-33', 'pedidos@lubribr.com.br'),
            (504, 'Baterias Moura Vendas', '44.444.444/0001-44', 'vendas@moura.com.br'),
            (505, 'Pneus Leste', '55.555.555/0001-55', 'contato@pneusleste.com.br');

CREATE TABLE tbl_peca (
            id_peca INT,
            descricao VARCHAR(100),
            categoria VARCHAR(100),
            marca VARCHAR(100),
            preco_venda FLOAT,
            estoque INT,
            PRIMARY KEY (id_peca)
);

INSERT INTO tbl_peca (id_peca, descricao, categoria, marca, preco_venda, estoque) VALUES            
            (1, 'Pastilha de Freio Dianteira', 'Freios', 'Bendix', 120.50, 50),            
            (2, 'Filtro de Óleo', 'Filtros', 'Fram', 45.00, 150),            
            (3, 'Amortecedor Traseiro', 'Suspensão', 'Monroe', 280.00, 30),            
            (4, 'Óleo de Motor', 'Lubrificantes', 'Castrol', 65.00, 200),
            (5, 'Bateria 60Ah', 'Elétrica', 'Moura', 450.00, 20);

CREATE TABLE tbl_cliente (
            id_cliente INT,
            nome VARCHAR(100),
            status_cliente VARCHAR(20),
            PRIMARY KEY (id_cliente),
            FOREIGN KEY (status_cliente) REFERENCES tbl_tipo_cliente (status_cliente)
);

INSERT INTO tbl_cliente (id_cliente, nome, status_cliente) VALUES            
            (101, 'Carlos', 'Comum'),            
            (102, 'Mariana', 'Especial'),            
            (103, 'Miguel', 'Especial'),
            (104, 'Juliana', 'Comum'),
            (105, 'Roberto', 'Comum');

CREATE TABLE tbl_fornecimento_peca (
            id_fornecedor INT,
            id_peca INT,
            preco_compra FLOAT,
            prazo_entrega_dias INT,
            PRIMARY KEY (id_fornecedor, id_peca),
            FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedor (id_fornecedor),
            FOREIGN KEY (id_peca) REFERENCES tbl_peca (id_peca)
);

INSERT INTO tbl_fornecimento_peca (id_fornecedor, id_peca, preco_compra, prazo_entrega_dias) VALUES            
            (502, 1, 70.00, 3),            
            (501, 2, 20.00, 2),            
            (501, 3, 160.00, 5),            
            (503, 4, 35.00, 2),
            (504, 5, 250.00, 1);

CREATE TABLE tbl_telefone (
            id_telefone INT,
            numero VARCHAR(20),
            id_cliente INT,
            PRIMARY KEY (id_telefone),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_telefone (id_telefone, numero, id_cliente) VALUES            
            (10, '(11) 98888-1111', 101),            
            (20, '(11) 97777-2222', 102),            
            (30, '(11) 96666-3333', 103),            
            (40, '(11) 2555-4444', 105),
            (50, '(11) 95555-5555', 104);

CREATE TABLE tbl_endereco (
            id_endereco INT,
            rua VARCHAR(100),
            bairro VARCHAR(100),
            cep VARCHAR(20),
            cidade VARCHAR(100),
            id_cliente INT,
            PRIMARY KEY (id_endereco),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_endereco (id_endereco, rua, bairro, cep, cidade, id_cliente) VALUES            
            (301, 'Avenida dos Metalúrgicos, 1500', 'Cidade Tiradentes', '08471-000', 'São Paulo', 101),            
            (302, 'Rua Inácio Monteiro, 320', 'Cidade Tiradentes', '08490-000', 'São Paulo', 102),            
            (303, 'Rua Naylor de Oliveira, 85', 'Cidade Tiradentes', '08470-130', 'São Paulo', 103),
            (304, 'Rua Sara Kubitschek, 120', 'Cidade Tiradentes', '08474-000', 'São Paulo', 104),
            (305, 'Estrada Iguatemi, 2500', 'Cidade Tiradentes', '08485-310', 'São Paulo', 105);

CREATE TABLE tbl_pedido (
            id_pedido INT,
            data DATE,
            valor_total FLOAT,
            status_pedido VARCHAR(50),
            id_cliente INT,
            PRIMARY KEY (id_pedido),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_pedido (id_pedido, data, valor_total, status_pedido, id_cliente) VALUES            
            (111, '2026/10/10', 165.50, 'Concluído', 101),            
            (222, '2026/10/12', 252.00, 'Em Andamento', 102),            
            (333, '2026/10/15', 468.00, 'Aguardando Pagamento', 103),
            (444, '2026/10/18', 450.00, 'Concluído', 104),
            (555, '2026/10/20', 120.50, 'Em Andamento', 105);

CREATE TABLE tbl_item_pedido (
            id_pedido INT,
            id_peca INT,
            qtd INT,
            preco_unitario FLOAT,
            sub_total FLOAT,
            PRIMARY KEY (id_pedido, id_peca),
            FOREIGN KEY (id_pedido) REFERENCES tbl_pedido (id_pedido),
            FOREIGN KEY (id_peca) REFERENCES tbl_peca (id_peca)
);

INSERT INTO tbl_item_pedido (id_pedido, id_peca, qtd, preco_unitario, sub_total) VALUES                        
            (111, 1, 1, 120.50, 120.50),                        
            (111, 2, 1, 45.00, 45.00),                        
            (222, 3, 1, 280.00, 280.00),                        
            (333, 4, 8, 65.00, 520.00),            
            (444, 5, 1, 450.00, 450.00),
            (555, 1, 1, 120.50, 120.50);



