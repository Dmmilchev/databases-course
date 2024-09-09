use pc

--Напишете заявка, която извежда средната честота на компютрите
select avg(speed)
from pc

--• Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производител
select maker, avg(screen)
from product join laptop on product.model = laptop.model
group by maker

--• Напишете заявка, която извежда средната честота на лаптопите с цена над 1000
select avg(speed)
from laptop
where price >= 1000

--• Напишете заявка, която извежда средната цена на компютрите произведени от
--производител ‘A’
select avg(price)
from laptop join product on laptop.model = product.model
where maker = 'A'

--• Напишете заявка, която извежда средната цена на компютрите и лаптопите за
--производител ‘B’
select avg(u.price) as AvgPrice
from 
(
(select price from laptop join product on laptop.model = product.model where maker = 'B')
union all
(select price from pc join product on pc.model = product.model where maker = 'B')
) u

--• Напишете заявка, която извежда средната цена на компютрите според
--различните им честоти
select speed, avg(price)
from pc 
group by(speed)

--• Напишете заявка, която извежда производителите, които са произвели поне по 3
--различни модела компютъра
select maker
from product join pc on product.model = pc.model
group by maker
having count(pc.model) >= 3

--• Напишете заявка, която извежда производителите на компютрите с най-висока
--цена
select maker
from product join pc on product.model = pc.model
group by product.maker
having max(pc.price) >= (select max(pc.price) from pc)

--• Напишете заявка, която извежда средната цена на компютрите за всяка честота
--по-голяма от 800
select avg(price)
from pc 
group by speed
having speed >= 800

--• Напишете заявка, която извежда средния размер на диска на тези компютри
--произведени от производители, които произвеждат и принтери
select avg(hd)
from pc join product on pc.model = product.model
where product.maker in (select maker from product where type = 'printer')

--• Напишете заявка, която за всеки размер на лаптоп намира разликата в цената на
--най-скъпия и най-евтиния лаптоп със същия размерselect screen, (max(price) - min(price)) as difffrom laptop group by(screen)