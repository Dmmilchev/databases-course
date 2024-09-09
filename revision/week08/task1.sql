USE ships
GO

-- 1. Дефинирайте изглед наречен BritishShips, който дава за всеки британски кораб неговият клас, 
--    тип, брой оръдия, калибър, водоизместимост и годината, в която е пуснат на вода

create view BritishShips2 
as
select c.class, c.type, c.numguns, c.bore, c.displacement, s.launched 
from classes c join ships s on c.class = s.CLASS
go

-- 2. Напишете заявка, която използва изгледа от предната задача, за да покаже броят оръдия и 
--    водоизместимост на британските бойни кораби, пуснати на вода преди 1917
select numguns, displacement from BritishShips2 where launched = 1917

-- 3. Напищете съответната SQL заявка, реализираща задача 2, но без да използвате изглед
select c.numguns, c.displacement 
from classes c join ships s on c.class = s.class 
where c.country = 'Gt.Britain' and s.launched = 1917

go

-- 5. Създайте изглед за всички потънали кораби по битки
use ships
go

create view SunkShips
as
select s.name, o.battle
from ships s join outcomes o on s.name = o.ship
where o.result = 'sunk'
go

select * from SunkShips

-- 6. Въведете кораба California като потънал в битката при Guadalcanal чрез изгледа от задача 5.
--    За целта задайте подходяща стойност по премълчаване на колоната result от таблицата Outcomes
alter table outcomes add constraint df default 'sunk' for result
go

insert into SunkShips (name, battle) values('California', 'Guadalcanal')
go

select * from SunkShips
go
-- 7. Създайте изглед за всички класове с поне 9 оръдия. Използвайте WITH CHECK OPTION. Опитайте се 
-- да промените през изгледа броя оръдия на класа Iowa последователно на 15 и 5.
use ships
go

create view AtLeastNineGuns3
as
select class, numguns
from classes
where numguns >= 9
with check option
go

update AtLeastNineGuns3
	set numguns = 15
where class = 'Iowa'

update AtLeastNineGuns3
	set numguns = 5
where class = 'Iowa'

select * from AtLeastNineGuns3
go
-- 8. Променете изгледа от задача 7, така че броят оръдия да може да се променя без ограничения.

alter view AtLeastNineGuns3
as
select class, numguns
from classes
where numguns >= 15
go

-- 9. Създайте изглед с имената на битките, в които са участвали поне 3 кораба с под 9 оръдия и 
--    от тях поне един е бил увреден.
-- to be continued...

