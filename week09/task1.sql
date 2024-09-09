USE ships
go

-- 1. Дефинирайте изглед наречен BritishShips, който дава за всеки британски кораб неговият клас, 
--    тип, брой оръдия, калибър, водоизместимост и годината, в която е пуснат на вода

create view BritishShips (class, type, numguns, displacement, launched)
as
select c.class, c.type, c.numguns, c.displacement, s.launched
from classes c join ships s on c.class = s.class
where c.country = 'Gt. Britain'
go

select * from BritishShips
-- 2. Напишете заявка, която използва изгледа от предната задача, за да покаже броят оръдия и 
--    водоизместимост на британските бойни кораби, пуснати на вода преди 1917

select numguns, displacement
from BritishShips
where launched = 1917

-- 3. Напищете съответната SQL заявка, реализираща задача 2, но без да използвате изглед

select c.numguns, c.displacement
from classes c join ships s on c.class = s.class
where c.country = 'Gt. Britain' and s.launched = 1917

-- 4. Средната стойност на най-тежките класове кораби от всяка страна
--    Презюмираме, че може да има повече от един клас с максималната изместимост за страна

use ships
go 

create view AverageMaxes
as
select avg(maxdisplacement) avgmax
from classes c
    join (select country, max(displacement) as maxdisplacement
          from classes
          group by country) m on c.country = m.country and c.displacement = m.maxdisplacement
go

-- 5. Създайте изглед за всички потънали кораби по битки

use ships
go 

create view SunkShips
as
select ship, battle
from outcomes
where result = 'sunk'
go

-- 6. Въведете кораба California като потънал в битката при Guadalcanal чрез изгледа от задача 5.
--    За целта задайте подходяща стойност по премълчаване на колоната result от таблицата Outcomes

alter table outcomes add constraint def_res default 'sunk' for result
go

insert into SunkShips values ('California', 'Guadalcanal')
go

alter table outcomes drop constraint def_res
go

-- 7. Създайте изглед за всички класове с поне 9 оръдия. Използвайте WITH CHECK OPTION. Опитайте се 
-- да промените през изгледа броя оръдия на класа Iowa последователно на 15 и 5.

create view numguns9
as
select *
from classes
where numguns >= 9
with check option
go

update numguns9 set numguns = 15 where class = 'Iowa'

-- Следващото не работи, заради WITH CHECK OPTION. Подобна модификация би извадила обновявания запис
-- извън обсега на изгледа.
update numguns9 set numguns = 15 where class = 'Iowa'

-- 8. Променете изгледа от задача 7, така че броят оръдия да може да се променя без ограничения.

use ships
go

create view numguns92
as
select *
from classes
where numguns >= 9
go