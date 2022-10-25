/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals

CREATE TABLE animals(
   id INT GENERATED ALWAYS AS IDENTITY,
   name    VARCHAR(100),
   species VARCHAR(100),
   date_of_birth  DATE,
   escape_attempts INT,
   neutered  BOOL,
   weight_kg DECIMAL,
   PRIMARY KEY(id)      
);

