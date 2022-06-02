/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

ALTER TABLE animals 
	ADD species varchar(255);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL	
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT, 
	ADD CONSTRAINT fk_species
	FOREIGN KEY (species_id)
	REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT, 
	ADD CONSTRAINT fk_owner
	FOREIGN KEY (owner_id)
	REFERENCES owners (id);

CREATE TABLE vets (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	age INT,
	date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
	species_id INT NOT NULL,
	vet_id INT NOT NULL,
	FOREIGN KEY (species_id) REFERENCES species (id),
	FOREIGN KEY (vet_id) REFERENCES vets (id)	
);

CREATE TABLE visits (
	animals_id INT NOT NULL,
	vet_id INT NOT NULL,
	date_of_visit DATE NOT NULL,
	FOREIGN KEY (animals_id) REFERENCES animals (id),
	FOREIGN KEY (vet_id) REFERENCES vets (id)	
);
