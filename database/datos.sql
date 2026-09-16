USE torneo_videojuegos;

-- Insertar géneros de catálogo
INSERT INTO generos (nombre) VALUES
('Peleas'),
('Shooter'),
('Carreras'),
('Estrategia'),
('Deportes'),
('RPG'),
('Plataformas'),
('Aventura');

-- Insertar jugadores de prueba 
INSERT INTO jugadores (nombre, gamertag, correo) VALUES
('Max', 'Hatter', 'max@gmail.com'),
('Chloe', 'Blue', 'chloe@gmail.com'),
('Luis', 'Strong', 'luis@gmail.com');

-- Insertar videojuegos de prueba
INSERT INTO videojuegos (nombre, genero_id) VALUES
('Tekken 8', 1),     -- Peleas
('Halo Infinite', 2), -- Shooter
('Mario Kart 8', 3);  -- Carreras

-- Insertar puntuaciones de prueba
INSERT INTO puntuaciones (jugador_id, videojuego_id, puntuacion) VALUES
(1, 1, 950),
(2, 1, 820),
(3, 1, 760);