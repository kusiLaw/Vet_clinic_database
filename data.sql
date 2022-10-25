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