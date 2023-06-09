-- ====================== UNION ======================
/*
    Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
   
   2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar.
   
    NOT: Secilen Field SAYISI ve DATA TYPE'i ayni olmalidir.****field isimleri ayni olmak zorunda degil
    
    Syntax:
    ----------
    
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    
    Benzer verileri almak icin==>  UNION ALL kullanilir.
======================================================*/

CREATE TABLE kadro(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO kadro VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO kadro VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO kadro VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO kadro VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO kadro VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO kadro VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO kadro VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO kadro VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');

SELECT * FROM kadro;

-- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin
    
SELECT isim
FROM kadro
WHERE sirket = 'Honda'
union
SELECT isim
FROM kadro
WHERE sirket = 'Tofas';

-- 2) Honda, Ford ve Tofas'ta calisan benzersiz isimdeki
-- personelleri listeleyin

SELECT isim
FROM kadro
WHERE sirket = 'Ford'
union 
SELECT isim
FROM kadro
WHERE sirket = 'Honda'
union
SELECT isim
FROM kadro
WHERE sirket = 'Tofas';

-- 3) Honda, Ford ve Tofas'ta calisan butun personelleri listeleyin

SELECT isim
FROM kadro
WHERE sirket = 'Ford'
union all
SELECT isim
FROM kadro
WHERE sirket = 'Honda'
union all
SELECT isim
FROM kadro
WHERE sirket = 'Tofas';

-- 4) Honda, Ford ve Tofas'ta calisan butun personellerin
-- isim, maas, sehir bilgilerini listeleyin

SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Ford'
union all
SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Honda'
union all
SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Tofas';

-- Ilk yazdigimiza gore sutun siralamasini yapiyor

-- 5) Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz

SELECT isim AS isim_sehir -- AS i ilkine yazmamiz lazim. Cunku hep ilki baz aliyor
FROM kadro
WHERE maas>4000

union

SELECT sehir
FROM kadro
WHERE maas>5000;

-- 6) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve
-- Istanbul'daki personelin maaslarini bir tabloda gosteren sorgu yaziniz

SELECT maas, isim AS isim_sehir
FROM kadro
WHERE isim = 'Mehmet Ozturk'
union
SELECT maas, sehir
FROM kadro
WHERE sehir = 'Istanbul';

-- 7) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini en yuksekten dusuge dogru siralayarak bir
-- tabloda gosteren sorguyu yaziniz.

SELECT maas 
FROM kadro
WHERE isim = 'Mehmet Ozturk'
union
SELECT maas
FROM kadro
WHERE sehir = 'Istanbul'
ORDER BY maas DESC; -- ORDER BY i son sorgunun sonunda kabul eder.


/* SELECT (AGGREGATE fuction, distinct) AS 
   FROM tablename
   WHERE (like, in, regexp_like, is null, exists, between, and, or)
   GROUP BY
   HAVING
   ORDER BY (DESC, ASC)
   LIMIT

*/

-- 8) Sehirlerde odenen ucreti 4000'den fazla olan sehirleri ve personelden 
-- ucreti 5000'den az olanlarin isimlerini bir tabloda gosteren sorguyu yaziniz

SELECT sehir AS sehir_isim
FROM kadro
WHERE maas >4000
union
SELECT isim
FROM kadro
WHERE maas<5000; 


SELECT *
FROM kadro
WHERE maas <5000
union
SELECT *
FROM kadro
WHERE sirket<>'Honda'; 

-- <> ile != ayni anlami tasir.

-- 10) Ismi Veli Sahin olanlari ve ek olarak Istanbul'da calismayanlarin isimlerini ve
-- sehirlerini listeleyen sorguyu yaziniz.

SELECT isim, sehir
FROM kadro
WHERE isim='Veli Sahin'
union
SELECT isim,sehir
FROM kadro
WHERE sehir<>'Istanbul'; 













