CREATE DATABASE bibliotecaLivros;

CREATE TABLE funcionarios(
	registro INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    cargo TEXT
);

CREATE TABLE livros(
	id_livro INT,
	titulo VARCHAR(255) NOT NULL,
    autor TEXT,
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    categoria ENUM('ficção','romance','mistério')
);

CREATE TABLE autores(
	nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    biografia TEXT
);

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
	data_registro DATE,
    associacao ENUM('regular','premium')PRIMARY
);

CREATE TABLE emprestimos(
	ISBN INT,
    data_inicio DATE,
    data_retorno DATE,
    FOREIGN KEY (ISBN) REFERENCES livros (ISBN)
);
 
ALTER TABLE emprestimos
DROP COLUMN nome_da_coluna;


SELECT livros.titulo, usuarios.nome, emprestimos.data_inicio, emprestimos.data_retorno
FROM emprestimos
INNER JOIN livros ON emprestimos.ISBN = livros.ISBN
INNER JOIN usuarios ON emprestimos.id_usuario = usuarios.id;
