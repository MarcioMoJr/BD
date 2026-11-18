CREATE DATABASE db_livraria;

USE db_livraria;

CREATE TABLE tbl_editora (
	id_editora INT,
	nome_empresa VARCHAR (100) NOT NULL,
	telefone_contato VARCHAR (20),
	email_corporativo VARCHAR (100),
	PRIMARY KEY (id_editora)
);

CREATE TABLE tbl_livro (
	isbn CHAR (13),
	titulo VARCHAR (150) NOT NULL,
	preco_venda_atual DECIMAL (10, 2) NOT NULL,
	qtd_estoque INT NOT NULL CHECK (qtd_estoque >= 0),
	ano_publicacao INT,
	id_editora INT NOT NULL,
	PRIMARY KEY (isbn),
	FOREIGN KEY (id_editora) REFERENCES tbl_editora (id_editora)
);

CREATE TABLE tbl_autor (
	id_autor INT,
	nome_completo VARCHAR (100) NOT NULL,
	nacionalidade VARCHAR (50),
	data_nascimento DATE,
	PRIMARY KEY (id_autor)
);

CREATE TABLE tbl_livro_autor (
	isbn CHAR (13),
	id_autor INT,
	PRIMARY KEY (isbn, id_autor),
	FOREIGN KEY (isbn) REFERENCES tbl_livro (isbn),
	FOREIGN KEY (id_autor) REFERENCES tbl_autor (id_autor)
);

CREATE TABLE tbl_cliente (
	id_cliente INT,
	nome_completo VARCHAR (100) NOT NULL,
	email VARCHAR (100) NOT NULL UNIQUE,
	cpf CHAR (11) NOT NULL,
	data_cadastro DATE NOT NULL,
	PRIMARY KEY (id_cliente)
);

