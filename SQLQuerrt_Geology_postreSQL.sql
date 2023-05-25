--CREATE DATABASE Geology;

--CREATE SCHEMA "geo";

CREATE TABLE geo.Eon            --Tabela EON
(
id_eon INTEGER PRIMARY KEY,
nazwa_eon VARCHAR(50) NOT NULL
);


CREATE TABLE geo.Era            --Tabela ERA
(
id_era INTEGER  PRIMARY KEY,
id_eon INTEGER REFERENCES geo.Eon(id_eon),
nazwa_era VARCHAR(50) NOT NULL
);

CREATE TABLE geo.Okres          --Tabela OKRES
(
id_okres INTEGER NOT NULL PRIMARY KEY,
id_era INTEGER REFERENCES geo.Era(id_era),
nazwa_okres VARCHAR(50) NOT NULL
);



CREATE TABLE geo.Epoka          --Tabela EPOKA
(
id_epoka INTEGER PRIMARY KEY,
id_okres INTEGER REFERENCES geo.Okres(id_okres),
nazwa_epoka VARCHAR(50) NOT NULL
);

CREATE TABLE geo.Pietro         --Tabela PIETRO
(
id_pietro INTEGER NOT NULL PRIMARY KEY,
id_epoka INTEGER REFERENCES geo.Epoka(id_epoka),
nazwa_pietro VARCHAR(50)
);

--Wpisujemy do tabeli odpowiednie zmienne; idziemy od najstarszych okresów
--Eon
INSERT INTO geo.Eon VALUES(1, 'Fanerozoik');
--

--Era
INSERT INTO geo.Era VALUES(1, 1, 'Paleozoik');
INSERT INTO geo.Era VALUES(2, 1, 'Mezozoik');
INSERT INTO geo.Era VALUES(3, 1, 'Kenozoik');
--

--Okres

--PALEOZOIK
INSERT INTO geo.Okres VALUES(1,1, 'Kambr');
INSERT INTO geo.Okres VALUES(2,1, 'Ordownik');
INSERT INTO geo.Okres VALUES(3,1, 'Sylur');
INSERT INTO geo.Okres VALUES(4,1, 'Dewon');
INSERT INTO geo.Okres VALUES(5,1, 'Karbon');
INSERT INTO geo.Okres VALUES(6,1, 'Perm');

--MEZOZOIK
INSERT INTO geo.Okres VALUES(7,2, 'Trias');
INSERT INTO geo.Okres VALUES(8,2, 'Jura');
INSERT INTO geo.Okres VALUES(9,2, 'Kreda');

--KENOZOIK
INSERT INTO geo.Okres VALUES(10,3, 'Paleogen');
INSERT INTO geo.Okres VALUES(11,3, 'Neogen');
INSERT INTO geo.Okres VALUES(12,3, 'Czwartorzęd');
--

--Epoka

--KAMBR
INSERT INTO geo.Epoka VALUES(1,1, 'Terenew');
INSERT INTO geo.Epoka VALUES(2,1, 'Oddzial 2');
INSERT INTO geo.Epoka VALUES(3,1, 'Miaoling');
INSERT INTO geo.Epoka VALUES(4,1, 'Furong');

--ORDOWNIK
INSERT INTO geo.Epoka VALUES(5,2, 'Ordownik wczesny');
INSERT INTO geo.Epoka VALUES(6,2, 'Ordownik srodkowy');
INSERT INTO geo.Epoka VALUES(7,2, 'Ordownik pozny');

--SYLUR
INSERT INTO geo.Epoka VALUES(8,3, 'Landower');
INSERT INTO geo.Epoka VALUES(9,3, 'Wenlok');
INSERT INTO geo.Epoka VALUES(10,3, 'Ludlow');
INSERT INTO geo.Epoka VALUES(11,3, 'Przydol');

--DEWON
INSERT INTO geo.Epoka VALUES(12,4, 'Wczesny dewon');
INSERT INTO geo.Epoka VALUES(13,4, 'Srodkowy dewon');
INSERT INTO geo.Epoka VALUES(14,4, 'Pozny srodkowy');

--KARBON
INSERT INTO geo.Epoka VALUES(15,5, 'Missisip');
INSERT INTO geo.Epoka VALUES(16,5, 'Pensylwan');

--PERM
INSERT INTO geo.Epoka VALUES(17,6, 'Cisural');
INSERT INTO geo.Epoka VALUES(18,6, 'Gwadalup');
INSERT INTO geo.Epoka VALUES(19,6, 'Loping');

