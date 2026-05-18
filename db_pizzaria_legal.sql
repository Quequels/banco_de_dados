CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(30) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_pizzas (
	id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6,2) NOT NULL,
    tamanho VARCHAR(20),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Salgada', 'Pizzas tradicionais salgadas'),
('Doce', 'Pizzas doces'),
('Vegetariana', 'Sem carne'),
('Vegana', 'Sem produtos de origem animal'),
('Premium', 'Ingredientes especiais');

INSERT INTO tb_pizzas (nome_pizza, descricao, preco, tamanho, id_categoria) VALUES
('Calabresa', 'Calabresa com cebola', 45.00, '8 pedaços', 1),
('Portuguesa', 'Presunto, ovo e cebola', 60.00, '10 pedaços', 1),
('Frango Catupiry', 'Frango com catupiry', 55.00, '8 pedaços', 1),
('Margherita', 'Tomate, queijo e manjericão', 50.00, '8 pedaços', 3),
('Chocolate', 'Chocolate ao leite', 40.00, 'Broto', 2),
('Banana com Canela', 'Banana com açúcar e canela', 48.00, 'Broto', 2),
('Vegana Especial', 'Legumes e queijo vegano', 65.00, '8 pedaços', 4),
('Camarão Premium', 'Camarão com molho especial', 120.00, '10 pedaços', 5);

-- retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco >= 50 AND preco <= 100;

-- buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas
WHERE nome_pizza LIKE '%m%';

-- unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT p.nome_pizza, p.descricao, p.preco, p.tamanho, c.nome_categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.id_categoria = c.id_categoria ;

-- unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT p.nome_pizza, p.descricao, p.preco, p.tamanho, c.nome_categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.id_categoria = c.id_categoria 
WHERE c.nome_categoria = 'Vegetariana';