CREATE TABLE tbl_pedido (
	id_pedido INT,
	data_hora DATETIME NOT NULL,
	valor_total DECIMAL (10, 2) NOT NULL,
	id_cliente INT NOT NULL,
	PRIMARY KEY (id_pedido),
	FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

CREATE TABLE tbl_item_pedido (
	id_item_pedido INT,
	quantidade INT NOT NULL CHECK (quantidade > 0),
	preco_unitario_venda DECIMAL (10, 2) NOT NULL,
	id_pedido INT NOT NULL,
	isbn CHAR (13) NOT NULL,
	PRIMARY KEY (id_item_pedido),
	FOREIGN KEY (id_pedido) REFERENCES tbl_pedido (id_pedido),
	FOREIGN KEY (isbn) REFERENCES tbl_livro (isbn)
);

INSERT INTO tbl_editora (id_editora, nome_empresa, telefone_contato, email_corporativo) VALUES
	(1, 'Companhia das Letras', '(11) 3000-0001', 'contato@companhiadasletras.com.br'),
	(2, 'Rocco', '(11) 3000-0002', 'contato@rocco.com.br'),
	(3, 'Record', '(11) 3000-0003', 'contato@record.com.br'),
	(4, 'Nova Fronteira', '(11) 3000-0004', 'contato@novafronteira.com.br'),
	(5, 'José Olympio', '(11) 3000-0005', 'contato@joseolympio.com.br'),
	(6, 'L&PM Editores', '(11) 3000-0006', 'contato@lpm.com.br'),
	(7, 'Pearson', '(11) 3000-0007', 'contato@pearson.com.br'),
	(8, 'Bookman', '(11) 3000-0008', 'contato@bookman.com.br'),
	(9, 'Alta Books', '(11) 3000-0009', 'contato@altabooks.com.br'),
	(10, 'GEN | LTC', '(11) 3000-0010', 'contato@genltc.com.br');

INSERT INTO tbl_livro (isbn, titulo, preco_venda_atual, qtd_estoque, ano_publicacao, id_editora) VALUES
	('9788500000010', 'Dom Casmurro', 39.90, 25, 1899, 1),
	('9788500000027', 'Grande Sertão: Veredas', 89.90, 12, 1956, 4),
	('9788500000034', 'Vidas Secas', 44.90, 30, 1938, 3),
	('9788500000041', 'Capitães da Areia', 49.90, 22, 1937, 1),
	('9788500000058', 'A Hora da Estrela', 42.90, 18, 1977, 2),
	('9788500000065', 'Laços de Família', 46.90, 15, 1960, 2),
	('9788500000072', 'Macunaíma', 45.90, 10, 1928, 4),
	('9788500000089', 'O Auto da Compadecida', 38.90, 20, 1955, 5),
	('9788500000096', 'O Alquimista', 34.90, 40, 1988, 2),
	('9788500000102', 'O Pequeno Príncipe', 29.90, 50, 1943, 4),
	('9788500000119', '1984', 54.90, 28, 1949, 1),
	('9788500000126', 'Harry Potter e a Pedra Filosofal', 59.90, 35, 1997, 2),
	('9788500000133', 'Sapiens: Uma Breve História da Humanidade', 69.90, 26, 2011, 6),
	('9788500000140', 'Código Limpo', 89.90, 14, 2008, 9),
	('9788500000157', 'O Hobbit', 64.90, 19, 1937, 2),
	('9788500000164', 'Orgulho e Preconceito', 36.90, 17, 1813, 6),
	('9788500000171', 'Sistemas de Banco de Dados', 219.00, 8, 1989, 7),
	('9788500000188', 'Sistema de Banco de Dados', 239.00, 6, 1986, 10),
	('9788500000195', 'Algoritmos: Teoria e Prática', 299.00, 7, 1990, 10),
	('9788500000201', 'Inteligência Artificial', 279.00, 9, 1995, 10),
	('9788500000218', 'Redes de Computadores', 189.00, 11, 1981, 7),
	('9788500000225', 'Java: Como Programar', 229.00, 13, 1996, 7),
	('9788500000232', 'Padrões de Projeto', 129.00, 10, 1994, 8),
	('9788500000249', 'Introdução à Teoria de Autômatos, Linguagens e Computação', 199.00, 5, 1979, 10),
	('9788500000256', 'Freakonomics', 49.90, 16, 2005, 3),
	('9788500000263', 'Belas Maldições', 54.90, 12, 1990, 3),
	('9788500000270', 'Manifesto Comunista', 24.90, 21, 1848, 6),
	('9788500000287', 'Estruturas de Dados e Algoritmos em Java', 209.00, 6, 1998, 8),
	('9788500000294', 'Microeconomia', 199.00, 8, 1989, 7),
	('9788500000300', 'Fundamentos de Física', 259.00, 9, 1960, 10);

INSERT INTO tbl_autor (id_autor, nome_completo, nacionalidade, data_nascimento) VALUES
	(1, 'Machado de Assis', 'Brasileira', '1839/06/21'),
	(2, 'João Guimarães Rosa', 'Brasileira', '1908/06/27'),
	(3, 'Graciliano Ramos', 'Brasileira', '1892/10/27'),
	(4, 'Jorge Amado', 'Brasileira', '1912/08/10'),
	(5, 'Clarice Lispector', 'Brasileira', '1920/12/10'),
	(6, 'Mário de Andrade', 'Brasileira', '1893/10/09'),
	(7, 'Ariano Suassuna', 'Brasileira', '1927/06/16'),
	(8, 'Paulo Coelho', 'Brasileira', '1947/08/24'),
	(9, 'Antoine de Saint-Exupéry', 'Francesa', '1900/06/29'),
	(10, 'George Orwell', 'Britânica', '1903/06/25'),
	(11, 'J.K. Rowling', 'Britânica', '1965/07/31'),
	(12, 'Yuval Noah Harari', 'Israelense', '1976/02/24'),
	(13, 'Robert C. Martin', 'Americana', NULL),
	(14, 'J.R.R. Tolkien', 'Britânica', '1892/01/03'),
	(15, 'Jane Austen', 'Britânica', '1775/12/16'),
	(16, 'Ramez Elmasri', NULL, NULL),
	(17, 'Shamkant B. Navathe', NULL, NULL),
	(18, 'Abraham Silberschatz', NULL, NULL),
	(19, 'Henry F. Korth', 'Americana', NULL),
	(20, 'S. Sudarshan', NULL, NULL),
	(21, 'Thomas H. Cormen', 'Americana', NULL),
	(22, 'Charles E. Leiserson', 'Americana', NULL),
	(23, 'Ronald L. Rivest', 'Americana', NULL),
	(24, 'Clifford Stein', 'Americana', NULL),
	(25, 'Stuart Russell', 'Britânica', NULL),
	(26, 'Peter Norvig', 'Americana', NULL),
	(27, 'Andrew S. Tanenbaum', 'Americana', '1944/03/16'),
	(28, 'David J. Wetherall', NULL, NULL),
	(29, 'Paul Deitel', 'Americana', NULL),
	(30, 'Harvey Deitel', 'Americana', NULL),
	(31, 'Erich Gamma', 'Suíça', NULL),
	(32, 'Richard Helm', NULL, NULL),
	(33, 'Ralph Johnson', 'Americana', NULL),
	(34, 'John Vlissides', 'Americana', NULL),
	(35, 'John E. Hopcroft', 'Americana', '1939/10/07'),
	(36, 'Rajeev Motwani', 'Indiana', '1962/03/26'),
	(37, 'Jeffrey D. Ullman', 'Americana', '1942/11/22'),
	(38, 'Steven D. Levitt', 'Americana', '1967/05/29'),
	(39, 'Stephen J. Dubner', 'Americana', '1963/08/26'),
	(40, 'Neil Gaiman', 'Britânica', '1960/11/10'),
	(41, 'Terry Pratchett', 'Britânica', '1948/04/28'),
	(42, 'Karl Marx', 'Alemã', '1818/05/05'),
	(43, 'Friedrich Engels', 'Alemã', '1820/11/28'),
	(44, 'Michael T. Goodrich', 'Americana', NULL),
	(45, 'Roberto Tamassia', 'Italiana', NULL),
	(46, 'Robert S. Pindyck', 'Americana', NULL),
	(47, 'Daniel L. Rubinfeld', 'Americana', NULL),
	(48, 'David Halliday', 'Americana', '1916/08/31'),
	(49, 'Robert Resnick', 'Americana', '1923/01/11'),
	(50, 'Jearl Walker', 'Americana', NULL);

INSERT INTO tbl_livro_autor (isbn, id_autor) VALUES
	('9788500000010', 1),
	('9788500000027', 2),
	('9788500000034', 3),
	('9788500000041', 4),
	('9788500000058', 5),
	('9788500000065', 5),
	('9788500000072', 6),
	('9788500000089', 7),
	('9788500000096', 8),
	('9788500000102', 9),
	('9788500000119', 10),
	('9788500000126', 11),
	('9788500000133', 12),
	('9788500000140', 13),
	('9788500000157', 14),
	('9788500000164', 15),
	('9788500000171', 16),
	('9788500000171', 17),
	('9788500000188', 18),
	('9788500000188', 19),
	('9788500000188', 20),
	('9788500000195', 21),
	('9788500000195', 22),
	('9788500000195', 23),
	('9788500000195', 24),
	('9788500000201', 25),
	('9788500000201', 26),
	('9788500000218', 27),
	('9788500000218', 28),
	('9788500000225', 29),
	('9788500000225', 30),
	('9788500000232', 31),
	('9788500000232', 32),
	('9788500000232', 33),
	('9788500000232', 34),
	('9788500000249', 35),
	('9788500000249', 36),
	('9788500000249', 37),
	('9788500000256', 38),
	('9788500000256', 39),
	('9788500000263', 40),
	('9788500000263', 41),
	('9788500000270', 42),
	('9788500000270', 43),
	('9788500000287', 44),
	('9788500000287', 45),
	('9788500000294', 46),
	('9788500000294', 47),
	('9788500000300', 48),
	('9788500000300', 49),
	('9788500000300', 50);

INSERT INTO tbl_cliente (id_cliente, nome_completo, email, cpf, data_cadastro) VALUES
	(1, 'Lucas Silva', 'lucas1@gmail.com', '11110710310', '2026/02/01'),
	(2, 'Mariana Souza', 'mariana2@gmail.com', '14816017411', '2026/03/03'),
	(3, 'Roberto Lima', 'roberto3@gmail.com', '18521324512', '2026/04/05'),
	(4, 'Juliana Pereira', 'juliana4@gmail.com', '22226631613', '2026/05/07'),
	(5, 'Carlos Ramos', 'carlos5@gmail.com', '25931938714', '2026/06/09'),
	(6, 'Patrícia Costa', 'patricia6@gmail.com', '29637245815', '2026/07/11'),
	(7, 'André Rocha', 'andre7@gmail.com', '33342552916', '2026/08/13'),
	(8, 'Fernanda Martins', 'fernanda8@gmail.com', '37047860017', '2026/09/15'),
	(9, 'Rafael Nunes', 'rafael9@gmail.com', '40753167118', '2026/01/17'),
	(10, 'Camila Araújo', 'camila10@gmail.com', '44458474219', '2026/02/19');

INSERT INTO tbl_pedido (id_pedido, data_hora, valor_total, id_cliente) VALUES
	(1, '2026-02-03T10:07:00', 224.70, 1),
	(2, '2026-03-05T11:14:00', 533.90, 2),
	(3, '2026-04-07T12:21:00', 54.90, 3),
	(4, '2026-05-09T13:28:00', 324.80, 4),
	(5, '2026-06-11T14:35:00', 134.60, 5),
	(6, '2026-07-13T15:42:00', 89.90, 6),
	(7, '2026-08-15T16:49:00', 299.70, 7),
	(8, '2026-09-17T17:56:00', 358.70, 8),
	(9, '2026-01-19T18:03:00', 237.90, 9),
	(10, '2026-02-21T19:10:00', 667.80, 10);

INSERT INTO tbl_item_pedido (id_item_pedido, quantidade, preco_unitario_venda, id_pedido, isbn) VALUES
	(1, 1, 44.90, 1, '9788500000034'),
	(2, 2, 89.90, 1, '9788500000140'),
	(3, 1, 45.90, 2, '9788500000072'),
	(4, 1, 229.00, 2, '9788500000225'),
	(5, 1, 259.00, 2, '9788500000300'),
	(6, 1, 54.90, 3, '9788500000119'),
	(7, 2, 42.90, 4, '9788500000058'),
	(8, 1, 239.00, 4, '9788500000188'),
	(9, 1, 49.90, 5, '9788500000256'),
	(10, 1, 34.90, 5, '9788500000096'),
	(11, 2, 24.90, 5, '9788500000270'),
	(12, 1, 89.90, 6, '9788500000027'),
	(13, 3, 36.90, 7, '9788500000164'),
	(14, 1, 189.00, 7, '9788500000218'),
	(15, 1, 59.90, 8, '9788500000126'),
	(16, 1, 199.00, 8, '9788500000294'),
	(17, 2, 49.90, 8, '9788500000041'),
	(18, 1, 199.00, 9, '9788500000249'),
	(19, 1, 38.90, 9, '9788500000089'),
	(20, 2, 279.00, 10, '9788500000201'),
	(21, 1, 39.90, 10, '9788500000010'),
	(22, 1, 69.90, 10, '9788500000133');

SELECT * FROM tbl_editora;
SELECT * FROM tbl_livro;
SELECT * FROM tbl_autor;
SELECT * FROM tbl_livro_autor;
SELECT * FROM tbl_cliente;
SELECT * FROM tbl_pedido;
SELECT * FROM tbl_item_pedido;