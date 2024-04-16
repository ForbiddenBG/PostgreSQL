CREATE TABLE minions_birthdays(
	id serial PRIMARY KEY,
	name VARCHAR(50) Not NULL,
	date_of_birth date NOT NULL,
	age integer NOT NULL,
	present VARCHAR(100),
	party timestamptz NOT NULL
);