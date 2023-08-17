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


select * from animals join owners on animals.owner_id = owners.id where full_name = 'Melody Pond';

select * from animals join species on animals.species_id = species.id where species.name = 'Pokemon';

select * from animals full join owners on animals.owner_id = owners.id;

select species_id, species.name, count(species_id) from animals join species on animals.species_id = species.id group by species_id, species.name;

select * from animals join species on animals.species_id = species.id                         
join owners on animals.owner_id = owners.id where species.name = 'Digimon' and full_name = 'Jennifer Orwell';

select * from animals join owners on animals.owner_id = owners.id
where full_name = 'Dean Winchester' and escape_attempts = 0;

select full_name, count(owner_id) from animals join owners on animals.owner_id = owners.id group by full_name order by count desc limit 1;


select animals.name, vets.name, visited_date from animals join visits on animals.id = visits.animal_id 
join vets on visits.vet_id = vets.id  where vets.name = 'William Tatcher' order by visited_date desc limit 1;

select vets.name, count(distinct animals.id) as how_many  from animals join visits on animals.id = visits.animal_id
join vets on visits.vet_id = vets.id where vets.name='Stephanie Mendez' group by vets.name;

select vets.name, species.name from vets full join specializations s on vets.id = s.vet_id
full join species on species.id = s.species_id;

select a.name, vi.visited_date, ve.name as vet_name from animals a join visits vi on a.id = vi.animal_id
join vets ve on ve.id = vi.vet_id where visited_date between '2020-04-01' and '2020-08-30' and ve.name = 'Stephanie Mendez';

select a.name,count(a.name) visits from animals a join visits vi on a.id = vi.animal_id 
join vets ve on ve.id = vi.vet_id group by a.name order by visits desc limit 1;

select a.name, visited_date, ve.name as vet_name from animals a join visits vi on a.id = vi.animal_id
join vets ve on ve.id = vi.vet_id where ve.name = 'Maisy Smith' order by visited_date limit 1;

select a.name, date_of_birth, escape_attempts, neutered, weight_kg,s.name as specie, visited_date, 
ve.name as vet_name, age, date_of_graduation from animals a join species s on a.species_id = s.id
join visits vi on vi.animal_id = a.id
join vets ve on ve.id = vi.vet_id order by visited_date desc limit 1;

select count(visited_date) as non_specialist_visit from vets ve left join specializations z on ve.id = z.vet_id
left join species s on s.id = z.species_id
join visits vi on vi.vet_id = ve.id 
join animals a on a.id = vi.animal_id where (s.name = 'Pokemon' and a.name like '%mon')
or (s.name = 'Digimon' and a.name not like '%mon') or (s.name is null);

select s.name as specie, count(s.name)  from vets ve join visits vi on ve.id = vi.vet_id
join animals a on a.id = vi.animal_id
join species s on s.id = a.species_id where ve.name='Maisy Smith' group by s.name order by count desc limit 1;
