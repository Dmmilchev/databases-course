use pc

--Напишете заявка, която извежда производителя и честотата на процесора на тези лаптопи с размер на диска поне 9 GB
select maker, speed
from product join laptop on product.model = laptop.model
where hd >= 9

--Напишете заявка, която извежда номер на модел и цена на всички продукти, произведени от производител с име ‘B’. 
--Сортирайте резултата така, че първо да се изведат най-скъпите продукти
select laptop.model, price
from product join laptop on product.model = laptop.model
where maker = 'B'
union
select printer.model, price
from product join printer on product.model = printer.model
where maker = 'B'
union
select pc.model, price
from product join pc on product.model = pc.model
where maker = 'B'
order by price asc

--Напишете заявка, която извежда размерите на тези дискове, които се предлагат в поне два компютъра
select pc1.hd
from pc pc1 join pc pc2 on pc1.model = pc2.model
where pc1.hd =  pc2.hd

--Напишете заявка, която извежда всички двойки модели на компютри, които имат еднаква честота и памет
--Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i)
select pc1.model, pc2.model
from pc pc1 join pc pc2 on pc1.model < pc2.model
where pc1.hd = pc2.hd and pc1.speed = pc2.speed

select pc1.model, pc2.model
from pc pc1 cross join pc pc2
where pc1.hd = pc2.hd and pc1.speed = pc2.speed and pc1.model != pc2.model


--Напишете заявка, която извежда производителите на поне два различни компютъра с честота на процесора поне 500 MHz.
select maker
from product 
	join pc pc1 on product.model = pc1.model
	join pc pc2 on product.model = pc2.model
	where pc1.model != pc2.model and pc1.speed >= 500 and pc2.speed >= 500

select * from pc