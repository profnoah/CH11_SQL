/*===================================================
	SELECT
===================================================*/

/* tracks tablosundaki track isimlerini (name) sorgulayınız */
 SELECT name FROM tracks;

/* tracks tablosundaki besteci(Composer) ve şarkı 
imlerini (name) sorgulayınız*/
 SELECT Composer,name FROM tracks;
 
/*album tablosundaki tüm bilgileri sorgulayınız*/
 select * from albums;

/*===================================================
DISTINCT
===================================================4*/
/*tracks tablosundaki composer bilgileri sorgulayınız
 (TEKRARLI OLABİLİR)*/
 
 SELECT Composer FROM tracks;
 
 /*tracks tablosundaki composer bilgileri sorgulayınız 
 TEKRARSIZ) */
 select DISTINCT Composer from tracks;
 