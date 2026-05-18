CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
	id_classe BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe ENUM('Arqueiro','Assassino','Curandeiro','Guerreiro','Mago','Tank'),
    descricao TEXT,
    hp INT,
    mana INT,
    ataque INT,
    defesa INT,
    velocidade INT
);

CREATE TABLE tb_personagens (
	id_personagem BIGINT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(12),
    genero ENUM('masculino', 'feminino', 'nao_binario'),
	raca ENUM('humano' , 'elfo','trol', 'anao'),
    nivel INT,
    titulo VARCHAR(10),
    xp INT,
    id_classe BIGINT,
    FOREIGN KEY (id_classe)
	REFERENCES tb_classes(id_classe)
    ON DELETE SET NULL
	ON UPDATE CASCADE
);


INSERT INTO tb_classes (nome_classe, descricao, hp, mana, ataque, defesa, velocidade) VALUES
('Guerreiro', 'Combate corpo a corpo resistente.', 5000, 500, 1800, 1500, 800),   
('Mago', 'Dano mágico elevado.', 3000, 5000, 3200, 1200, 900),                  
('Arqueiro', 'Ataque à distância preciso.', 3500, 1500, 2200, 1800, 2000),     
('Tank', 'Alta defesa e resistência.', 8000, 800, 1500, 3500, 600),            
('Assassino', 'Dano crítico e velocidade.', 2800, 1200, 3500, 800, 3000),      
('Curandeiro', 'Suporte e cura.', 4000, 4500, 1700, 2000, 1000);                

INSERT INTO tb_personagens (nickname, genero, raca, nivel, titulo, xp, id_classe) VALUES
('ByteMestre', 'masculino', 'humano', 10, 'Dev', 1500, 2),
('LogicaViva', 'feminino', 'elfo', 12, 'Sábia', 1800, 6),
('AlgoritmoX', 'nao_binario', 'humano', 15, 'Coder', 2500, 5),
('DebugHero', 'masculino', 'anao', 8, 'Fixer', 900, 1),
('DataGuardian', 'feminino', 'trol', 20, 'Tank', 3200, 4),
('ScriptRunner', 'masculino', 'elfo', 11, 'Runner', 1400, 3),
('QueryMaster', 'nao_binario', 'humano', 18, 'SQLPro', 2900, 2),
('StackSage', 'feminino', 'anao', 14, 'Guru', 2100, 6);




SELECT * FROM tb_classes;
SELECT * FROM tb_personagens;


CREATE VIEW habilidades AS 
SELECT 
	p.nickname,
    p.nivel,
    c.nome_classe,
    c.ataque,
    c.defesa
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.id_classe = c.id_classe;


SELECT * FROM habilidades;

-- retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT p.nickname, c.ataque
FROM tb_personagens p 
INNER JOIN tb_classes c
ON p.id_classe = c.id_classe
WHERE c.ataque > 2000;

-- retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT p.nickname, c.defesa
FROM tb_personagens p 
INNER JOIN tb_classes c
ON p.id_classe = c.id_classe
WHERE c.defesa >= 1000 AND c.defesa <= 2000;

--  buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens 
WHERE nickname LIKE '%c%';

-- unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT p.nickname, p.genero, p.raca, p.nivel, p.titulo, p.xp, c.nome_classe, c.descricao, c.hp, c.mana, c.ataque, c.defesa, c.velocidade
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.id_classe = c.id_classe;

-- traga apenas os personagens que pertençam a uma classe específica
SELECT p.nickname, p.genero, p.raca, p.nivel, p.titulo, p.xp, c.nome_classe, c.descricao, c.hp, c.mana, c.ataque, c.defesa, c.velocidade
FROM tb_personagens p 
INNER JOIN tb_classes c 
ON p.id_classe = c.id_classe WHERE nome_classe = 'Arqueiro' ;




