SELECT * FROM sportsclub.medlem;
-- Medlemmar

INSERT INTO sportsclub.person VALUES(1,'Bosse','Bilman','Mekanikv 12','12345','Boden','bosse@mekanik.se','bosse12'); --1
INSERT INTO sportsclub.person VALUES(2,'Alex','Schulman','Stureplan 17','45321','Stockholm','alex.schulman@perfectday.se','pappa20'); -- 2
INSERT INTO sportsclub.person VALUES(3,'Sigvard','Eklund','Medis 14','33468','Stockholm','cigge@perfectday.se','flummarn'); --3
-- Administratörer
INSERT INTO sportsclub.person VALUES(4,'Malin','Eklund','Medis 14','33468','Stockholm','malin@jobbet.se','cigge'); --4
INSERT INTO sportsclub.person VALUES(5,'Karina','Berg','Ostplan 12','45332','Stockholm','karina.berg@luuk.se','bjorngus'); --5
INSERT INTO sportsclub.person VALUES(6,'David','Hellenius','Danderydsv 12','45218','Danderyd','david@baluba.se','kulkille'); --6
-- Medlemmar och ledare
INSERT INTO sportsclub.person VALUES(7,'Kristian','Luuk','Ostplan 12','45332','Stockholm','kristian.luuk@luuk.se','hatarbjorn'); --7
INSERT INTO sportsclub.person VALUES(8,'Bear','Grylls','Commonwealth 18','00021','Edinburgh','bear.grylls@survival.com','bearscare'); --8
INSERT INTO sportsclub.person VALUES(9,'Sylvester','Stallone','North Hollywood','02014','California','sly@stallone.com','rocky'); --9
INSERT INTO sportsclub.person VALUES(10,'Nikolai','Vostock','Trollvägen 14','12457','Perstorp','niko@gf.survival.com','putin'); --10

INSERT INTO sportsclub.medlem VALUES(1,10,'1978-03-05');
INSERT INTO sportsclub.medlem VALUES(2,11,'2005-04-06');
INSERT INTO sportsclub.medlem VALUES(3,12,'2001-01-12');
INSERT INTO sportsclub.medlem VALUES(7,13,'2001-01-12');
INSERT INTO sportsclub.medlem VALUES(8,14,'2001-01-12');
INSERT INTO sportsclub.medlem VALUES(9,15,'2001-01-12');
INSERT INTO sportsclub.medlem VALUES(10,16,'2001-01-12');

INSERT INTO sportsclub.administratör VALUES(4,12000);
INSERT INTO sportsclub.administratör VALUES(5,18000);
INSERT INTO sportsclub.administratör VALUES(6,27000);

INSERT INTO sportsclub.sektion VALUES('FK Survival','Football club for survivors and adventurers','1868-03-18');
INSERT INTO sportsclub.sektion VALUES('GF Survival','Gymnastikförening för strandsatta öbor','1910-02-05');
INSERT INTO sportsclub.sektion VALUES('HC USSR','Järnfemman 1985 Russki','1981-07-03');

INSERT INTO sportsclub.ledare VALUES(8,'Boy Scout survival training','FK Survival');
INSERT INTO sportsclub.ledare VALUES(9,'Vietnam survival training','GF Survival');
INSERT INTO sportsclub.ledare VALUES(10,'USSR Siberian training camp','HC USSR');

INSERT INTO sportsclub.inloggning VALUES('111111','192.168.1.0',current_timestamp,TRUE,1);
INSERT INTO sportsclub.inloggning VALUES('111112','192.168.3.5',current_timestamp,TRUE,8);
INSERT INTO sportsclub.inloggning VALUES('111113','192.168.7.4',current_timestamp,TRUE,9);
INSERT INTO sportsclub.inloggning VALUES('111114','201.3.7.4',current_timestamp,TRUE,10);

INSERT INTO sportsclub.nyhet VALUES(10,'Nya spikbollar','FK Survival får from måndag spikbollar i läder för träning','2012-03-02','2012-03-03','2018-01-01','111112',8,'FK Survival');
INSERT INTO sportsclub.nyhet VALUES(11,'Dags för träningsläger','GF Survival kommer att träna i colombias djungler under HT','2015-03-02','2016-05-03','2016-12-12','111113',9,'GF Survival');
INSERT INTO sportsclub.nyhet VALUES(12,'Russki training','Da comrad! Siberski training camp all winter, bring shorts','2002-03-02','2003-01-10','2016-12-12','111114',10,'HC USSR');

INSERT INTO sportsclub.medlemsregister VALUES(1,'GF Survival');
INSERT INTO sportsclub.medlemsregister VALUES(1,'FK Survival');
INSERT INTO sportsclub.medlemsregister VALUES(2,'FK Survival');
INSERT INTO sportsclub.medlemsregister VALUES(2,'HC USSR');
INSERT INTO sportsclub.medlemsregister VALUES(3,'GF Survival');
INSERT INTO sportsclub.medlemsregister VALUES(3,'HC USSR');
INSERT INTO sportsclub.medlemsregister VALUES(7,'GF Survival');
INSERT INTO sportsclub.medlemsregister VALUES(8,'FK Survival');
INSERT INTO sportsclub.medlemsregister VALUES(8,'HC USSR');
INSERT INTO sportsclub.medlemsregister VALUES(9,'GF Survival');
INSERT INTO sportsclub.medlemsregister VALUES(10,'HC USSR');

INSERT INTO sportsclub.årsavgift VALUES(3500,'2011');
INSERT INTO sportsclub.årsavgift VALUES(2400,'2012');
INSERT INTO sportsclub.årsavgift VALUES(3600,'2013');
INSERT INTO sportsclub.årsavgift VALUES(2800,'2014');
INSERT INTO sportsclub.årsavgift VALUES(4000,'2015');

INSERT INTO sportsclub.betald VALUES(1,3500,'2011','2013-12-30',TRUE);
INSERT INTO sportsclub.betald VALUES(7,2400,'2012','2009-12-30',TRUE);
INSERT INTO sportsclub.betald VALUES(2,3600,'2013',NULL,FALSE);
INSERT INTO sportsclub.betald VALUES(8,4000,'2015','2014-02-10',TRUE);

