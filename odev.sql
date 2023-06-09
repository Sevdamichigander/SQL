
-- ********************** Isciler Tablosundan ************************



-- 1) Isme gore toplam maaslari bulun

SELECT isim, SUM(maas)toplam_maas
FROM isciler
GROUP BY isim;

-- 2) Sehre gore toplam isci sayisini bulun
SELECT sehir, COUNT(isim)toplam_isci
FROM isciler
GROUP BY sehir;

-- 3) Sehre gore toplam isci sayisini, buyukten kucuge yazdiriniz 

SELECT sehir, COUNT(isim)toplam_isci
FROM isciler
GROUP BY sehir
ORDER BY toplam_isci desc;

-- 4) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun

SELECT sirket, COUNT(isim)toplam_isci
FROM isciler
WHERE maas>5000
GROUP BY sirket;


-- 5) Her sirket icin Min ve Max maasi bulun
SELECT *
FROM isciler;

SELECT sirket, MIN(maas)min_maas, MAX(maas)max_maas
FROM isciler
GROUP BY sirket;

