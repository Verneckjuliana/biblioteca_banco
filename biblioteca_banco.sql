CREATE DATABASE biblioteca;

CREATE TABLE funcionarios(
	registro INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    cargo TEXT
);

CREATE TABLE livros(
	titulo VARCHAR(255) NOT NULL,
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    imagem BLOB,
    categoria ENUM('ficção','romance','mistério')
);

CREATE TABLE autores(
	nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    biografia TEXT,
    titulo VARCHAR(255) NOT NULL,
    FOREIGN KEY (titulo) REFERENCES livros (titulo)
);

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
	data_registro DATE,
    associacao ENUM('regular','premium')
);

CREATE TABLE emprestimos(
	nome VARCHAR(255) NOT NULL,
	FOREIGN KEY (nome) REFERENCES usuarios (nome),
    data_inicio DATE,
    data_retorno DATE,
    titulo VARCHAR(255) NOT NULL,
    FOREIGN KEY (titulo) REFERENCES livros (titulo)
);
