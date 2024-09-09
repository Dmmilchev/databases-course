use movies

--Напишете заявка, която извежда имената на актьорите мъже, участвали в 'Terms of Endearment'
select name
from moviestar join starsin on name = starname
where movietitle = 'Terms of Endearment' and gender = 'M'

--Напишете заявка, която извежда имената на актьорите, участвали във филми, продуцирани от ‘MGM’ през 1995 г.
select starname
from starsin join movie on movietitle = title
where studioname = 'MGM'

--Напишете заявка, която извежда името на президента на ‘MGM’
select movieexec.name
from movieexec join studio on presc# = cert# 
where studio.name = 'MGM'

--Напишете заявка, която извежда имената на всички филми с дължина, по-голяма от дължината на филма ‘Star Wars’
select title
from movie 
where length > (select length from movie where title = 'Star Wars')