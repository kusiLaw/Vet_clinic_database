/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-7', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, TRUE, 11);

-- project 2
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Charmander', '2020-02-08',-11, FALSE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Plantmon', '2021-11-15',-5.7, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Squirtle', '1993-04-02',-12.13, FALSE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Angemon', '2005-06-12',-45, TRUE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Boarmon', '2005-06-07',20.4, TRUE, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Blossom', '1998-10-13',17, TRUE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES('Ditto', '2022-05-14',22, TRUE, 4);

-- project 3
-- inserting into owners
INSERT INTO owners(full_name,age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name,age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name,age) VALUES ('Bod', 45);
INSERT INTO owners(full_name,age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name,age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name,age) VALUES ('Jodie Whittaker', 38);

-- inserting into species
INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

-- update animals table
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';


UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN  ('Gabumon' , 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN  ('Devimon' , 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN  ('Charmander', 'Squirtle',  'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN  ('Angemon' , 'Boarmon');


-- project 4
-- insert into vets table
INSERT INTO vets(name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- insert into specializations
INSERT INTO specializations (species_id, vets_id)
VALUES ( 
 (SELECT id FROM species WHERE name = 'Pokemon'),
 (SELECT id FROM vets WHERE name = 'William Tatcher')) ,
(
 (SELECT id FROM species WHERE name = 'Digimon'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
),
(
 (SELECT id FROM species WHERE name = 'Pokemon'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
),
(
 (SELECT id FROM species WHERE name = 'Digimon'),
 (SELECT id FROM vets WHERE name = 'Jack Harkness')
);

-- insert into visits
INSERT INTO visits(animals_id, vets_id, date_visited)
VALUES 
(
 (SELECT id FROM animals WHERE name = 'Agumon'),
 (SELECT id FROM vets WHERE name = 'William Tatcher'),
 '2020-05-24'
),
(
 (SELECT id FROM animals WHERE name = 'Agumon'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 '2020-07-22'
),
(
 (SELECT id FROM animals WHERE name = 'Gabumon'),
 (SELECT id FROM vets WHERE name = 'Jack Harkness'),
 '2021-02-02'
),
(
 (SELECT id FROM animals WHERE name = 'Pikachu'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2020-01-05'
),
(
 (SELECT id FROM animals WHERE name = 'Pikachu'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2020-03-08'
),
(
 (SELECT id FROM animals WHERE name = 'Pikachu'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2020-05-14'
),
(
 (SELECT id FROM animals WHERE name = 'Devimon'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 '2021-05-04'
),
(
 (SELECT id FROM animals WHERE name = 'Charmander'),
 (SELECT id FROM vets WHERE name = 'Jack Harkness'),
 '2021-02-24'
),
(
 (SELECT id FROM animals WHERE name = 'Plantmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2019-12-21'
),
(
 (SELECT id FROM animals WHERE name = 'Plantmon'),
 (SELECT id FROM vets WHERE name = 'William Tatcher'),
 '2020-08-10'
),
(
 (SELECT id FROM animals WHERE name = 'Plantmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2021-04-07'
),
(
 (SELECT id FROM animals WHERE name = 'Squirtle'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 '2019-09-29'
),
(
 (SELECT id FROM animals WHERE name = 'Angemon'),
 (SELECT id FROM vets WHERE name = 'Jack Harkness'),
 '2020-10-03'
),
(
 (SELECT id FROM animals WHERE name = 'Angemon'),
 (SELECT id FROM vets WHERE name = 'Jack Harkness'),
 '2020-11-04'
),
(
 (SELECT id FROM animals WHERE name = 'Boarmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2019-01-24'
),
(
 (SELECT id FROM animals WHERE name = 'Boarmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2019-05-15'
),
(
 (SELECT id FROM animals WHERE name = 'Boarmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2020-02-27'
),
(
 (SELECT id FROM animals WHERE name = 'Boarmon'),
 (SELECT id FROM vets WHERE name = 'Maisy Smith'),
 '2020-08-03'
),
(
 (SELECT id FROM animals WHERE name = 'Blossom'),
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 '2020-05-24'
),
(
 (SELECT id FROM animals WHERE name = 'Blossom'),
 (SELECT id FROM vets WHERE name = 'William Tatcher'),
 '2021-01-11'
);


