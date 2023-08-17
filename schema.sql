/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

\c vet_clinic ;

CREATE TABLE animals(id INT GENERATED BY DEFAULT AS IDENTITY, name VARCHAR(30), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

alter table animals add column species varchar(30);

create table owners(id int generated by default as identity primary key, full_name varchar(30), age INT);

create table species(id int generated by default as identity primary key, name varchar(30));

alter table animals add constraint pk_animal primary key (id);

alter table  animals drop column species;

alter table animals add column species_id int references species(id);

alter table animals add column owner_id int references owners(id);

create table vets(id int generated by default as identity primary key, name varchar(30), age int, date_of_graduation date);

create table specializations(id int generated by default as identity primary key, species_id int, vet_id int, foreign key (species_id) references species(id), 
foreign key (vet_id) references vets(id));

create table visits(id int generated by default as identity primary key, animal_id int, vet_id int, foreign key (animal_id) references animals(id), 
foreign key (vet_id) references vets(id));

