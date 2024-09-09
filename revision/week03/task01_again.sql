--Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетна стойност по-голяма от 10 милиона.
select ms.name 
from moviestar ms
where gender = 'F' and ms.name in 
(select me.name from movieexec me where me.networth >= 100000)

--Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти.
select ms.name
from moviestar ms
where ms.name not in 
(select me.name from movieexec me)

--Напишете заявка, която извежда имената на всички филми с дължина по-голяма от дължината на филма ‘Gone With the Wind’
select title 
from movie m1 
where m1.length > (select length from movie m2 where m2.title = 'Gone With the Wind')

--Напишете заявка, която извежда имената на продуцентите и имената на продукциите за които стойността им е по-голяма от продукциите на продуценти ‘Mery Griffin’ 
--      В базата MOVIES няма стойност на продукции и затова интерпретираме това 
--      условие като:
--      Имената на продуцентите и продукциите, правени от продуценти с NETWORTH
--      по-голям от NETWORTH-a на 'Merv Griffin'
select title, name
from movie join movieexec on producerc# = cert# 
where networth > (select networth from movieexec where name = 'Merv Griffin')