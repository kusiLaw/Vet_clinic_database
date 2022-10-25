/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 
'2016-01-01' AND  '2019-12-31';
SELECT * FROM animals WHERE neutered AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE NOT name  = 'Gabumon';
SELECT * FROM animals WHERE  weight_kg BETWEEN 10.4 AND 17.3;


-- project 2
BEGIN;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 SELECT * FROM animals;
COMMIT;

BEGIN;
 UPDATE animals SET species = 'pokemon' WHERE  species IS NULL;
 SELECT * FROM animals;
COMMIT;

BEGIN;
 DELETE FROM animals;
 SELECT * FROM animals;
ROLLBACK;

BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT DELETED_ANIMAL;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO DELETED_ANIMAL;
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
 SELECT * FROM animals;
COMMIT;

SELECT COUNT(*) AS "total animals" FROM animals;
SELECT COUNT(*) AS "total neutered animals" FROM animals WHERE neutered;
SELECT AVG(weight_kg) AS average FROM animals;
SELECT neutered, SUM(escape_attempts) AS "Most escape animal" FROM animals GROUP BY neutered ;
SELECT max(weight_kg) AS "max weigth", min(weight_kg) AS "min weigth" FROM animals;
SELECT species, AVG(escape_attempts) AS average FROM animals  
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;