use movies

-- 1. За всяка филмова звезда да се изведе името, рождената дата и с кое
--    студио е записвала най-много филми. (Ако има две студиа с еднакъв 
--    брой филми, да се изведе кое да е от тях)
select ms.name, ms.birthdate, (select top 1 m.studioname 
								from movie m join starsin si on m.title = si.movietitle
								where si.starname = ms.name
								group by m.studioname
								order by (count(*)) desc)
from moviestar ms

-- 2. Да се изведат всички производители, за които средната цена на 
--    произведените компютри е по-ниска от средната цена на техните лаптопи.
use pc

select p.maker
from product p join pc on p.model = pc.model
group by p.maker
having avg(price) <
(select avg(price) from laptop l join product p2 on l.model = p2.model
group by p2.maker
having p.maker = p2.maker)

-- 3. Един модел компютри може да се предлага в няколко конфигурации 
--    с евентуално различна цена. Да се изведат тези модели компютри,
--    чиято средна цена (на различните му конфигурации) е по-ниска
--    от най-евтиния лаптоп, произвеждан от същия производител.
select pc.model
from pc join product p1 on pc.model = p1.model
group by pc.model, p1.maker
having avg(price) < 
(select min(l.price)
from laptop l join product p2 on l.model = p2.model
where p2.maker = p1.maker
)

-- 4. Битките, в които са участвали поне 3 кораба на една и съща страна.
use ships

select battle
from outcomes o 
	join ships s on o.ship = s.name
	join classes c on s.class = c.class
group by o.battle
having count(c.country) >= 3

-- 5. За всеки кораб да се изведе броят на битките, в които е бил увреден.
--    Ако корабът не е участвал в битки или пък никога не е бил
--    увреждан, в резултата да се вписва 0.
use ships

select s.name, count(o.battle)
from ships s left outer join outcomes o on s.name = o.ship
where o.result = 'damaged'
group by s.name

-- 6. За всеки клас да се изведе името, държавата и първата година, в която 
--    е пуснат кораб от този клас
select c.class, s.name, c.country, s.launched
from classes c join ships s on c.class = s.class
where launched in 
(select min(launched) from ships where ships.class = c.class)

-- 7. За всяка държава да се изведе броят на корабите и броят на потъналите 
--    кораби. Всяка от бройките може да бъде и нула.
select c.country, count(s.name) as ships, count(o.result) as SunkShips
from classes c 
	left outer join ships s on c.class = s.class
	left outer join outcomes o on o.ship =s.name and o.result = 'sunk'
group by c.country

-- 8. Намерете за всеки клас с поне 3 кораба броя на корабите от 
--    този клас, които са с резултат ok.
select s.class, count(distinct s.name)
from outcomes o join ships s on o.ship = s.name and o.result = 'ok'
group by s.class
having s.class in 
(select class from ships group by class having count(*) >= 3)

-- 9. За всяка битка да се изведе името на битката, годината на 
--    битката и броят на потъналите кораби, броят на повредените
--    кораби и броят на корабите без промяна.


-- 10. Да се изведат имената на корабите, които са участвали в битки в
--     продължение поне на две години
select o.ship
from outcomes o join battles b on o.battle = b.name
group by o.ship
having year(max(b.date) - min(b.date)) >= 2

-- 11. За всеки потънал кораб колко години са минали от пускането му на вода 
--     до потъването.
select s.name, (year(b.date) - s.launched) as YearsPassed
from ships s 
	join outcomes o on s.name = o.ship and o.result = 'sunk'
	join battles b on o.battle = b.name

-- 12. Имената на класовете, за които няма кораб, пуснат на вода след 1921 г., 
--     но имат пуснат поне един кораб. 
select c.class
from classes c join ships s on c.class = s.class
group by c.class
having max(launched) <= 1921