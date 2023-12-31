# Challenge SQL N5 NOW
## Description
En este challenge se debe crear una base de datos para una red social, en la cual se debe crear un esquema de gráfico que contenga nodos, personas, restaurantes y la ciudad. Se debe crear la base de datos, las tablas, normalizar la BD si es relacional, insertar información en las tablas, crear consultas con join, inner join y left join, rigth join, limpiar el esquema y la base de datos creados para el ejercicio.

## Desarrollo
Para este reto se utiliza el motor de base de datos PosgreSQL

### Crear un esquema de gráfico para una red social que contenga nodos.
Para crear el esquema de gráfico se utiliza el siguiente código:
```textmate
ciudad
    id_ciudad (llave primaria)
    nombre_ciudad
    |
    |-- la relación es de uno a muchos (una ciudad puede tener muchas personas y restaurantes)
    |
    v
personas
    id_persona (llave primaria)
    nombre_persona
    id_ciudad (llave foranea)
    |
    |-- la relación es de uno a muchos (una ciudad puede tener muchos restaurantes)
    |
    v
restaurantes
    id_restaurante (llave primaria)
    nombre_restaurante
    id_ciudad (llave foranea)
```
### Crear la base de datos.
Para crear la base de datos se utiliza el siguiente código:
```sql
CREATE DATABASE red_social_N5_now;
```
### Crear las tablas.
Para crear las tablas se utiliza el siguiente código:
#### Tabla Ciudad
```sql
CREATE TABLE ciudad (
    id_ciudad SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(50) NOT NULL
);
```
#### Tabla Personas
```sql
CREATE TABLE personas (
    id_persona SERIAL PRIMARY KEY,
    nombre_persona VARCHAR(50) NOT NULL,
    id_ciudad INTEGER NOT NULL,
    CONSTRAINT fk_ciudad
        FOREIGN KEY(id_ciudad)
            REFERENCES ciudad(id_ciudad)
);
```
#### Tabla Restaurantes
```sql
CREATE TABLE restaurantes (
    id_restaurante SERIAL PRIMARY KEY,
    nombre_restaurante VARCHAR(50) NOT NULL,
    id_ciudad INTEGER NOT NULL,
    CONSTRAINT fk_ciudad
        FOREIGN KEY(id_ciudad)
            REFERENCES ciudad(id_ciudad)
);
```
### Insertar información en las tablas.
Para insertar información en las tablas se utiliza el siguiente código:
#### Tabla Ciudad
```sql
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
```
#### Tabla Personas
Se crean las personas con ciudades aleatorias, para poder tener data aleatoria en ciudades aleatorias para esto se utiliza el siguiente código:
```sql
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

```
#### Tabla Restaurantes
se crean los restaurantes con ciudades aleatorias, para poder tener data aleatoria en ciudades aleatorias para esto se utiliza el siguiente código:
```sql
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

```
### Crear consultas
Para crear consultas con join, inner join y left join, rigth join se utiliza el siguiente código:
#### Join
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
```
Obtener la cantidad de personas que hay por ciudad
```sql
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
```
Obtener la cantidad de restaurantes que hay por ciudad
```sql
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
```
#### Inner Join
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
INNER JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
INNER JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
```
Obtener la cantidad de restaurantes que hay por ciudad
```sql
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
LEFT JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
```

#### Left Join
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
LEFT JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
```

Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
         LEFT JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
         LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
    
```
Obtener la cantidad de personas que hay por ciudad
```sql
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
```

#### Rigth Join
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
RIGTH JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
RIGTH JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad;
```
Obtener la cantidad de personas que hay por ciudad
```sql
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
RIGHT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad;
```

### Crear consultas con group by y order by.
Para crear consultas con group by y order by se utiliza el siguiente código:
#### Group by
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad;
```
#### Order by
Obtiene la información de las personas y los restaurantes en la misma ciudad
```sql
SELECT personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad
FROM personas
JOIN restaurantes ON personas.id_ciudad = restaurantes.id_ciudad
JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
ORDER BY personas.nombre_persona, restaurantes.nombre_restaurante, ciudad.nombre_ciudad;
```
Ordenar las personas por ciudad, ordenados por cantidad de personas
```sql
SELECT ciudad.nombre_ciudad, COUNT(personas.id_ciudad) AS cantidad_personas
FROM personas
LEFT JOIN ciudad ON personas.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad
ORDER BY cantidad_personas ASC;
```
Restaurantes que hay por ciudad, ordenados por cantidad de restaurantes
```sql
SELECT ciudad.nombre_ciudad, COUNT(restaurantes.id_ciudad) AS cantidad_restaurantes
FROM restaurantes
LEFT JOIN ciudad ON restaurantes.id_ciudad = ciudad.id_ciudad
GROUP BY ciudad.nombre_ciudad
ORDER BY cantidad_restaurantes DESC;
```

## Limpiar el esquema y la base de datos.
Para limpiar el esquema y la base de datos se utiliza el siguiente código:
#### Limpiar el esquema
```sql
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
```

#### Limpiar las tablas 
Para limpiar las tablas se crea un script compuesto por un select que desactiva las conexiones a la base de datos excepto la conexión actual y luego se eliminan las tablas.
```sql
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'red_social_N5_now'
  AND pid <> pg_backend_pid();

DROP TABLE personas;
DROP TABLE restaurantes;
DROP TABLE ciudad;
```

### la base de datos red_social_N5_now
Para limpiar la base de datos se crea un script compuesto por un select que desactiva las conexiones a la base de datos excepto la conexión actual y luego se elimina la base de datos.
```sql
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'red_social_N5_now'
  AND pid <> pg_backend_pid();

DROP DATABASE red_social_N5_now;
CREATE DATABASE red_social_N5_now;
```
Autor: [Jorge Eider Vásquez Urrutia]()
