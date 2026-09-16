USE torneo_videojuegos;

-- Insertar jugador
INSERT INTO jugadores (nombre, gamertag, correo) 
VALUES ('Taylor Swift', 'Swiftie', 'taylor@gmail.com');

-- Insertar videojuego
INSERT INTO videojuegos (nombre, genero_id) 
VALUES ('Street Fighter 6', 1);

-- Insertar puntuación
INSERT INTO puntuaciones (jugador_id, videojuego_id, puntuacion) 
VALUES (1, 1, 1250);

-- Consultar jugadores
SELECT id, nombre, gamertag, correo, fecha_registro 
FROM jugadores 
ORDER BY fecha_registro DESC;

-- Ranking de puntuaciones (Mayor a menor)
SELECT 
    j.gamertag AS jugador,
    v.nombre AS videojuego,
    p.puntuacion,
    p.fecha
FROM puntuaciones p
INNER JOIN jugadores j ON p.jugador_id = j.id
INNER JOIN videojuegos v ON p.videojuego_id = v.id
ORDER BY p.puntuacion DESC;

-- Sumar las puntuaciones totales de cada jugador
SELECT 
    j.id,
    j.nombre,
    j.gamertag,
    IFNULL(SUM(p.puntuacion), 0) AS puntuacion_total
FROM jugadores j
LEFT JOIN puntuaciones p ON j.id = p.jugador_id
GROUP BY j.id, j.nombre, j.gamertag
ORDER BY puntuacion_total DESC;


-- Ordenar a los jugadores por orden alfabético de su gamertag
SELECT id, nombre, gamertag, correo, fecha_registro
FROM jugadores
ORDER BY gamertag ASC;

-- o también por nombre
SELECT id, nombre, gamertag, correo, fecha_registro
FROM jugadores
ORDER BY nombre ASC;

-- Buscar jugador por Nombre o Gamertag
SELECT id, nombre, gamertag, correo, fecha_registro 
FROM jugadores 
WHERE nombre LIKE '%Hatter%' OR gamertag LIKE '%Hatter%';

-- Estadísticas del sistema
SELECT 
    (SELECT COUNT(*) FROM jugadores) AS total_jugadores,
    (SELECT COUNT(*) FROM videojuegos) AS total_videojuegos,
    (SELECT COUNT(*) FROM puntuaciones) AS total_puntuaciones,
    (SELECT IFNULL(ROUND(AVG(puntuacion), 2), 0) FROM puntuaciones) AS puntuacion_promedio;