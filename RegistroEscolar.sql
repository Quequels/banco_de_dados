CREATE DATABASE db_registro_escola;

use db_registro_escola;

CREATE TABLE estudantes (
	id_estudante BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    turma VARCHAR(2),
    data_nascimento DATE,
    periodo VARCHAR(10),
    materia VARCHAR(100),
    nota FLOAT
);


CREATE VIEW nota_estudantes AS 
SELECT nome, turma, periodo, materia, nota
FROM estudantes
WHERE nota > 5.00;

SELECT * FROM nota_estudantes;


INSERT INTO estudantes (nome, turma, data_nascimento, periodo, materia, nota) VALUES
('Ana Souza', 'A1', '2005-03-15', 'Manhã', 'Matemática', 8.5),
('Carlos Lima', 'A1', '2004-11-22', 'Manhã', 'Português', 7.8),
('Beatriz Santos', 'B2', '2005-07-10', 'Tarde', 'História', 9.0),
('João Pereira', 'B2', '2003-09-05', 'Tarde', 'Geografia', 6.5),
('Mariana Costa', 'C1', '2004-01-30', 'Noite', 'Biologia', 8.9),
('Lucas Almeida', 'C1', '2003-06-18', 'Noite', 'Química', 7.2),
('Fernanda Rocha', 'A2', '2005-12-02', 'Manhã', 'Física', 9.3),
('Rafael Gomes', 'B1', '2004-04-27', 'Tarde', 'Inglês', 6.8);

SELECT * FROM estudantes;

SELECT * FROM estudantes WHERE nota > 7.00;

SELECT * FROM estudantes WHERE nota < 7.00;


UPDATE estudantes SET nota = 7.00 WHERE id_estudante = 6;


