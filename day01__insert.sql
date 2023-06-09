/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken :
-- tabloyu olustururken degerleri atadigimiz veri cinsinden olmasidir.
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/

-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

CREATE TABLE fen_lisesi
(
okul_numarasi INT UNIQUE, -- unique olmali
isim CHAR(20) NOT NULL, -- bos birakilamaz
derece DOUBLE,
adres VARCHAR(20),
son_degisiklik_tarihi DATE
);

SELECT * FROM fen_lisesi;
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)

INSERT INTO fen_lisesi VALUES (101, 'Adem KARA', 4.3, 'Ankara', '2023-05-23'); -- unique gibi bir constraint yoksa 2. kez kaydedersek 2 kez kaydeder
INSERT INTO fen_lisesi VALUES (102, 'Yusuf RAHMAN', 4.5, 'Balikesir', '2023-05-22');
INSERT INTO fen_lisesi VALUES (103, 'Sevda KARATAS', 4.2, 'Erzurum', '2023-05-19');
INSERT INTO fen_lisesi VALUES (104, 'Veysel Jonturk', 3.9, 'Mersin', '2023-05-18');
INSERT INTO fen_lisesi VALUES (105, 'Yasemin Tahtali', 4.9, 'Malatya', '2023-05-17');
INSERT INTO fen_lisesi VALUES (106, 'Kubra Filiz', 4.5, 'Mus', '2023-05-13');
INSERT INTO fen_lisesi VALUES (null, 'Adem Tekin', 3.7, null, '2023-03-13'); -- isim cannot be null.
INSERT INTO fen_lisesi VALUES (null, 'Kubra Filiz', 4.5, 'Mus', null);

UPDATE fen_lisesi SET son_degisiklik_tarihi='2023-05-22' WHERE okul_numarasi=102;


-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

CREATE TABLE anadolu_lisesi
(
okul_no CHAR(6) UNIQUE ,
isim CHAR(20) NOT NULL,
adres CHAR(20),
derece DOUBLE
);

SELECT * FROM anadolu_lisesi;

INSERT INTO anadolu_lisesi VALUES ('1001', 'Esat Fatih', 'Ankara', 4.7);
INSERT INTO anadolu_lisesi VALUES ('1002', 'Yusuf Rahman', 'Bolu', 4.5);
INSERT INTO anadolu_lisesi VALUES ('1003', 'Saida Koca', 'Izmir', 5.0);
INSERT INTO anadolu_lisesi VALUES ('1004', 'Muhammet Ozyon', 'Antalya', 4.2);
INSERT INTO anadolu_lisesi VALUES ('1005', 'Cemil Cetin', 'Mardin', 4.2);
INSERT INTO anadolu_lisesi VALUES ('1006', 'Yasemin KAYA', 'Antalya', 4.4);
INSERT INTO anadolu_lisesi VALUES ('', 'Yasemin KAS', 'Antalya', 4.4); -- 1. hicligi kabul eder ama 2. kez kabul etmez
INSERT INTO anadolu_lisesi VALUES ('', 'Ayse Yilmaz', 'Antalya', 4.4); -- error / duplicate entry 
INSERT INTO anadolu_lisesi (okul_no, isim) VALUES ('1007', 'Elif Ece');  -- sadece iki veri girisi yapmak istedigimizde VALUES un onune istedigimiz kisimlari yaziyoruz
INSERT INTO anadolu_lisesi (isim, adres) VALUES ('Ayse Yilmaz','Antalya');






