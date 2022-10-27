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
UPDATE animals SET species = 'unspecified';
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


-- project 3
SELECT animals.name  AS " Melody's Animals" FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

SELECT  animals.name as "Pokemon species types"  FROM animals JOIN  species ON
animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT *  FROM owners LEFT JOIN  animals ON
animals.owner_id = owners.id;

SELECT species.name, count(animals.name) as "animal per spices"  FROM animals JOIN  species ON
animals.species_id = species.id GROUP BY species.name;

SELECT animals.name  AS "Jennifer Orwell ownes" FROM animals 
JOIN owners ON animals.owner_id = owners.id 
JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon' ;

SELECT animals.name  AS "Dean Winchester non-escape animals" FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name)  AS "owns" FROM owners 
JOIN animals ON animals.owner_id = owners.id 
GROUP BY owners.full_name ORDER BY COUNT(animals.name)  DESC LIMIT 1;


-- project 4

SELECT animals.name AS "Last animal seen by William ", visits.date_visited  AS "Date seen"  FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id 
WHERE vets.name = 'William Tatcher' ORDER BY visits.date_visited DESC LIMIT 1;

SELECT DISTINCT(COUNT( animals.name)) AS "different animals seen by Stephanie" FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name AS "specialties" FROM vets LEFT JOIN specializations ON 
vets.id = specializations.vets_id LEFT JOIN
species ON species.id = specializations.species_id ;

SELECT animals.name AS "Animals", visits.date_visited  AS "Date visted"  FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date_visited  BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.animals_id) AS "most visited"  FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id 
GROUP BY animals.name ORDER BY COUNT(visits.animals_id) DESC LIMIT 1;

SELECT animals.name AS "Maisy Smith's first visit", visits.date_visited  AS "Date"  FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id 
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_visited LIMIT 1;

SELECT animals.name, animals.date_of_birth, animals.weight_kg,visits.date_visited,
vets.name, vets.age, vets.date_of_graduation
FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id ORDER BY visits.date_visited DESC LIMIT 1;

SELECT count(animals.name)  AS "Visit to unspecializes Vet" FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id 
WHERE vets.name =  (SELECT vets.name FROM vets LEFT JOIN specializations ON 
vets.id = specializations.vets_id LEFT JOIN
species ON species.id = specializations.species_id  where species.name is null) ;

SELECT count(animals.name), species.name As "specialty Maisy Smith should consider" FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id LEFT JOIN species
on species.id = animals.species_id
WHERE vets.name = 'Maisy Smith' GROUP BY species.name LIMIT 1;
