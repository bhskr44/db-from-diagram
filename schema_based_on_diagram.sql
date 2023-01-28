-- Create table animals
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight FLOAT NOT NULL,
    species_id INTEGER REFERENCES species(id)
);

-- Create Table species
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    vaccineRequired BOOLEAN NOT NULL
);


-- Create table owners
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    animal_id INTEGER REFERENCES animals(id)
);

-- Create table employee
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    designation VARCHAR(255) NOT NULL,
    doj DATE NOT NULL
);

-- Create table visits
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    animal_id INTEGER REFERENCES animals(id),
    employee_id INTEGER REFERENCES employee(id),
    owner_id INTEGER REFERENCES owners(id)
);
