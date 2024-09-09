use ships

--Напишете заявка, която извежда името на корабите, по-тежки (displacement) от 35000
select name 
from ships join classes on ships.class = classes.class
where displacement >= 35000

--Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на всички кораби, участвали в битката при 'Guadalcanal'
select name, displacement, numguns
from outcomes 
	join ships on outcomes.ship = ships.name
	join classes on ships.class = classes.class
where outcomes.battle = 'Guadalcanal'

--Напишете заявка, която извежда имената на тези държави, които имат класове кораби от тип 'bb' и 'bc' едновременно
select distinct country 
from classes
where 
country in (select country from classes where type = 'bb') 
and
country in (select country from classes where type = 'bc')


select c1.country
from classes c1 join classes c2 on c1.country = c2.country
where c1.type = 'bb' and c2.type = 'bc'

--Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по-късно са участвали в друга битка
select o1.ship 
from outcomes o1 
	join battles b1 on o1.battle = b1.name
	join outcomes o2 on o1.ship = o2.ship
	join battles b2 on b2.name = o2.battle
where b1.date < b2.date and o1.result = 'damaged'

select ship
from outcomes o1 join battles b1 on o1.battle = b1.name
where o1.result = 'damaged' 
and
ship in 
(select ship from outcomes o2 join battles b2 on o2.battle = b2.name 
where b2.date > b1.date)