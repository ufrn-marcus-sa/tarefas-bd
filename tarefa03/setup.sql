-- setup.sql - Tarefa 03: recria do zero o banco biblioteca (script idempotente)
-- Uso: docker exec -i lab-mariadb mariadb -uroot -p < setup.sql

DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(50),
  ano_nascimento INT
);

CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  ano_publicacao INT,
  preco DECIMAL(10,2),
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE emprestimos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  livro_id INT,
  data_emprestimo DATE,
  devolvido BOOLEAN,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Usuários e privilégios (DROP USER IF EXISTS garante a idempotência)
DROP USER IF EXISTS 'app_biblioteca'@'%';
CREATE USER 'app_biblioteca'@'%' IDENTIFIED BY 'AppBib2026!';
GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca.* TO 'app_biblioteca'@'%';

DROP USER IF EXISTS 'consulta'@'%';
CREATE USER 'consulta'@'%' IDENTIFIED BY 'Consulta2026!';
GRANT SELECT ON biblioteca.* TO 'consulta'@'%';

DROP USER IF EXISTS 'relatorios'@'%';
CREATE USER 'relatorios'@'%' IDENTIFIED BY 'Relatorios2026!';
GRANT SELECT ON biblioteca.livros TO 'relatorios'@'%';

FLUSH PRIVILEGES;

-- Carga inicial mínima
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Machado de Assis', 'Brasil', 1839),
('Clarice Lispector', 'Brasil', 1920),
('Gabriel García Márquez', 'Colômbia', 1927),
('Jane Austen', 'Inglaterra', 1775);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Dom Casmurro', 1899, 39.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
('A Hora da Estrela', 1977, 32.50, 2),
('Cem Anos de Solidão', 1967, 59.90, 3),
('Orgulho e Preconceito', 1813, 29.90, 4);

-- Carga expandida (mesmo conteúdo de povoamento.sql)
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Fiódor Dostoiévski', 'Rússia', 1821),
('George Orwell', 'Inglaterra', 1903),
('José Saramago', 'Portugal', 1922),
('Jorge Amado', 'Brasil', 1912),
('Franz Kafka', 'República Tcheca', 1883),
('Chimamanda Ngozi Adichie', 'Nigéria', 1977),
('Haruki Murakami', 'Japão', 1949),
('Victor Hugo', 'França', 1802),
('Toni Morrison', 'Estados Unidos', 1931),
('Graciliano Ramos', 'Brasil', 1892);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Quincas Borba', 1891, 36.90, 1),
('Laços de Família', 1960, 42.00, 2),
('O Amor nos Tempos do Cólera', 1985, 54.90, 3),
('Razão e Sensibilidade', 1811, 31.50, 4),
('Crime e Castigo', 1866, 64.90, 5),
('Os Irmãos Karamázov', 1880, 89.90, 5),
('Notas do Subsolo', 1864, 34.90, 5),
('1984', 1949, 44.90, 6),
('A Revolução dos Bichos', 1945, 29.90, 6),
('Ensaio sobre a Cegueira', 1995, 59.90, 7),
('O Evangelho Segundo Jesus Cristo', 1991, 62.00, 7),
('Memorial do Convento', 1982, 55.50, 7),
('Capitães da Areia', 1937, 39.90, 8),
('Gabriela, Cravo e Canela', 1958, 49.90, 8),
('Dona Flor e Seus Dois Maridos', 1966, 52.90, 8),
('A Metamorfose', 1915, 24.90, 9),
('O Processo', 1925, 38.90, 9),
('Americanah', 2013, 69.90, 10),
('Hibisco Roxo', 2003, 47.90, 10),
('Kafka à Beira-Mar', 2002, 74.90, 11),
('Norwegian Wood', 1987, 58.90, 11),
('Os Miseráveis', 1862, 99.90, 12),
('O Corcunda de Notre-Dame', 1831, 46.90, 12),
('Amada', 1987, 56.90, 13),
('O Olho Mais Azul', 1970, 43.90, 13),
('Vidas Secas', 1938, 34.90, 14),
('São Bernardo', 1934, 37.90, 14);

INSERT INTO emprestimos (livro_id, data_emprestimo, devolvido) VALUES
(1, '2026-10-05', FALSE),
(8, '2026-10-12', FALSE),
(13, '2026-09-20', TRUE);
