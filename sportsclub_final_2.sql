CREATE SCHEMA sportsclub;
SET search_path = sportsclub, public, pg_catalog;

CREATE TABLE person (
  personID SERIAL,
  förnamn  TEXT NOT NULL,
  efternamn TEXT NOT NULL,
  gatuaddress TEXT NOT NULL,
  postnr CHAR(5) NOT NULL,
  postort TEXT NOT NULL,
  epost TEXT NOT NULL UNIQUE,
  lösenord CHAR(32),
CONSTRAINT person_pk PRIMARY KEY(personID));


CREATE TABLE administratör (
  personID INT,
  arvode INT NOT NULL,
  CONSTRAINT administratör_pk PRIMARY KEY(personID),
  CONSTRAINT administratör_fk FOREIGN KEY(personID) REFERENCES person(personID));

CREATE TABLE medlem (
  personID INT,
  medlemsnr SERIAL NOT NULL,
  datum_medlem DATE NOT NULL,
  CONSTRAINT medlem_pk PRIMARY KEY(personID),
  CONSTRAINT medlem_fk FOREIGN KEY(personID) REFERENCES person(personID));

CREATE TABLE sektion (
  sektionsNamn TEXT NOT NULL,
  beskrivning TEXT NOT NULL,
  datum_bildat DATE NOT NULL,
CONSTRAINT sektion_pk PRIMARY KEY(sektionsNamn));

CREATE TABLE ledare (
  personID INT,
  utbildning TEXT,
  sektionsNamn TEXT NOT NULL,  
  CONSTRAINT ledare_pk PRIMARY KEY(personID),
  CONSTRAINT ledare_fk FOREIGN KEY(sektionsNamn) REFERENCES sektion(sektionsNamn),
  CONSTRAINT ledare_fk2 FOREIGN KEY(personID) REFERENCES medlem(personID));

CREATE TABLE inloggning (
  sessionID SERIAL,
  ip_number TEXT NOT NULL,
  tidpunkt TIMESTAMP NOT NULL,
  lyckad  BOOLEAN NOT NULL,
  personID int,
CONSTRAINT inloggning_pk PRIMARY KEY(sessionID),
CONSTRAINT inloggning_fk1 FOREIGN KEY(personID) REFERENCES person(personID));




CREATE TABLE nyhet (
  artikelID SERIAL,
  rubrik TEXT NOT NULL,
  innehåll TEXT NOT NULL,
  datum_skapad TIMESTAMP DEFAULT now(),
  datum_från TIMESTAMP DEFAULT '-infinity',
  datum_till TIMESTAMP DEFAULT 'infinity',
  sessionID SERIAL,
  personID SERIAL,
  sektionsNamn TEXT NOT NULL,
CONSTRAINT nyhet_pk PRIMARY KEY(artikelID),
CONSTRAINT nyhet_fk FOREIGN KEY(sessionID) REFERENCES inloggning(sessionID),
CONSTRAINT nyhet_fk2 FOREIGN KEY(personID) REFERENCES ledare(personID),
CONSTRAINT nyhet_fk3 FOREIGN KEY(sektionsNamn) REFERENCES sektion(sektionsNamn));



CREATE TABLE årsavgift (
  årsAvgift INT NOT NULL,
  år CHAR(4) NOT NULL UNIQUE,
CONSTRAINT år_pk PRIMARY KEY(årsavgift));

CREATE TABLE betald (
  personID SERIAL REFERENCES medlem(PersonID),
  årsAvgift INT NOT NULL REFERENCES årsavgift(årsAvgift),
  årtal CHAR(4) NOT NULL UNIQUE,
  betalningsdag DATE,
  betald BOOL,
CONSTRAINT betald_pk PRIMARY KEY(personID,årsAvgift));


CREATE TABLE medlemsregister (
  personID SERIAL REFERENCES medlem(personID),
  sektionsNamn TEXT REFERENCES sektion(sektionsNamn),
CONSTRAINT medlemsregister_pk PRIMARY KEY (personID,sektionsNamn));




SET search_path = public, sportsclub, pg_catalog;