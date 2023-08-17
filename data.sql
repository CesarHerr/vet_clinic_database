/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23), 
('Gabumon', '2018-11-15', 2, TRUE, 8), 
('Pikachu', '2021-01-07', 1, FALSE, 15.04), 
('Devimon', '2017-05-12', 5, TRUE, 11);

insert into animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
values('charmander', '2020-02-08', -11, false, 0),
('Plantmon', '2021-11-15', -5.7, true, 2),
('Squirtle', '1993-04-02', -12.13, false, 3),
('Angemon', '2005-06-12', -45, true, 1),
('Boarmon', '2005-06-07', 20.4, true, 7),
('Blossom', '1998-10-13', 17, true, 3),
('Ditto', '2022-05-14', 22, true, 4);

insert into owners(full_name, age) values('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

insert into species(name) values('Pokemon'), ('Digimon');

Update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';

Update animals set species_id = (select id from species where name = 'Pokemon') where name NOT like '%mon';

update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Agumon';

update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') where name = 'Gabumon' or name = 'Pikachu';

update animals set owner_id = (select id from owners where full_name = 'Bob') where name = 'Devimon' or name = 'Plantmon';

update animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';

update animals set owner_id = (select id from owners where full_name = 'Dean Winchester') where name = 'Angemon' or name = 'Boarmon';


insert into vets(name, age, date_of_graduation) values('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08')

insert into specializations(species_id, vet_id) values((select id from species where name = 'Pokemon'), (select id from vets where name = 'William Tatcher'));

insert into specializations(species_id, vet_id) values((select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez'));

insert into specializations(species_id, vet_id) values((select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez'));

insert into specializations(species_id, vet_id) values((select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));


insert into visits(animal_id, vet_id, visited_date) values(
(select id from animals where name = 'Agumon'),(select id from vets where name= 'William Tatcher'),'2020-05-24'),
((select id from animals where name = 'Agumon'),(select id from vets where name= 'Stephanie Mendez'),'2020-07-22'),
((select id from animals where name = 'Gabumon'),(select id from vets where name= 'Jack Harkness'),'2021-02-02'),
((select id from animals where name = 'Pikachu'),(select id from vets where name= 'Maisy Smith'),'2020-01-05'),
((select id from animals where name = 'Pikachu'),(select id from vets where name= 'Maisy Smith'),'2020-03-08'),
((select id from animals where name = 'Pikachu'),(select id from vets where name= 'Maisy Smith'),'2020-05-14'),
((select id from animals where name = 'Devimon'),(select id from vets where name= 'Stephanie Mendez'),'2021-05-04'),
((select id from animals where name = 'Charmander'),(select id from vets where name= 'Jack Harkness'),'2021-02-24'),
((select id from animals where name = 'Plantmon'),(select id from vets where name= 'Maisy Smith'),'2019-12-21'),
((select id from animals where name = 'Plantmon'),(select id from vets where name= 'William Tatcher'),'2020-08-10'),
((select id from animals where name = 'Plantmon'),(select id from vets where name= 'Maisy Smith'),'2021-04-07'),
((select id from animals where name = 'Squirtle'),(select id from vets where name= 'Stephanie Mendez'),'2019-09-29'),
((select id from animals where name = 'Angemon'),(select id from vets where name= 'Jack Harkness'),'2020-10-03'),
((select id from animals where name = 'Angemon'),(select id from vets where name= 'Jack Harkness'),'2020-11-04'),
((select id from animals where name = 'Boarmon'),(select id from vets where name= 'Maisy Smith'),'2019-01-24'),
((select id from animals where name = 'Boarmon'),(select id from vets where name= 'Maisy Smith'),'2019-05-15'),
((select id from animals where name = 'Boarmon'),(select id from vets where name= 'Maisy Smith'),'2020-02-27'),
((select id from animals where name = 'Boarmon'),(select id from vets where name= 'Maisy Smith'),'2020-08-03'),
((select id from animals where name = 'Blossom'),(select id from vets where name= 'Stephanie Mendez'),'2020-05-24'),
((select id from animals where name = 'Blossom'),(select id from vets where name= 'William Tatcher'),'2021-01-11');