--TRIAS
INSERT INTO geo.Epoka VALUES(20,7, 'Wczesny trias');
INSERT INTO geo.Epoka VALUES(21,7, 'Srodkowy trias');
INSERT INTO geo.Epoka VALUES(22,7, 'Pozny trias');

--JURA
INSERT INTO geo.Epoka VALUES(23,8, 'Jura wczesna');
INSERT INTO geo.Epoka VALUES(24,8, 'Jura srodkowa');
INSERT INTO geo.Epoka VALUES(25,8, 'Jura pozna');

--KREDA
INSERT INTO geo.Epoka VALUES(26,9, 'Wczesna kreda');
INSERT INTO geo.Epoka VALUES(27,9, 'Pozna kreda');

--PALEOGEN
INSERT INTO geo.Epoka VALUES(28,10, 'Paleocen');
INSERT INTO geo.Epoka VALUES(29,10, 'Eocen');
INSERT INTO geo.Epoka VALUES(30,10, 'Oligocen');

--NEOGEN
INSERT INTO geo.Epoka VALUES(31,11, 'Miocen');
INSERT INTO geo.Epoka VALUES(32,11, 'Pliocen');

--CZWARTORZED
INSERT INTO geo.Epoka VALUES(33,12, 'Plejstocen');
INSERT INTO geo.Epoka VALUES(34,12, 'Holocen');


--Pietra
--TERENEW
INSERT INTO geo.Pietro VALUES(1,1,'Fortun');
INSERT INTO geo.Pietro VALUES(2,1,'Pietro 2');

--ODDZIAŁ 2
INSERT INTO geo.Pietro VALUES(3,2,'Pietro 3');
INSERT INTO geo.Pietro VALUES(4,2,'Pietro 4');

--MIAOLING
INSERT INTO geo.Pietro VALUES(5,3,'Wuliuan');
INSERT INTO geo.Pietro VALUES(6,3,'Drum');
INSERT INTO geo.Pietro VALUES(7,3,'Guzang');

--FURONG
INSERT INTO geo.Pietro VALUES(8,4,'Paib');
INSERT INTO geo.Pietro VALUES(9,4,'Dziangszan');
INSERT INTO geo.Pietro VALUES(10,4,'Pietro 10');

--ORDOWNIK WCZESNY
INSERT INTO geo.Pietro VALUES(11,5,'Tremadok');
INSERT INTO geo.Pietro VALUES(12,5,'Flo');

--ORDOWNIK SRODKOWY
INSERT INTO geo.Pietro VALUES(13,6,'Daping');
INSERT INTO geo.Pietro VALUES(14,6,'Darriwil');

--ORDOWNIK POZNY
INSERT INTO geo.Pietro VALUES(15,7,'Sandb');
INSERT INTO geo.Pietro VALUES(16,7,'Kat');
INSERT INTO geo.Pietro VALUES(17,7,'Hirnant');

--Landower
INSERT INTO geo.Pietro VALUES(18,8,'Ruddan');
INSERT INTO geo.Pietro VALUES(19,8,'Aeron');
INSERT INTO geo.Pietro VALUES(20,8,'Telicz');

--WENLOK
INSERT INTO geo.Pietro VALUES(21,9,'Szejnwud');
INSERT INTO geo.Pietro VALUES(22,9,'Homer');

--LUDLOW
INSERT INTO geo.Pietro VALUES(23,10,'Gorst');
INSERT INTO geo.Pietro VALUES(24,10,'Ludford');

--PRZYDOL
INSERT INTO geo.Pietro VALUES(25,11,'');
--WCZESNY DEWON
INSERT INTO geo.Pietro VALUES(26,12,'Lochkow');
INSERT INTO geo.Pietro VALUES(27,12,'Prag');
INSERT INTO geo.Pietro VALUES(28,12,'Ems');

--SRODKOWY DEWON
INSERT INTO geo.Pietro VALUES(29,13,'Eifel');
INSERT INTO geo.Pietro VALUES(30,13,'Zywet');

--POZNY DEWON
INSERT INTO geo.Pietro VALUES(31,14,'Fran');
INSERT INTO geo.Pietro VALUES(32,14,'Famen');
--MISSISIP
INSERT INTO geo.Pietro VALUES(33,15,'Turnej');
INSERT INTO geo.Pietro VALUES(34,15,'Wizen');
INSERT INTO geo.Pietro VALUES(35,15,'Serpuchow');
--PENSYLWAN
INSERT INTO geo.Pietro VALUES(36,16,'Baszkir');
INSERT INTO geo.Pietro VALUES(37,16,'Moskow');
INSERT INTO geo.Pietro VALUES(38,16,'Kasimow');
INSERT INTO geo.Pietro VALUES(39,16,'Gzel');

