
--cw 1


create database firma;
use firma

--cw 2

create schema rozliczenia;

--cw 3

create table rozliczenia.pracownicy (id_pracownika int primary key , imie varchar(30)NOT NULL, nazwisko varchar(30) NOT NULL, adres varchar(30)NOT NULL, telefon varchar(9));
create table rozliczenia.godziny (id_godziny int primary key, data date NOT NULL, liczba_godzin int NOT NULL, id_pracownika int NOT NULL);
create table rozliczenia.pensje (id_pensji int primary key, stanowisko varchar(40) NOT NULL, kwota money NOT NULL, id_premii int);
create table rozliczenia.premie(id_premii int primary key, rodzaj varchar(50), kwota money NOT NULL)

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

---tabela Pracownicy
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (1,'Bart³omiej', 'Sebiksowy', 'Bie¿anów', '543455678');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (2,'Piotr', 'Fazrmazoñski', 'Farmazonów Dolny', '222313547');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (3,'Luki', 'Firana', 'Kobierzyn', '694202137');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (4,'Tomasz', 'Kowalczyk', 'D¹browa Gorsza', '587456966');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (5,'Vojtec', 'Lost', 'Bezmapowice', '789456123');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (6,'Bartosz', 'Szczucin', 'Stettin', '123456987');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (7,'Jakub', 'Pastuch', 'Kielece', '852369741');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (8,'Aleksander', 'Jab³onowski', 'Wiêzienie', '846513297');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (9,'Mateusz', '¯egnam', 'Witam', '555874123');
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko, adres, telefon) VALUES (10,'Szymek', 'Trojan', 'Szczaniec', '723665898');

select *  from rozliczenia.pracownicy;

---tabela godziny
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (1, '2022-04-12', 10, 4);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (2, '2022-04-12', 6, 3);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (3, '2022-04-13', 7, 1);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (4, '2022-04-14', 4, 6);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (5, '2022-04-15', 6, 8);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (6, '2022-04-15', 7, 3);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (7, '2022-04-15', 8, 2);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (8, '2022-04-16', 5, 2);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (9, '2022-04-17', 6, 1);
INSERT INTO rozliczenia.godziny (id_godziny,data, liczba_godzin, id_pracownika) VALUES (10, '2022-04-18', 7, 10);

select *  from rozliczenia.godziny;

---tabele premii
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (1, 'Socjalistyczna', 100);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (2, 'Komunistyczna', 50);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (3, 'Kapitalistyczna', 5000);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (4, 'Kwarta³owa', 250);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (5, 'Imperialna', 1000);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (6, 'Farmazonowa', 30);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (7, 'Krakowska', 0);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (8, 'Skibiañksa', 230);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (9, 'Morawicka', 546);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) VALUES (10, 'Strzelcowa', 900);

select *  from rozliczenia.premie;
---tabela pensje
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (1, 'Asystent', 2000, 4);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (2, 'Rezerwowy', 2500, 3);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (3, 'Gwardzista', 4000, 1);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (4, 'Gwardzista Imperialny', 4500, 2);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (5, 'Anystent Imperialny', 4700, 5);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (6, 'Delegat', 4750, 8);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (7, 'Kierownik', 5000, 7);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (8, 'Koordynator', 5500, 6);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (9, 'Kwatermistrz', 6500, 10);
INSERT INTO rozliczenia.pensje (id_pensji,stanowisko, kwota, id_premii) VALUES (10, 'El Prezeso', 10000, 10);

select *  from rozliczenia.pensje;

----Rozliczenia-tylko nazwiska i adresy
select nazwisko, adres  from rozliczenia.pracownicy;
----Daty (dni,godziny)
SELECT DATEPART ( dd , data ),DATEPART ( mm , data ) FROM rozliczenia.godziny;
----Kwoty brutto i netto zamiana

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (pensje.kwota_brutto * 0.71);

SELECT * FROM rozliczenia.pensje;