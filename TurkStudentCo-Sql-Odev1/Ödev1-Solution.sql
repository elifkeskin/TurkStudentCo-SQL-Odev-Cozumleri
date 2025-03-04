-- Çalışanların sadece FirstName, LastName ve Salary bilgilerini getiren bir SQL sorgusu yazınız.
--Belirtilen kolonları seçmek için, select ifadesinden sonra seçmek istediğimiz kolonun ismi girilir.
select  e.firstname , e.lastname, e.salary   from employees e ;

-- Çalışanların çalıştıkları departmanları benzersiz olarak listeleyen bir SQL sorgusu yazınız.
-- Distinct komutu, kendisinden sonra gelen ifadenin benzersiz olmasını sağlar yani tekrarlayan değerleri önler.
select distinct d.departmentid, d.departmentname  from departments d ;

-- Sadece IT departmanında çalışanların bilgilerini getiren bir SQL sorgusu yazınız.
-- IT departmanında çalışanları getirmek için  department_id'si "1" olan yani IT'ye karşılık gelen koşul ifadesi yazılır.
select * from employees e where e.departmentid = 1;

--Çalışanları maaşlarına göre büyükten küçüğe sıralayan bir SQL sorgusu yazınız.
-- Maaşlarına göre sıralanacağı için order by sonra salary kolonu seçilir ve azalan sırada sıralanacağı desc yazılır.
-- Default asc'dir.
select e.employeeid , e.firstname , e.lastname , e.salary  from employees e order by e.salary desc;

--Çalışanların FirstName ve LastName alanlarını birleştirerek, tam adlarını içeren yeni bir kolon
--oluşturan bir SQL sorgusu yazınız.
-- || concatenate işlemi için kullanılır. Araya boşluk getirmek için ' ' konmuştur. As ifadesinden sonra oluşturacağımız
-- yeni kolona vereceğimiz ismi yazarız.

select e.employeeid , e.firstname || ' ' || e.lastname  as "employee_name",  e.age, e.salary, e.departmentid  
from employees e ;