--CISURAL
INSERT INTO geo.Pietro VALUES(40,17,'Assel');
INSERT INTO geo.Pietro VALUES(41,17,'Sakmar');
INSERT INTO geo.Pietro VALUES(42,17,'Artinsk');
INSERT INTO geo.Pietro VALUES(43,17,'Kungur');
--GWADALUP
INSERT INTO geo.Pietro VALUES(44,18,'Road');
INSERT INTO geo.Pietro VALUES(45,18,'Word');
INSERT INTO geo.Pietro VALUES(46,18,'Kapitan');
--LOPING
INSERT INTO geo.Pietro VALUES(47,19,'Wucziaping');
INSERT INTO geo.Pietro VALUES(48,19,'Czangsing');
--WCZESNY TRIAS
INSERT INTO geo.Pietro VALUES(49,20,'Ind');
INSERT INTO geo.Pietro VALUES(50,20,'Olenek');
--SRODKOWY TRIAS
INSERT INTO geo.Pietro VALUES(51,21,'Anizyk');
INSERT INTO geo.Pietro VALUES(52,21,'Ladyn');
--POZNY TRIAS
INSERT INTO geo.Pietro VALUES(53,22,'Karnik');
INSERT INTO geo.Pietro VALUES(54,22,'Noryk');
INSERT INTO geo.Pietro VALUES(55,22,'Retyk');
--JURA WCZESNA
INSERT INTO geo.Pietro VALUES(56,23,'Hettang');
INSERT INTO geo.Pietro VALUES(57,23,'Synemur');
INSERT INTO geo.Pietro VALUES(58,23,'Pliensbach');
INSERT INTO geo.Pietro VALUES(59,23,'Toark');
--JURA SRODKOWA
INSERT INTO geo.Pietro VALUES(60,24,'Aalen');
INSERT INTO geo.Pietro VALUES(61,24,'Bajos');
INSERT INTO geo.Pietro VALUES(62,24,'Baton');
INSERT INTO geo.Pietro VALUES(63,24,'Kelowej');

--JURA POZNA
INSERT INTO geo.Pietro VALUES(64,25,'Oksford');
INSERT INTO geo.Pietro VALUES(65,25,'Kimeryd');
INSERT INTO geo.Pietro VALUES(66,25,'Tyton');
--WCZESNA KREDA
INSERT INTO geo.Pietro VALUES(67,26,'Berrias');
INSERT INTO geo.Pietro VALUES(68,26,'Walanzyn');
INSERT INTO geo.Pietro VALUES(69,26,'Hoteryw');
INSERT INTO geo.Pietro VALUES(70,26,'Barrem');
INSERT INTO geo.Pietro VALUES(71,26,'Apt');
INSERT INTO geo.Pietro VALUES(72,26,'Alb');
--POZNA KREDA
INSERT INTO geo.Pietro VALUES(73,27,'Cenoman');
INSERT INTO geo.Pietro VALUES(74,27,'Turon');
INSERT INTO geo.Pietro VALUES(75,27,'Koniak');
INSERT INTO geo.Pietro VALUES(76,27,'Santon');
INSERT INTO geo.Pietro VALUES(77,27,'Kampan');
INSERT INTO geo.Pietro VALUES(78,27,'Mastrycht');

--PALEOCEN
INSERT INTO geo.Pietro VALUES(79,28,'Dan');
INSERT INTO geo.Pietro VALUES(80,28,'Zeland');
INSERT INTO geo.Pietro VALUES(81,28,'Tanet');
--EOCEN
INSERT INTO geo.Pietro VALUES(82,29,'Iprez');
INSERT INTO geo.Pietro VALUES(83,29,'Luten');
INSERT INTO geo.Pietro VALUES(84,29,'Barton');
INSERT INTO geo.Pietro VALUES(85,29,'Priabon');
--OLIGOCEN
INSERT INTO geo.Pietro VALUES(86,30,'Rupel');
INSERT INTO geo.Pietro VALUES(87,30,'Szat');
--MIOCEN
INSERT INTO geo.Pietro VALUES(88,31,'Akwitan');
INSERT INTO geo.Pietro VALUES(89,31,'Burdygal');
INSERT INTO geo.Pietro VALUES(90,31,'Lang');
INSERT INTO geo.Pietro VALUES(91,31,'Serrawal');
INSERT INTO geo.Pietro VALUES(92,31,'Torton');
INSERT INTO geo.Pietro VALUES(93,31,'Messyn');
--PLIOCEN
INSERT INTO geo.Pietro VALUES(94,32,'Zankl');
INSERT INTO geo.Pietro VALUES(95,32,'Piacent');
--PLEJSTOCEN
INSERT INTO geo.Pietro VALUES(96,33,'Gelas');
INSERT INTO geo.Pietro VALUES(97,33,'Kalabr');
INSERT INTO geo.Pietro VALUES(98,33,'Chiban');
INSERT INTO geo.Pietro VALUES(99,33,'Pozny');

