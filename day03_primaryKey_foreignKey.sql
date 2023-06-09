-- PK unique tir ve not null olamaz.
-- 1 den fazla tablonun iliskisini tanimlamak icin en az 1 tane PK olmali. Digerlerinin hepsi FK olabilir.
-- AMA bir tablonun kendi icerisinde maximum 1 tane PK olabilir. 

-- FK ==> duplicate ve null deger kabul eder

/*====================================== PRIMARY KEY ==============================================

1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur.  (composite key)
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.

-----Syntax-----

 "id" field'ini "primary key" yapmak icin 2 yol var.
 
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);

2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 

"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/
/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/

CREATE TABLE sehirler
(
 alan_kodu int PRIMARY KEY,
 isim varchar(20) not null,
 nufus int
);


/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/

CREATE TABLE ogretmenler
(
 id varchar(11) unique,
 isim varchar(20),
 brans varchar(20),
 cinsiyet varchar(15),
 CONSTRAINT id_isim_pk PRIMARY KEY (id,isim)  -- (id_isim_pk) bu ismi biz verdik. field isimleri ile ayni olmasi aciklayici olur. Bu iki sutunun birlesim degerini baska bir tabloda gorecegiz
);

/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/
CREATE TABLE universite_ogrenci_bilgi_sistemi
(
 giris_yili int,
 giris_siralamasi int,
 isim varchar(20) not null,
 bolum varchar(20),

 CONSTRAINT girisYiligirisSiralamasi_pk PRIMARY KEY (giris_yili,giris_siralamasi)
);



SELECT *
FROM universite_ogrenci_bilgi_sistemi;

/*====================================== FOREIGN KEY ==============================================

=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
=> Foreign Key duplicate olabilir. 
Note 1: "Parent Table"da olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz . 
	    Cunku zaten baglanti PK uzerinden kuruluyor. Olmayan PK uzerinden islem yapilamaz.
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir, sonra "Parent Table" silinir.
		(Parent i sildigimizde cocugun acikta kalmasina goz yumamayacagimiz icin / belirsizligi ortadan kaldirmak icin)
        
-----Syntax-----

CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name)                 -- hangi tablo ve sutunda ki PK, fk ya donussun u burda belirtiyoruz.


CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
        
==================================================================================================*/
/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
CREATE TABLE tedarikci
(
tedarikci_id char(4) PRIMARY KEY,
tedarikci_ismi varchar(10),
iletisim_isim varchar(30)

);
CREATE TABLE urunler
(
tedarikcinin_id char,    -- Baglanti kuracagimiz field larin data type i ayni olmali -- Bunun degerini int yapamayiz. Hata verir.
urun_id int,
CONSTRAINT urunler_fk
FOREIGN KEY (tedarikcinin_id) 
REFERENCES tedarikci (tedarikci_id) 

);
/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
CREATE TABLE bebeler
(id int PRIMARY KEY,
isim varchar(20),
iletisim varchar(12)

);

CREATE TABLE notlar
(bebe_id int,
puan double,
CONSTRAINT notlar_fk
FOREIGN KEY (bebe_id) -- fk yapmak istedigimiz sutunun adini yaziyoruz
REFERENCES bebeler (id) -- referans aldigimiz parent sutununu yaziyoruz

);









