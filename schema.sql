/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

\c vet_clinic ;

CREATE TABLE animals(id INT GENERATED BY DEFAULT AS IDENTITY, name VARCHAR(30), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

