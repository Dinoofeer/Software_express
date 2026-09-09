create database if not exists torneo_videojuegos;
use torneo_videojuegos;

-- RF1. REGISTRAR JUGADORES
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    gamertag VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(50) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- RF02. Registrar videojuegos 
CREATE TABLE videojuegos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre  VARCHAR(50) NOT NULL UNIQUE,
	genero  VARCHAR(50) NOT NULL
);

-- RF03. Registrar puntuaciones 
CREATE TABLE puntuaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    videojuego_id INT NOT NULL,
    puntuacion INT NOT NULL CHECK (puntuacion >= 0),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE,
    FOREIGN KEY (videojuego_id) REFERENCES videojuegos(id) ON DELETE CASCADE
);