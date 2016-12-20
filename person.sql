CREATE TABLE person (
id SERIAL,
name VARCHAR(20) NOT NULL,
CONSTRAINT person_pk PRIMARY KEY (id)
);

INSERT INTO person(name) VALUES('Pelle');
INSERT INTO person(name) VALUES('Patrik');
INSERT INTO person(name) VALUES('Sara');