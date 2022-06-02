/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '31-12-2019';

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts  FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE NOT name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE  name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE  species IS NULL;
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-JAN-2022';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals 
	WHERE date_of_birth BETWEEN '01-JAN-1990' AND '31-DEC-2000' 
	GROUP BY species;

SELECT * FROM animals a INNER JOIN owners o
	ON a.owner_id = o.id
	WHERE o.full_name = 'Melody Pond ';

SELECT * FROM animals a INNER JOIN species s 
	ON a.species_id = s.id
	WHERE s.name = 'Pokemon';

SELECT o.full_name AS owner_name, a.name AS animal_name 
	FROM owners o LEFT JOIN animals a ON o.id= a.owner_id;

SELECT s.name, COUNT(*) FROM species s 
	LEFT JOIN animals a ON s.id= a.species_id
	GROUP BY s.name;

SELECT * FROM animals a INNER JOIN owners o 
	ON a.owner_id = o.id
	WHERE o.full_name = 'Jennifer Orwell'
	AND a.species_id = 
	(SELECT id FROM species WHERE name = 'Digimon');

SELECT a.name AS animal_name, a.escape_attempts, o.full_name AS owner_name
FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';

SELECT o.full_name, COUNT(*) 
	FROM owners o LEFT JOIN animals a 
	ON o.id= a.owner_id
	GROUP BY o.full_name
	ORDER BY COUNT DESC
	LIMIT 1;
	