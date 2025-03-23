-- “USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların (Invoice) toplamını
-- listeleyen bir sorgu yazınız.

-- Burada country kolonu "USA" seçerek filtrelememiz gerekmekte ve aynı zamanda tarihte yıl olarak sadece 2009 yılı gelmelidir.
-- Bunun için tarih formatı timestamp olduğu ve arada "-" olduğu için split_part() fonksiyonu kullanmayı ve '-' den sonraki ilk
-- kısmı 2009 olanları almasını istedim. Böylece istediğimiz tüm faturalar gelmiş olur.

select * from invoice i where  i.billing_country = 'USA' and  SPLIT_PART(i.invoice_date::varchar, '-', 1) = '2009';

-- Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek
--(JOIN) listeleyen bir sorgu yazınız.

-- Join yaparken tüm parça (track) bilgileri istendiği için left join kullandım ve bunu playlisttrack tablosundaki track_id 
-- üzerinden track tablosu ile birleştirdim. Sonrasında ise playlisttrack tablosu ile playlist tablosunu playlist_id kolonu
-- üzerinden eşleşen kayıtlar gelecek şekilde birleştirdim.

select t.*, p.*, p2."name" from track t left join playlisttrack p on t.track_id = p.track_id 
inner join playlist p2 on p.playlist_id = p2.playlist_id  ;

-- "Let There Be Rock" adlı albüme ait tüm parçaları (Track) listeleyen, sanatçı (Artist) bilgisini
-- de içeren bir sorgu yazınız. Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe
-- sıralayınız.

-- Burada, album tablosundaki album adı = "Let There Be Rock" olacak şekilde seçilerek, bu albumun içindeki tüm şarkıların 
-- gelmesi için track tablosu ile album tablosunu eşleşen kayıtlar (inner join) üzerinden birleştirdim. Burada, aslında 
-- artist tablosuna gerek yoktu çünkü artist tablosundaki name kolonu track tablosundaki composer (besteci) kolonuna karşılık
-- gelmektedir. Fakat, soruda "artist" tablosu da verildiği için bu tabloyu da kullandım.

select a.title as album_name ,  a2."name" as artist_name, t.* from album a inner join track t on a.album_id = t.album_id 
inner join artist a2 on a2.artist_id = a.artist_id
where a.title = 'Let There Be Rock'
order by t.milliseconds desc;   

