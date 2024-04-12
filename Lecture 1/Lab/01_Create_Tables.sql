CREATE TABLE employees(
	id serial PRIMARY KEY Not NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(50),
	hiring_date date DEFAULT '2023-01-01',
	salary numeric(10,2),
	devices_number integer
);

CREATE TABLE departments(
	id serial PRIMARY KEY Not NULL,
	name VARCHAR(50),
	code character(3),
	description text
);

CREATE TABLE issues(
	id serial PRIMARY KEY UNIQUE,
	description VARCHAR(150),
	"date" date,
	start timestamp
);