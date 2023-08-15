/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name Like '%mon';

SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


begin;

  update animals set species = 'unspecified';

  select * from animals;

rollback;


select * from animals;


begin;

  update animals set species = 'digimon' where name like '%mon';

  update animals set species = 'pokemon' where species is null;

  select * from animals;

commit;


select * from animals;


begin;

  delete from animals;

rollback;


select * from animals;


begin;

  delete from animals where date_of_birth > '2022-01-01';

  savepoint sp_animal;

  update animals set weight_kg = weight_kg * -1;

  rollback to sp_animal;

  update animals set weight_kg = weight_kg * -1 where weight_kg < 0;

commit;


select count(*) from animals;

select count(*) from animals where escape_attempts = 0;

select avg(weight_kg) from animals;

select neutered, sum(escape_attempts) from animals group by neutered; 

select species, min(weight_kg), max(weight_kg) from animals group by species;

select species, avg(escape_attempts) from animals where extract(year from date_of_birth) between 1990 and 2000 group by species;
