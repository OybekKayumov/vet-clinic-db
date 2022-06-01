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
