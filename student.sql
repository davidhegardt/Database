CREATE SCHEMA ladok;
SET search_path = ladok, public, pg_catalog;

CREATE TABLE postort (
  postnr  CHAR(5),
  postort  VARCHAR(20) NOT NULL,
CONSTRAINT postort_pk PRIMARY KEY(postnr));

CREATE TABLE nyapostorter (
  postnr  CHAR(5),
  postort  VARCHAR(20) NOT NULL,
CONSTRAINT nyapostorter_pk PRIMARY KEY(postnr));

CREATE TABLE student (
  portalid  CHAR(8),
  "födelsedatum"  DATE,
  "förnamn"  VARCHAR(20) NOT NULL,
  efternamn  VARCHAR(30) NOT NULL,
  adress  VARCHAR(30),
  postnr  CHAR(5),
CONSTRAINT student_pk PRIMARY KEY(portalid),
CONSTRAINT student_fk FOREIGN KEY(postnr) REFERENCES postort(postnr));

CREATE TABLE kurs (
  kurskod  CHAR(6),
  namn  VARCHAR(45) NOT NULL,
  hp  NUMERIC(3,1) NOT NULL DEFAULT 7.5,
CONSTRAINT kurs_pk PRIMARY KEY(kurskod),
CONSTRAINT kurs_un UNIQUE(namn));

CREATE TABLE betyg (
  portalid  CHAR(8),
  kurskod  CHAR(6),
  "år"  CHAR(4),
  betyg  INTEGER,
CONSTRAINT betyg_pk PRIMARY KEY(portalid, kurskod),
CONSTRAINT betyg_fk1 FOREIGN KEY(portalid) REFERENCES student(portalid),
CONSTRAINT betyg_fk2 FOREIGN KEY(kurskod) REFERENCES kurs(kurskod));

INSERT INTO postort VALUES('83140','Östersund');
INSERT INTO postort VALUES('83432','Brunflo');
INSERT INTO postort VALUES('89597','Skorped');
INSERT INTO postort VALUES('83172','Östersund');
INSERT INTO postort VALUES('83141','Östersund');
INSERT INTO postort VALUES('83191','Östersund');
INSERT INTO postort VALUES('80627','Gävle');
INSERT INTO postort VALUES('83145','Östersund');
INSERT INTO postort VALUES('21365','Malmö');
INSERT INTO postort VALUES('83136','Östersund');
INSERT INTO postort VALUES('11577','Stockholm');
INSERT INTO postort VALUES('62192','Visby');
INSERT INTO postort VALUES('41871','Göteborg');
INSERT INTO postort VALUES('79331','Leksand');
INSERT INTO postort VALUES('83183','Östersund');
INSERT INTO postort VALUES('37292','Kallinge');

INSERT INTO nyapostorter VALUES('59055','Sturefors');
INSERT INTO nyapostorter VALUES('47550','Hälsö');
INSERT INTO nyapostorter VALUES('11577','Stockholm');

INSERT INTO student VALUES('bean1100','1970-10-10','Bertil','Andersson','Stubbvägen 1','83172');
INSERT INTO student VALUES('sasv1010','1985-06-06','Sara','Svensson','Blomstigen 2','83432');
INSERT INTO student VALUES('kama1203','1980-12-12','Karl','Martinsson','Faktorsvägen 13','89597');
INSERT INTO student VALUES('anan0912','1995-05-05','Anna','Andersson','Splintvägen 5','83172');

INSERT INTO kurs VALUES('DT013G','Datavetenskaplig introduktionskurs', 7.5);
INSERT INTO kurs VALUES('DT011G','Operativsystem introduktionskurs',7.5);
INSERT INTO kurs VALUES('DT062G','Java för C++ programmerare',7.5);
INSERT INTO kurs VALUES('DT022G','Databaser, introduktion',7.5);
INSERT INTO kurs VALUES('DT076G','Databaser, implementering och modellering',7.5);
INSERT INTO kurs VALUES('DT031G','Applikationsutveckling för Android',7.5);
INSERT INTO kurs VALUES('DT006G','Java I',7.5);
INSERT INTO kurs VALUES('DT007G','Java II',7.5);
INSERT INTO kurs VALUES('MA072G','Tillämpad matematik',7.5);
INSERT INTO kurs VALUES('DT099G','Examensarbete',15);

INSERT INTO betyg VALUES('bean1100','DT022G','2012',1);
INSERT INTO betyg VALUES('bean1100','DT011G','2011',2);
INSERT INTO betyg VALUES('bean1100','DT076G','2012',4);
INSERT INTO betyg VALUES('sasv1010','DT022G','2012',4);
INSERT INTO betyg VALUES('sasv1010','DT011G','2012',2);
INSERT INTO betyg VALUES('kama1203','DT022G','2012',NULL);

SET search_path = public, ladok, pg_catalog;