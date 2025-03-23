-- . Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulmanız isteniyor.
/* Bu işlemi tek bir sorgu ile yapmalısınız. Sorguyu yazdıktan sonra, PostgreSQL’in
sol alt kısmındaki Row sayısını, SQL sorgunuzda yorum satırında belirtmeniz
gerekmektedir.*/

-- Count(*) tablodaki tüm değerleri sayar.
-- Count(billing_state), billing_state'i null olmayan tüm kayıtları sayar.
-- Aradaki fark bize null olan kayıtları verir.
-- Bunları invoice_id'ye göre gruplayıp, invoice_id'ye göre artan sırada sıraladım.

select i.invoice_id  , count(*) from invoice i group by i.invoice_id having count(*)-count(i.billing_state) > 0 
order by invoice_id; -- 202 kayıt

-- Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar.
/*Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir
sorgu yazmanız isteniyor. Ayrıca, verilerin daha rahat takip edilebilmesi için,
tablonun yeni versiyonuna ait kolona göre büyükten küçüğe sıralama yapılması
isteniyor.*/

-- Total * 2 => Total kolonunun 2 katı değerini verir.
-- nullif() fonksiyonu, içine yazdığımız değerlerin karşılaştırmasını yapar.
-- Eğer iki değer birbirine eşitse "null", değilse birinci değeri döner.
-- Burada, iki değer birbirine eşit olmayacağı için her zaman birinci değeri döner. Bunu old_total olarak adlandırdım.

select total * 2 new_total, nullif(total, total * 2) as old_total from invoice i  order by 1 desc;

/* Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak
birleştirmeniz ve "Açık Adres" olarak yazmanız isteniyor. Ayrıca, bu yeni açık adresi
2013 yılı ve 8. ay’a göre filtrelemeniz gerekiyor.*/

-- Burada, left ve right fonksiyonlarını kullanarak adres kolonundaki ilgili karakterleri alarak "Açık Adres" ini kolonunu
--oluşturdum. Sonrasında Split_Part() fonksiyonunda "-" delimiter'ına göre ayırma işlemi yaparak, önce tarihi 2013, sonrasında
-- ayı 8 ay olarak belirttim.

select billing_address, 
left(i.billing_address, 3) || ' ' || right(i.billing_address, 4)  as "Açık Adres", invoice_date 
from invoice i where SPLIT_PART(invoice_date::varchar, '-', 1) = '2013'  and  SPLIT_PART(invoice_date::varchar, '-', 2) = '08' ;