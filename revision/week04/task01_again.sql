use movies

--Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда заглавие, година, име и адрес на студио.
select title, year, studioname, address
from movie join studio on studioname = name
where length >= 120

--Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
select studioname, starname 
from movie join starsin on title = movietitle
order by studioname

--Напишете заявка, която извежда имената на продуцентите на филмите, в които е играл Harrison Ford.
select distinct name
from movieexec 
	join movie on producerc# = cert#
	join starsin on movietitle = title
where starname = 'Harrison Ford'

--Напишете заявка, която извежда имената на актрисите, играли във филми на MGM.
select distinct starname
from starsin 
	join movie on title = movietitle
	join moviestar on starname = name
where studioname = 'MGM' and gender = 'F'

--Напишете заявка, която извежда името на продуцента и имената на филмите, продуцирани от продуцента на ‘Star Wars’.
select name, title
from movie join movieexec on producerc# = cert#
where name in (select distinct name from movie join movieexec on producerc# = cert# where movie.title = 'Star Wars')


--Напишете заявка, която извежда имената на актьорите не участвали в нито един филм.
select name
from moviestar left outer join starsin on name = starname
where starname is null