use ships

--• Напишете заявка, която извежда броя на класовете кораби
select count(distinct class)
from classes

--• Напишете заявка, която извежда средния брой на оръжия за всички кораби,
--пуснати на вода
select sum(numguns) / count(name)
from ships join classes on ships.class = classes.class

--• Напишете заявка, която извежда за всеки клас първата и последната година, в
--която кораб от съответния клас е пуснат на вода
select class, min(year(launched)), max(year(launched))
from ships 
group by class
--• Напишете заявка, която извежда броя на корабите потънали в битка според класа
select s.class, count(s.name)
from ships s join outcomes o on o.ship = s.name
where o.result = 'sunk'
group by s.class

--• Напишете заявка, която извежда броя на корабите потънали в битка според
--класа, за тези класове с повече от 4 пуснати на вода кораба
select s.class, count(s.name)
from ships s join  outcomes o on o.ship = s.name
where o.result = 'sunk'
group by s.class
having s.class in 
(select class from ships group by class having count(name) >= 4)

--• Напишете заявка, която извежда средното тегло на корабите, за всяка страна
select country, avg(displacement)
from classes
group by country
