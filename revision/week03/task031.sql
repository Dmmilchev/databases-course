use ships

--Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.
select country 
from classes
where numguns >= all (select numguns from classes)

--Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка.
select distinct class
from ships
where name in (select ship from outcomes where result = 'sunk')

--Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).
select name
from ships
where class in (select class from classes where bore >= 16)

select name
from ships join classes on ships.class = classes.class
where bore >= 16

--Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас ‘Kongo’.
select battle
from outcomes
where ship in (select name from ships where class = 'Kongo')

--Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е найголям в сравнение с корабите със същия калибър оръдия (bore). 
select distinct name
from ships
where class in 
(select c1.class from classes c1 
where c1.numguns >= all(select c2.numguns from classes c2 where c1.bore = c2.bore))