--HOLOCEN
INSERT INTO geo.Pietro VALUES(100,34,'Grenland');
INSERT INTO geo.Pietro VALUES(101,34,'Northgrip');
INSERT INTO geo.Pietro VALUES(102,34,'Megalaj');
--

--Tworzenie Tablicy Zdenormalizowanej


CREATE TABLE GeoTabela AS (SELECT * FROM geo.Pietro NATURAL JOIN geo.Epoka NATURAL
JOIN geo.Okres NATURAL JOIN geo.Era NATURAL JOIN geo.Eon );

ALTER TABLE GeoTabela
ADD PRIMARY KEY (id_pietro);

--Tworzenie tabeli "dzisiec", zawierająca liczby 0-9

CREATE TABLE geo.Dziesiec(cyfra int);

INSERT INTO geo.Dziesiec VALUES(0);
INSERT INTO geo.Dziesiec VALUES(1);
INSERT INTO geo.Dziesiec VALUES(2);
INSERT INTO geo.Dziesiec VALUES(3);
INSERT INTO geo.Dziesiec VALUES(4);
INSERT INTO geo.Dziesiec VALUES(5);
INSERT INTO geo.Dziesiec VALUES(6);
INSERT INTO geo.Dziesiec VALUES(7);
INSERT INTO geo.Dziesiec VALUES(8);
INSERT INTO geo.Dziesiec VALUES(9);

--Tworzenie tabeli 'Milion'
SELECT
	a1.cyfra+10*a2.cyfra+100*a3.cyfra+1000*a4.cyfra+10000*a5.cyfra+100000*a6.cyfra AS liczba
INTO
	geo.milion
FROM
	geo.Dziesiec a1,
	geo.Dziesiec a2,
	geo.Dziesiec a3,
	geo.Dziesiec a4,
	geo.Dziesiec a5,
	geo.Dziesiec a6;


--I ZAPYTANIE
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON
(mod(Milion.liczba,102)=(GeoTabela.id_pietro));

--II ZAPYTANIE

SELECT COUNT(*) FROM Milion INNER JOIN geo.Pietro ON
(mod(Milion.liczba,102)=geo.Pietro.id_pietro) NATURAL JOIN geo.Epoka NATURAL JOIN
geo.Okres NATURAL JOIN geo.Era NATURAL JOIN geo.Eon;

--III ZAPYTANIE
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,102)=
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,102)=(id_pietro));

--IV ZAPYTANIE


SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 102 IN
(SELECT geo.Pietro.id_pietro FROM geo.Pietro
    NATURAL JOIN geo.Epoka
    NATURAL JOIN geo.Okres
    NATURAL JOIN geo.Era
    NATURAL JOIN geo.Eon);


--Tworzenie indexów

CREATE INDEX in_straeon_eon ON geo.Eon(id_eon);
CREATE INDEX in_straera_era ON geo.Era(id_era);
CREATE INDEX in_straera_eon ON geo.Era(id_eon);
CREATE INDEX in_straokres_okres ON geo.Okres(id_okres);
CREATE INDEX in_straokres_era ON geo.Okres(id_era);
CREATE INDEX in_straepoka_epoka ON geo.Epoka(id_epoka);
CREATE INDEX in_straepoka_okres ON geo.Epoka(id_okres);
CREATE INDEX in_strapietro_pietro ON geo.Pietro(id_pietro);
CREATE INDEX in_strapietro_epoka ON geo.Pietro(id_epoka);
CREATE INDEX in_stramilion ON milion(liczba);
CREATE INDEX in_geotabela_pietra ON GeoTabela(id_pietro);
CREATE INDEX in_geotabela_era ON GeoTabela(id_era);
CREATE INDEX in_geotabela_okres ON GeoTabela(id_okres);
CREATE INDEX in_geotabela_epoka ON GeoTabela(id_epoka);
CREATE INDEX in_geotabela_eon ON GeoTabela(id_eon);




