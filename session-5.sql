
/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*-----------------------------------------------------
/*  CREATE TABLE
/*-----------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz. Tabloda first_name, 
last_name, age(INT) ve hire_date (Date) sutunları bulunmalıdır.	*/

 CREATE TABLE personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );
 
 /* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir.
 Bu hatayı almamak için IF NOT EXISTS keywordu kullanılabilir */

 CREATE TABLE IF NOT EXISTS personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );

/* Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  
Sutun isimleri place_id, country, hotel_name, employee_id, 
vacation_length, budget */
 
 CREATE TABLE vacation_plan (
  place_id INT, 
  country NVARCHAR(50), 
  hotel_name NVARCHAR(100),
  employee_id INTEGER, 
  vacation_length INT,
  budget REAL
 );
 
/*---------------------------------------------------
/*  DROP TABLE
/*---------------------------------------------------
/* personel tablosunu siliniz */
 DROP TABLE personel;
  	
/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/

 DROP TABLE IF EXISTS personel;
  
-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite 
-- bu komutu desteklememektedir. Truncate komutu  bir tabloyu 
-- değil içindeki tüm verileri silmek için kullanılır.
 
  INSERT INTO vacation_plan VALUES(34, "TURKEY", 'HOTEL ISTANBUL',1, 7, 4000);
  
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur. 
	
  INSERT INTO vacation_plan VALUES(42, "TURKEY", 'HOTEL MEVLANA',2, 4, 2000);
  
  /*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik 
  olarak veri girişi yapınız*/
  
  INSERT INTO vacation_plan (place_id,country, hotel_name, employee_id) 
                             VALUES(06, "TURKEY", 'HOTEL BAŞKENT',3);
-- NOT : giriş yapılmayan sutunlara NULL atanır.

/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

 NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

 UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

 PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

 FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.*/
 
  CREATE TABLE workers(
   id INT PRIMARY KEY,
   id_number TEXT NOT NULL UNIQUE,
   name TEXT DEFAULT 'NONAME',
   salary INTEGER NOT NULL
  );
  
  INSERT INTO workers VALUES(1,"12345678910","CAN CANAN", 10000);
  
  -- UNIQUE CONST VIOLATION
  -- INSERT INTO workers VALUES(1,"4445678910","AHMET CANAN", 7000); 
  
    INSERT INTO workers VALUES(3,"566678910",NULL, 9000);
	
	--name kısmına NONAME yazılır. (DEFAULT)
	INSERT INTO workers (id, id_number, salary) VALUES(4,"57786678910",9000);
  
/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 
 
 CREATE TABLE vacation_plan2 (
  place_id INT, 
  country NVARCHAR(50), 
  hotel_name NVARCHAR(100),
  employee_id INTEGER, 
  vacation_length INT,
  budget REAL,
  PRIMARY KEY(place_id),
  FOREIGN KEY (employee_id) REFERENCES employees(EmployeeId) 
 );
	
 /* Employees tablosundaki EmployeeId'si 1 olan kişi için 
 bir tatil planı giriniz.*/
 
 INSERT INTO vacation_plan2 VALUES(34,"TURKEY", 'HAPPY NATION',1,5,5000);
  
 /* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) 
 olan kişi için bir tatil planı giriniz.*/
 
 --HATA (FOREIGN KEY constraint failed)
 --INSERT INTO vacation_plan2 VALUES(35,"TURKEY", 'HOTEL DELRAY',9,4,3000);
 
 /*JOIN işlemi ile 2 tablodan veri çekme*/
 /* FirstName, LastName, vacation_length, hotel_name*/ 
 
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 --INNER JOIN vacation_plan2 v
 ON e.EmployeeId = v.employee_id;
 
  
/*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */

 ALTER TABLE vacation_plan2
 ADD name TEXT DEFAULT 'isimsiz';
 
 /*vacation_plan2 tablosundaki name sutununu siliniz*/
  ALTER TABLE vacation_plan2
  DROP COLUMN name;
  
 /* workers tablosunun adını people olarak değiştiriniz */
 
 ALTER TABLE vacation_plan2
 RENAME TO people;
 
  ALTER TABLE people
  RENAME TO vacation_plan2;
 
/*------------------------------------------------------------------------------------------
/* UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini hotel_name'ini
 Komagene Hotel olarak güncelleyiniz.*/
 
 UPDATE vacation_plan2
 SET hotel_name = "KOMAGENE HOTEL"
 WHERE employee_id = 1;
 
   
/* people tablosunda salary sutunu 7000 'den az olanların 
salary(maaşına) %10 zam yapacak sorguyu yazınız*/ 
   
UPDATE vacation_plan2
SET hotel_name = 'Komagene Hotel'
WHERE employee_id = 1;
   
/* workers tablosunda salary sutunu 9000 'den fazla olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 
   
UPDATE workers
SET salary = salary*1.1
WHERE salary >= 9000;
   
/*workers tablosundaki tüm kayıtların salary sutununu 10000 olarak güncelleyiniz */
UPDATE workers
SET salary=10000;
   
/*workers tablosundaki id=1 olan kaydı siliniz*/
DELETE FROM workers
WHERE id=1; 
 