use ships

--Напишете заявка, която за всеки кораб извежда името му, държавата, броя оръдия и годината на пускане (launched).
select name, country, numguns, launched
from ships join classes on ships.class = classes.class

--Напишете заявка, която извежда имената на корабите, участвали в битка от 1942г.
select ships.name
from ships 
	join outcomes on ships.name = ship
	join battles on battle = battles.name
where YEAR(date) = 1942

--За всяка страна изведете имената на корабите, които никога не са участвали в битка.
select country, ships.name
from classes 
	join ships on classes.class = ships.class
	left outer join outcomes on outcomes.ship = ships.name
where outcomes.ship is NULL