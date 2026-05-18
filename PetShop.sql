CREATE DATABASE db_petshop;
use db_petshop;

CREATE TABLE produtos (
	id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255),
    categoria varchar(100),
    qntd INT,
    preco DECIMAL
);


INSERT INTO produtos (nome, categoria, qntd, preco) VALUES
('Ração Premium para Cães 10kg', 'Alimentação', 20, 189.90),
('Ração para Gatos 5kg', 'Alimentação', 15, 129.50),
('Coleira Ajustável', 'Acessórios', 40, 25.90),
('Brinquedo Mordedor', 'Brinquedos', 60, 18.75),
('Areia Sanitária 4kg', 'Higiene', 30, 35.00),
('Shampoo para Pets', 'Higiene', 25, 22.90),
('Cama para Cachorro', 'Conforto', 10, 150.00),
('Caixa de Transporte', 'Transporte', 8, 510.50);

SELECT * FROM produtos;

SELECT * FROM produtos WHERE preco > 500;
SELECT * FROM produtos WHERE preco < 500;

UPDATE produtos SET preco = 200.00 WHERE id_produto = 2;