-- ************************ Kelimeler Tablosundan *******************************

-- Q1: 3 harfli kelimeleri listeleyin
 
 SELECT kelime
 FROM kelimeler
 WHERE kelime LIKE '___';
 

 SELECT *
 FROM kelimeler
 WHERE kelime LIKE '___';
 
-- Q2: En az 3 harfli kelimeleri listeleyin

SELECT kelime
 FROM kelimeler
 WHERE kelime LIKE '___%';

-- Q3: H ile baslayip t ile biten kelimeleri listeleyin.

SELECT kelime
 FROM kelimeler
 WHERE  regexp_like (kelime, '^H.*t$');





 SELECT *
 FROM kelimeler
 WHERE kelime LIKE 'h%t';

-- Q4: H ile baslayip T ile biten kelimeleri case sensitive listeleyin


SELECT kelime
 FROM kelimeler
 WHERE  regexp_like (kelime, '^H.*T$', 'c');







SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE(kelime, '^H.*T$','c');
 
 INSERT INTO kelimeler VALUES (1021, 'Hoot',4);

-- Q5: H ile baslayip T ile biten 3 harfli kelimeleri case sensitive listeleyin







SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE(kelime, 'H[[!-~]]T','c');
 

-- Q6: 3 ya da daha az karakterli kelimeleri listeleyin

 SELECT kelime
 FROM kelimeler
 WHERE kelime NOT LIKE '____%';





-- Q7: id'si 8 rakamini iceren kelimeleri listeleyin
SELECT *
 FROM kelimeler
 WHERE id like '%8%';

SELECT kelime
 FROM kelimeler
 WHERE kelime NOT LIKE '____%';

SELECT kelime,id
FROM kelimeler
WHERE id LIKE '%8%';


CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES -- bu sekilde tek bir insert into ile yaparsak araya yeni kayit ekleyemeyiz
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
SELECT * FROM kelimeler;
