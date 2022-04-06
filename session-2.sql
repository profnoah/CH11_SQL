/*===================================================
WHERE
====================================================*/

/*Composer'ı Jimi Hendrix olan şarkıları sorgulayiniz*/
SELECT name
FROM tracks
WHERE Composer = 'Jimi Hendrix';

/* invoices tablosunda Total değeri 10$ dan büyük olan faturaların 
tüm bilgilerini sorgulayiniz */

SELECT *
FROM invoices
WHERE total > 10;

/*===================================================
LIMIT
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */
SELECT InvoiceId,invoicedate,total 
FROM invoices
WHERE total > 10
LIMIT 4;


/*===================================================
ORDER BY
====================================================*/
	
/*invoices tablosunda Total değeri 10$'dan büyük olan 
kayıtlardan işlem tarihi (InvoiceDate) en yeni olan 10
 kaydın tüm bilgilerini listeyiniz */

SELECT * 
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC
LIMIT 10; 
 
 /* invoices tablosundan CustomerId, InvoiceDate, 
 BillingCity, total değerlerini sorgulayınız. 
 BillingCity artan sırayla ve total değerlerini 
 azalan sırayla sıralayınız.*/
 SELECT CustomerId, InvoiceDate,BillingCity,total
 FROM invoices
 ORDER BY BillingCity ASC,total DESC;
 
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan
 kayıtları total değerine göre  AZALAN sırada listeyiniz */ 
 
 SELECT *
 FROM invoices
 WHERE NOT BillingCountry = "USA" 
 --WHERE BillingCountry != "USA" 
 -- WHERE BillingCountry <> "USA"
 ORDER BY total DESC;
  	
/* invoices tablosunda, ülkesi (BillingCountry) USA veya 
Germany olan kayıtları,InvoiceId sırasına göre artan sırada listeyiniz */ 
	
 SELECT *
 FROM invoices
 WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
 ORDER BY InvoiceId ASC;
 
 /* invoices tablosunda fatura tarihi (InvoiceDate) 
 01-01-2012 ile 02-01-2013 tarihleri arasındaki faturaların 
 tüm bilgilerini listeleyiniz */

SELECT *
FROM invoices
WHERE InvoiceDate>= '2012-01-01' AND InvoiceDate <= '2013-01-02 00:00:00';

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02 00:00:00';

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 
tarihleri arasındaki en yeni faturayı listeleyen sorguyu yazınız */ 

 SELECT *
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
 ORDER BY InvoiceDate DESC
 LIMIT 1;
 
 	
/*===================================================
 IN
====================================================*/
/* customers tablosunda Belgium, Norway,Canada veya USA  
ülkelerinden sipariş veren müşterilerin FirstName, LastName, 
country bilgilerini listeyiniz.	*/

SELECT FirstName,LastName,country
FROM customers
WHERE country IN('Belgium', 'Norway','Canada','USA');

 
 
 
	
 