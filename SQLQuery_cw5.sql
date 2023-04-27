USE firma;


CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (id_pracownika INT PRIMARY KEY, imie VARCHAR(50) NOT NULL, nazwisko VARCHAR(50) NOT NULL, adres VARCHAR(100) NOT NULL, telefon CHAR(9))
CREATE TABLE ksiegowosc.godziny (id_godziny INT PRIMARY KEY, data DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT NOT NULL, FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika))
CREATE TABLE ksiegowosc.pensja (id_pensji INT PRIMARY KEY, stanowisko VARCHAR(30) NOT NULL, kwota MONEY NOT NULL)
CREATE TABLE ksiegowosc.premia (id_premii INT PRIMARY KEY, rodzaj VARCHAR(30) NOT NULL, kwota MONEY NOT NULL)
CREATE TABLE ksiegowosc.wynagrodzenie (id_wynagrodzenia INT, data DATE, id_pracownika INT NOT NULL, id_godziny INT NOT NULL, id_pensji INT NOT NULL, id_premii INT, 
			FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
			FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
			FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
			FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii))

EXEC sp_addextendedproperty --komentarz tabeli pracownicy
@name = 'Opis dla tabeli "pracownicy"',
@value = 'Tabela zawieraj¹ca dane personalne pracowników',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'pracownicy';

EXEC sp_addextendedproperty --komentarz tabeli godziny
@name = 'Opis dla tabeli "godziny"',
@value = 'Tabela zawieraj¹ca inforamcje o wypracowanych godzinach przez pracowników',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'godziny';

EXEC sp_addextendedproperty --komentarz tabeli pensja
@name = 'Opis dla tabeli "pensja"',
@value = 'Tabela zawieraj¹ca inforamcje o pensjach',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'pensja';

EXEC sp_addextendedproperty --komentarz tabeli premia
@name = 'Opis dla tabeli "premia"',
@value = 'Tabela zawieraj¹ca inforamcje o premiach',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'premia';

EXEC sp_addextendedproperty --komentarz tabeli wynagrodzenie
@name = 'Opis dla tabeli "wynagrodzenie"',
@value = 'Tabela zawieraj¹ca inforamcje o wynagrodzeniach',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'wynagrodzenie';

INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (1,'Edward', 'Œmig³y-Rydz', 'Rumunia', '543455678');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (2,'Stefan', 'D¹b-Biernacki', 'Piotrków Trybunalski', '222313547');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (3,'Erwin', 'Rommel', 'Tobruk', '694202137');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (4,'Tadeusz', 'Piskor', 'Oflag VII A Murnau', '587456966');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (5,'W³adys³aw', 'Sikorski', 'Gibraltar', '789456123');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (6,'Józef', 'Unrug', 'Hel', '123456987');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (7,'Stanis³aw', 'Sosabowski', 'Arnhem', '852369741');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (8,'George', 'Patton', 'San Gabriel', '846513297');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (9,'Gieorgij ', '¯ukow', 'Moskwa', '555874123');
INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (10,'Szymon', 'Koziatek', 'Sztab Generalny', '723665898');

SELECT * FROM ksiegowosc.godziny;

INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (1, '2022-04-12', 10, 4);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (2, '2022-04-12', 6, 3);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (3, '2022-04-13', 7, 1);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (4, '2022-04-14', 4, 6);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (5, '2022-04-15', 6, 8);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (6, '2022-04-15', 7, 3);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (7, '2022-04-15', 8, 2);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (8, '2022-04-16', 5, 2);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (9, '2022-04-17', 6, 1);
INSERT INTO ksiegowosc.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (10, '2022-04-18', 7, 10);

INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (1, 'Socjalistyczna', 100);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (2, 'Komunistyczna', 50);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (3, 'Kapitalistyczna', 5000);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (4, 'Kwarta³owa', 250);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (5, 'Imperialna', 1000);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (6, 'Farmazonowa', 30);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (7, 'Krakowska', 0);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (8, 'Skibiañska', 230);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (9, 'Morawiecka', 546);
INSERT INTO ksiegowosc.premia (id_premii,rodzaj, kwota) VALUES (10, 'Strzelcowa', 900);

INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (1, 'Referent', 900);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (2, 'Rezerwowy', 2500);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (3, 'Pu³kownik', 4000);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (4, 'Kapitan', 4500);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (5, 'Porucznik', 4700);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (6, 'Major', 4750);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (7, 'Genera³ Brygady', 5000);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (8, 'Genera³ Dywizji', 5500);
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (9, 'Genera³ Armii', 6500 );
INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko, kwota ) VALUES (10, 'Marsza³ek', 10000 );

INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2022-05-12', 1, 3, 10, 3)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2, '2022-05-13', 3, 2, 9, 6)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3, '2022-05-13', 2, 6, 5, 6)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4, '2022-05-14', 5, 1, 6, NULL)--
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5, '2022-05-15', 6, 2, 9, 5)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6, '2022-05-16', 4, 8, 8, 3)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7, '2022-05-17', 7, 10, 1, NULL)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8, '2022-05-17', 8, 5, 4, 2)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9, '2022-05-18', 9, 4, 2, 3)
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10, '2022-05-19', 10, 7, 7, 3)


--a)
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b)
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy JOIN  ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika join ksiegowosc.pensja
ON wynagrodzenie.id_pensji=pensja.id_pensji WHERE kwota > 1000

--c)
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji=wynagrodzenie.id_pensji
LEFT JOIN ksiegowosc.premia ON wynagrodzenie.id_premii=premia.id_premii
WHERE wynagrodzenie.id_premii IS NULL AND pensja.kwota>2000;

--d)

SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'J%';

--e)

SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE '%n' AND pracownicy.nazwisko LIKE '%z%'; --%a %n%

--f)

SELECT imie, nazwisko FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.godziny ON godziny.id_godziny=wynagrodzenie.id_godziny
WHERE liczba_godzin > 5 --160

--g)

SELECT imie, nazwisko FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji=wynagrodzenie.id_pensji
WHERE pensja.kwota BETWEEN 1500 AND 3000;

--h)

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin, premia.kwota FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.premia ON premia.id_premii=wynagrodzenie.id_premii
JOIN ksiegowosc.godziny ON godziny.id_godziny=wynagrodzenie.id_godziny
WHERE liczba_godzin > 1 AND wynagrodzenie.id_premii IS NULL; --160

--i)

SELECT * FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji=wynagrodzenie.id_pensji
ORDER BY pensja.kwota;

--j)

--k)

SELECT pensja.stanowisko, COUNT(pensja.stanowisko) FROM ksiegowosc.pensja GROUP BY stanowisko;

--l) --dla Genera³a Armii

SELECT AVG(pensja.kwota), MIN(pensja.kwota), MAX(pensja.kwota) FROM ksiegowosc.pensja
WHERE stanowisko = 'Genera³ Armii';

--m)
SELECT SUM(pensja.kwota) FROM ksiegowosc.pensja;


--n)

--SELECT pensja.stanowisko, SUM(kwota) FROM ksiegowosc.pensja GROUP BY pensja.stanowisko;
SELECT pensja.stanowisko, SUM(pensja.kwota) AS suma FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji=wynagrodzenie.id_pensji
GROUP BY pensja.stanowisko


--o)

SELECT pensja.stanowisko, COUNT(premia.id_premii) AS suma_premki FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
JOIN ksiegowosc.premia ON premia.id_premii=wynagrodzenie.id_premii
JOIN ksiegowosc.pensja ON pensja.id_pensji=wynagrodzenie.id_pensji
GROUP BY pensja.stanowisko

--p)

SELECT * FROM ksiegowosc.pracownicy
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' GO
DELETE ksiegowosc.pracownicy FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie  ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja  ON pensja.id_pensji=wynagrodzenie.id_pensji WHERE pensja.kwota < 1200; GO