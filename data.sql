/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '3-FEB-2020', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '15-NOV-2018', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '7-JAN-2021', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '12-MAY-2017', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '08-FEB-2020', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '15-NOV-2021', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '02-APR-1993', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '12-JUN-2005', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '07-JUN-2005', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '13-OCT-1998', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '14-MAY-2022', 4, true, 22);

INSERT INTO owners (full_name, age)
	VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
	VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
	VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
	VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
	VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
	VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
	VALUES ('Pokemon');
INSERT INTO species (name)
	VALUES ('Digimon');

UPDATE  animals SET species_id = 
	(SELECT id FROM species WHERE name = 'Digimon')
	WHERE name LIKE '%mon';

UPDATE  animals SET species_id = 
	(SELECT id FROM species WHERE name = 'Pokemon')
	WHERE species_id IS NULL;

UPDATE  animals SET species_id = 
	(SELECT id FROM species WHERE name = 'Digimon')
	WHERE name LIKE '%mon';

UPDATE  animals SET species_id = 
	(SELECT id FROM species WHERE name = 'Pokemon')
	WHERE species_id IS NULL;
	
UPDATE  animals SET owner_id = 
	(SELECT id FROM owners WHERE full_name = 'Sam Smith')
	WHERE name = 'Agumon';

UPDATE  animals SET owner_id = 
	(SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
	WHERE name IN ('Gabumon', 'Pikachu');

UPDATE  animals SET owner_id = 
	(SELECT id FROM owners WHERE full_name = 'Bob ')
	WHERE name IN ('Devimon', 'Plantmon');

UPDATE  animals SET owner_id = 
	(SELECT id FROM owners WHERE full_name = 'Melody Pond ')
	WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE  animals SET owner_id = 
	(SELECT id FROM owners WHERE full_name = 'Dean Winchester')
	WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '23-APR-2000');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Maisy Smith', 26, '17-JAN-2019');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Stephanie Mendez', 64, '14-MAY-1981');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Jack Harkness', 38, '08-JUN-2008');

INSERT INTO specializations (species_id, vet_id)
	VALUES (
		(SELECT id FROM species WHERE name = 'Pokemon'),
		( SELECT id FROM vets WHERE name = 'William Tatcher')
	);

INSERT INTO 
  specializations
    (species_id, vet_id)
  VALUES 
    (
      ( SELECT id FROM species WHERE name = 'Pokemon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    ),
    (
      ( SELECT id FROM species WHERE name = 'Digimon'),
		  ( SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    );

INSERT INTO specializations (species_id, vet_id)
	VALUES (
		(SELECT id FROM species WHERE name = 'Digimon'),
		( SELECT id FROM vets WHERE name = 'Jack Harkness')
	);

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Agumon'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '24-MAY-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Agumon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '22-JUL-2020'
    );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Gabumon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '02-FEB-2021'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '05-JAN-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '08-MAR-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '14-MAY-2020'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Devimon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '04-MAY-2021'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Charmander'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '24-FEB-2021'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '21-DEC-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '10-AUG-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '07-APR-2021'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Squirtle'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '29-SEP-2019'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Angemon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '03-OCT-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Angemon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '04-NOV-2020'
    );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '24-JAN-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '15-MAY-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '27-FEB-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '03-AUG-2020'
   );

INSERT INTO visits (animals_id, vet_id,  date_of_visit)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Blossom'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '24-MAY-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Blossom'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '11-JAN-2021'
    );

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);