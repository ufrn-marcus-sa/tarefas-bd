-- Povoamento expandido gerado com IA generativa (Claude) a partir do prompt da Tarefa 03
USE biblioteca;

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
