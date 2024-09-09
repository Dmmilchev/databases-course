use pc

--Напишете заявка, която извежда производителите на персонални компютри с честота поне 500.
select distinct maker
from product join pc on product.model = pc.model
where pc.speed >= 500

select distinct maker
from product
where model in (select model from pc where speed >= 500)

--Напишете заявка, която извежда принтерите с най-висока цена.
select model
from printer
where price >= all (select price from printer)

select model 
from printer
where price >= (select max(price) from printer)

--Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от честотата на който и да е персонален компютър.
select model
from laptop 
where speed <= any (select speed from pc)

--Напишете заявка, която извежда модела на продукта (PC, лап топ или принтер) с най-висока цена.
select model
from product
where model in 
(select model from laptop where price >= all (select price from laptop))
union
(select model from printer where  price >= all (select price from printer))
union
(select model from pc where price >= all (select price from pc))

--Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.
select model
from printer
where color = 'y' and price >= all (select price from printer)

--Напишете заявка, която извежда производителите на тези персонални компютри с най-малко RAM памет, които имат най-бързи процесори. 
select maker
from product 
where model in 
(select model from pc where ram <= all (select ram from pc))