/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

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


CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
   full_name    VARCHAR(255),
   age INT,
   PRIMARY KEY(id)      
);

CREATE TABLE species(
   id INT GENERATED ALWAYS AS IDENTITY,
   name    VARCHAR(255),
   PRIMARY KEY(id)      
);

ALTER TABLE animals
DROP COLUMN species,
ADD species_id INT,
ADD owner_id INT,
ADD CONSTRAINT fk_species 
    FOREIGN KEY(species_id)
     REFERENCES species(id)
      ON DELETE CASCADE,
ADD  CONSTRAINT fk_owner 
   FOREIGN KEY(owner_id)
    REFERENCES owners(id)
     ON DELETE CASCADE;


CREATE TABLE vets(
   id INT GENERATED ALWAYS AS IDENTITY,
   name    VARCHAR(255),
   age  INT,
   date_of_graduation DATE,
   PRIMARY KEY(id)      
);

CREATE TABLE specializations(
   species_id INT,
   vets_id INT,
  CONSTRAINT fk_spec 
    FOREIGN KEY(species_id)
     REFERENCES species(id)
      ON DELETE CASCADE,
  CONSTRAINT fk_vet 
   FOREIGN KEY(vets_id)
    REFERENCES vets(id)
     ON DELETE CASCADE     
);

CREATE TABLE visits(
   animals_id INT,
   vets_id INT,
   date_visited Date,
  CONSTRAINT fk_animals 
    FOREIGN KEY(animals_id)
     REFERENCES animals(id)
      ON DELETE CASCADE,
   CONSTRAINT fk_vets 
   FOREIGN KEY(vets_id)
    REFERENCES vets(id)
     ON DELETE CASCADE     
);

-- Alter the owners table by adding new column
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX email_asc On owners(email ASC);
CREATE INDEX animals_id_asc on visits(animals_id ASC);
CREATE INDEX vet_id_indexing on visits(vet_id asc);