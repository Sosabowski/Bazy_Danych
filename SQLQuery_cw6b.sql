use firma

--a)

ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon  varchar(16);
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)' + telefon

--b)
UPDATE ksiegowosc.pracownicy SET telefon = LEFT(telefon,8)+ '-' + substring(telefon,8,3) + '-' + RIGHT(telefon, 3)
SELECT * from ksiegowosc.pracownicy


--c)
SELECT
	wr.id_pracownika,
	UPPER(wr.imie) as imie,
	UPPER(wr.nazwisko) as nazwisko,
	UPPER(wr.adres) as adres,
	wr.telefon
FROM ksiegowosc.Pracownicy as wr
WHERE len(wr.nazwisko) = (SELECT MAX(len(wr.nazwisko)) FROM ksiegowosc.pracownicy as wr);

--d)

SELECT HASHBYTES('MD5',imie) AS imiemd5, HASHBYTES('MD5',nazwisko) AS nazwiskomd5, 
HASHBYTES('MD5',adres) AS adresmd5, HASHBYTES('MD5',telefon) AS telefonmd5,
HASHBYTES('MD5', CAST(kwota AS VARCHAR(16))) AS kwotamd5 FROM ksiegowosc.pracownicy pra
JOIN ksiegowosc.wynagrodzenie wyn ON wyn.id_pracownika = pra.id_pracownika 
JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji;

--f)

SELECT * FROM ksiegowosc.pracownicy as pra
join ksiegowosc.wynagrodzenie as wyn
ON pra.id_pracownika = wyn.id_pracownika
join ksiegowosc.pensja as pen
ON wyn.id_pensji = pen.id_pensji
left join ksiegowosc.premia as pre
ON wyn.id_premii = pre.id_premii

--g)



SELECT CONCAT('Pracownik ' , imie , ' ' , nazwisko ,', w dniu ',  FORMAT(h.data, 'd', 'de-de'),
' otrzyma³ pensjê ca³kowit¹ na kwotê ', pen.kwota+ISNULL(pre.kwota,0)+ CASE WHEN h.liczba_godzin <= 1 THEN 0 ELSE (h.liczba_godzin-1)*20 END, ' z³, 
gdzie wynagrodzenie zasadnicze wynosi³o: ', pen.kwota,' z³, premia: ',ISNULL(pre.kwota,0),' z³, 
nadgodziny: ', CASE WHEN h.liczba_godzin <= 1 THEN 0 ELSE (h.liczba_godzin-1)*40 END,' z³' ) AS Raport FROM ksiegowosc.pracownicy AS pra
JOIN ksiegowosc.wynagrodzenie AS w 
ON pra.id_pracownika = w.id_pracownika 
JOIN ksiegowosc.godziny AS h
ON pra.id_pracownika = h.id_pracownika 
JOIN ksiegowosc.pensja AS pen 
ON pen.id_pensji = w.id_pensji
JOIN ksiegowosc.premia AS pre
ON pre.id_premii = w.id_pensji;