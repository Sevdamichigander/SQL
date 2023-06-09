-- burasi yorum satiridir
/*
Burasi
 da yorum 
 paragrafidir
 
 */
 
 /*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)ogrencilerogrenciler
========================================*/

-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

CREATE TABLE ogrenciler1
(
id CHAR(4), -- 4 karakterlik alan ayiriyor
isim VARCHAR(25), -- () max siniri belirtir, 25 imis
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE  -- burada , koyarsak devam edecegimizi dusunup yeni sutun bekler. Son sutun buysa , koyma
);

SELECT * FROM ogrenciler1; -- gormek icin select komutunu kullaniyoruz.

/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/


CREATE TABLE tedarikciler
(
tedarikci_id INT, 
tedarikci_ismi VARCHAR(25), 
tedarikci_adres VARCHAR(50),
ulasim_tarihi DATE  
);

SELECT * FROM tedarikciler;

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/

-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

SELECT *
FROM ogrenciler1;

CREATE TABLE ogrenci_derece1
AS
SELECT isim, not_ortalamasi
FROM ogrenciler1;

SELECT * FROM ogrenci_derece1;

/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

CREATE TABLE tedarikciler_son
AS
SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler;

SELECT * FROM tedarikciler_son;
















