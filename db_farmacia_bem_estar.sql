CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(30) NOT NULL,
    descricao TEXT

);

CREATE TABLE tb_produtos (
	id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(30) NOT NULL,
    descricao TEXT,
    qntd_comprimidos INT,
	preco DECIMAL(6,2) NOT NULL,
	id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Analgésicos', 'Alívio de dores em geral'),
('Antibióticos', 'Combate infecções bacterianas'),
('Vitaminas', 'Suplementos vitamínicos'),
('Antialérgicos', 'Tratamento de alergias'),
('Anti-inflamatórios', 'Redução de inflamações');

INSERT INTO tb_produtos (nome_produto, descricao, qntd_comprimidos, preco, id_categoria) VALUES
('Paracetamol', 'Alívio de dor e febre', 20, 10.00, 1),
('Ibuprofeno', 'Anti-inflamatório e analgésico', 30, 25.00, 5),
('Amoxicilina', 'Antibiótico de amplo espectro', 21, 45.00, 2),
('Vitamina C', 'Suplemento vitamínico', 60, 35.00, 3),
('Loratadina', 'Antialérgico', 15, 18.00, 4),
('Dipirona', 'Analgésico e antitérmico', 10, 8.00, 1),
('Complexo B', 'Vitaminas do complexo B', 30, 40.00, 3),
('Nimesulida', 'Anti-inflamatório', 12, 22.00, 5);

UPDATE tb_produtos
SET preco = 55.00
WHERE id_produto = 2;

UPDATE tb_produtos
SET preco = 80.00
WHERE id_produto = 3;

-- retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco > 50;

--  retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos WHERE preco >= 5 AND preco <= 60;

-- buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%c%';

-- unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT p.nome_produto, p.descricao, p.preco, c.nome_categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c
ON p.id_categoria = c.id_categoria ;


-- unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT p.nome_produto, p.descricao, p.preco, c.nome_categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c
ON p.id_categoria = c.id_categoria 
WHERE c.nome_categoria = 'Antibióticos';
