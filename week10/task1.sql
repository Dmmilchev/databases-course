--1. Добавете Брус Уилис в базата. Направете така, че при добавяне на филм, чието заглавие съдържа “save” или “world”, Брус save” или “save” или “world”, Брус world”,
--Брус Уилис автоматично да бъде добавен като
--актьор, играл във филма.
use mods
go

insert into moviestar values('Bruce Willis', 'something', 'M', '1965-08-15')
go

create trigger BruceWillis
on movie after insert
as
insert into starsin (movietitle, movieyear, starname)
select title, year, 'Bruce Willis' from inserted
where title like '@save@' and title like '@world@'
go

--2. Да се направи така, че да не е възможно средната стойност на Networth да е помалка от 500 000 (ако при промени в таблицата MovieExec тази стойност стане 
--по-малка от 500 000, промените да бъдат отхвърлени).
create trigger AvgNetworth on movieexec after insert, update, delete
as
	if ((select avg(networth) from movieexec) <= 500000)
		throw 50001, 'data integrity', 1;
go

--3. MS SQL не поддържа ON DELETE SET NULL. Да се реализира с тригер за външния ключ Movie.producerc#.
create trigger OnDeleteSetNull on movie instead of delete
as
	update movie
	set producerc# = NULL
	where producerc# in (select producerc# from deleted)

	delete from movieexec
	where cert# in (select producerc# from deleted)
go

--4. При добавяне на нов запис в StarsIn, ако новият ред указва несъществуващ филм или актьор, да се добавят липсващите данни в съответната таблица
--(неизвестните данни да бъдат NULL).
create trigger addNewFilmOrActor on starsin after insert 
as
	insert into moviestar(name)
	select starname from inserted
	where starname not in (select name from moviestar)

	insert into movie(title, year)
	select movietitle, movieyear from inserted
	where movietitle not in (select title from movie)
go


--5. Да се направи така, че при изтриване на лаптоп на производител D автоматично да се добавя PC със същите параметри в таблицата с компютри. Моделът на
--новите компютри да бъде ‘1121’, CD устройството да бъде ‘52x’, а кодът - със 100 по-голям от кода на лаптопа.
create trigger addPC on laptop after delete
as
	insert into pc(code, model, speed, ram, hd, cd, price)
	select (code + 100) as code, '1121', speed, ram, hd, '52x', price from 
		deleted join product on deleted.model = product.model
		where product.maker = 'D'
go

--6. При промяна на цената на някой компютър се уверете, че няма по-евтин компютър със същата честота на процесора.
create trigger checkPcPrice on pc after update
as
	if exists (select * from inserted join pc on inserted.speed = pc.speed
				where inserted.price >= pc.price)
				throw 500001, 'invalid price', 4;
go

--7. Никой производител на компютри не може да произвежда и принтери.
create trigger cantProducePrinterAndPc on product after insert, update
as
	if exists (select * from product p1 join product p2 on p1.maker = p2.maker
				where p1.type = 'pc' and p2.type = 'printer')
		throw 500001, 'data integration', 10;
go

--8. Всеки производител на компютър трябва да произвежда и лаптоп, който да има същата или по-висока честота на процесора.

--9. При промяна на данните в таблицата Laptop се уверете, че средната цена на лаптопите за всеки производител е поне 2000.

--10. Ако някой лаптоп има повече памет от някой компютър, трябва да бъде и по-скъп от него.

--11. Да приемем, че цветните матрични принтери (type = 'Matrix') са забранени за продажба. При добавяне на принтери да се игнорират цветните матрични
--. Ако с една заявка се добавят няколко принтера, да се добавят само тези, които не са забранени, а другите да се игнорират.

--12. Ако бъде добавен нов клас с водоизместимост по-голяма от 35000, класът да бъде добавен в таблицата, но да му се зададе водоизместимост 35000.

--13. Създайте изглед, който показва за всеки клас името му и броя кораби (евентуално 0). Направете така, че при изтриване на ред да се изтрие класът 
--и всички негови кораби.

--14. Никой клас не може да има повече от два кораба.

--15. Кораб с повече от 9 оръдия не може да участва в битка с кораб, който е с помалко от 9 оръдия. Напишете тригер за Outcomes.

--16. Кораб, който вече е потънал, не може да участва в битка, чиято дата е след датата на потъването му. Напишете тригери за всички таблици, 
--за които е необходимо.