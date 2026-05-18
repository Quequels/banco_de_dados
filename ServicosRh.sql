-- criando o banco de dados
CREATE DATABASE db_servicosrh;

-- inicializando 
use db_servicosrh;

-- criação de tabela
CREATE TABLE colaboradores (
	id_colaborador BIGINT AUTO_INCREMENT primary key,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    departamento varchar(50),
    cargo VARCHAR(50),
    data_admissao DATE,
    salario Decimal
);

 -- Inserindo dados
INSERT INTO colaboradores (nome, email, departamento, cargo, data_admissao, salario)
VALUES ('Joelson Miranda', 'joelsonmiranda@gmail.com','Rh','Assistente de Rh','2025-05-05', 1800.00 ),
 ('Lucimara Santos', 'lucimarasantos@gmail.com','Rh','Analista de Rh','2025-05-05', 2000.00 ),
 ('Marianne Bittencurt', 'maribittencurt@gmail.com','Rh','Coordenador de Rh','2024-04-10', 3000.00),
 ('Lucas Xavier', 'lucasXavier@gmail.com','Rh','Gerente de Rh','2023-01-23', 4000.00 ),
 ('Joana Silva', 'joanasilva@gmail.com','Rh','Diretor de Rh','2023-03-25', 5000.00);
 
 
 -- visualização
 SELECT * FROM colaboradores;
 
 SELECT * FROM colaboradores WHERE salario > 2000.00;

SELECT * FROM  colaboradores WHERE salario < 2000.00;

-- utilizando query UPDATE

UPDATE colaboradores SET email = 'alteracaoemail@gmail.com' WHERE id_colaborador = 4;

