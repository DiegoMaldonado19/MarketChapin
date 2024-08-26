CREATE DATABASE marketchapin;

USE marketchapin;

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL
);

CREATE TABLE articulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponibilidad BOOLEAN NOT NULL,
    categoria INT NOT NULL,
    FOREIGN KEY (categoria) REFERENCES categoria(id)
);

CREATE TABLE tipo_usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefono VARCHAR(8) NOT NULL,
    tipo_usuario INT NOT NULL,
    FOREIGN KEY (tipo_usuario) REFERENCES tipo_usuario(id)
);

CREATE TABLE transaccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    usuario INT,
    FOREIGN KEY (usuario) REFERENCES usuario(id)
);