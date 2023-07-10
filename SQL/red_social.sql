CREATE DATABASE red_social_N5_now;

CREATE TABLE IF NOT EXISTS ciudad(
    id_ciudad SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS personas (
    id_persona SERIAL PRIMARY KEY,
    nombre_persona VARCHAR(50) NOT NULL,
    id_ciudad INTEGER NOT NULL,
    CONSTRAINT fk_ciudad
        FOREIGN KEY(id_ciudad)
            REFERENCES ciudad(id_ciudad)
);

CREATE TABLE IF NOT EXISTS restaurantes (
    id_restaurante SERIAL PRIMARY KEY,
    nombre_restaurante VARCHAR(50) NOT NULL,
    id_ciudad INTEGER NOT NULL,
    CONSTRAINT fk_ciudad
        FOREIGN KEY(id_ciudad)
            REFERENCES ciudad(id_ciudad)
);

--ingresar datos en la tabla ciudad
INSERT INTO ciudad(nombre_ciudad) VALUES ('Bogotá');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Medellín');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Cali');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Barranquilla');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Cartagena');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Bucaramanga');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Pereira');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Santa Marta');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Manizales');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Cúcuta');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Villavicencio');
INSERT INTO ciudad(nombre_ciudad) VALUES ('Guaviare');

--ingresar datos en la tabla personas en ciudades aleatorias
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Pedro', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Maria', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Luis', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Carlos', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Andres', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Jorge', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Santiago', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Camilo', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Daniel', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Alejandro', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Sebastian', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Mateo', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Nicolas', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Samuel', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('David', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Pablo', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Sebastian', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan David', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Camilo', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Jose', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Manuel', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO personas(nombre_persona, id_ciudad) VALUES ('Juan Felipe', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));

--ingresar datos en la tabla restaurantes en ciudades aleatorias
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('El Corral', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('McDonalds', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Burger King', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('KFC', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Subway', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Pizza Hut', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Dominos Pizza', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Sason del abuela', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Carnes y cortes', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Frisby', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Presto', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('Papa Johns', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('El Corral Gourmet', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('El Corral Express', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));
INSERT INTO restaurantes(nombre_restaurante, id_ciudad) VALUES ('El Corral Togo', (SELECT id_ciudad FROM ciudad ORDER BY RANDOM() LIMIT 1));

--Obtiene la información de las personas y los restaurantes en la misma ciudad que la persona

SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
         JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
         JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;

-- Obtener la cantidad de personas que hay por ciudad
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
         JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;

-- Obtener la cantidad de restaurantes que hay por ciudad
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
         JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;

--Obtiene la información de las personas y los restaurantes en la misma ciudad
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
         LEFT JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
         LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
-- Obtener la cantidad de personas que hay por ciudad
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
         LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
-- Obtener la cantidad de restaurantes que hay por ciudad
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
         LEFT JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;

--Obtener la información de las personas y los restaurantes en la misma ciudad
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
         RIGHT JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
         RIGHT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
-- Obtener la cantidad de personas que hay por ciudad
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
         RIGHT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;

-- Restaurantes que hay por ciudad, ordenados por cantidad de restaurantes
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
         LEFT JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad
ORDER BY cantidad_restaurantes DESC;

--Ordenar las personas por ciudad, ordenados por cantidad de personas
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
         LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad
ORDER BY cantidad_personas ASC;


