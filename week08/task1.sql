-- Използвайте Movies, PC и Ships от базата mods, в които няма ограничения за референтна цялост и т.н.
use mods
-- Да се добави информация за актрисата Nicole Kidman. За нея знаем само, че е родена на 20-и юни 1967.

insert into dbo.MOVIESTAR (BIRTHDATE, NAME, GENDER) values(CAST('1967-06-20' AS DATE), 'Nicole Kidman', 'F')

-- Да се изтрият всички продуценти с печалба (networth) под 10 милиона.

delete from dbo.MOVIEEXEC where NETWORTH <= 10000000

-- Да се изтрие информацията за всички филмови звезди, за които не се знае адреса.

delete from dbo.MOVIESTAR where ADDRESS = NULL

-- Използвайки две INSERT заявки, съхранете в базата данни факта, че персонален компютър модел 1100 е направен от производителя C, има процесор 2400 MHz,
-- RAM 2048 MB, твърд диск 500 GB, 52x DVD устройство и струва $299. Нека новият компютър има код 12. Забележка: моделът и CD са от тип низ.
-- Упътване: самото вмъкване на данни е очевидно как ще стане, помислете в какъв ред е по-логично да са двете заявки.

INSERT INTO product VALUES ('C', '1100', 'PC') -- първо е нужно да направим тази заявка, защото двете таблици са свързани с foreign key
INSERT INTO pc VALUES (12, '1100', 2400, 2048, 500, '52x', 299)

-- Да се изтрие всичката налична информация за компютри модел 1100.

delete from dbo.pc where model ='1100'

-- За всеки персонален компютър се продава и 15-инчов лаптоп със същите параметри, но с $500 по-скъп. Кодът на такъв лаптоп е със 100 по-голям от
-- кода на съответния компютър. Добавете тази информация в базата.

insert into dbo.laptop (code, model, speed, ram, hd, price, screen) 
	select (pc.code + 100) as code, model, speed, ram, hd, (pc.price + 500) as price ,15
	from dbo.pc 

-- Да се изтрият всички лаптопи, направени от производител, който не произвежда принтери.
-- Упътване: Мислете си, че решавате задача от познат тип - "Да се изведат всички лаптопи, ...". 
-- Накрая ще е нужна съвсем малка промяна. Ако започнете директно да триете, много е вероятно при някой грешен опит да изтриете всички лаптопи и ще 
-- трябва често да възстановявате таблицата или да работите на сляпо.

delete from laptop where model in 
	(
	select model from product 
	where product.type = 'Laptop' and product.maker not in (select maker from product where product.type = 'printer')
	)

-- Производител А купува производител B. На всички продукти на В променете производителя да бъде А.

update product 
set maker = 'B'
where maker = 'A'

-- Да се намали два пъти цената на всеки компютър и да се добавят по 20 GB към всеки твърд диск. Упътване: няма нужда от две отделни заявки.

update pc
set price = price / 2, hd = (hd + 20)

-- За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.

update laptop 
set screen = screen + 1 
where model in (select model from product where product.type = 'Laptop' and maker = 'B')

-- Два британски бойни кораба от класа Nelson - Nelson и Rodney - са били пуснати на вода едновременно през 1927 г.
-- Имали са девет 16-инчови оръдия (bore) и водоизместимост от 34 000 тона (displacement). Добавете тези факти към базата от данни.

insert into classes (class, bore, DISPLACEMENT, type, COUNTRY) values ('Nelson', 16, 34000, 'bb', 'Gt. Britain')
insert into ships values ('Nelson', 'Nelson', 1927), ('Rodney', 'Nelson', 1927)

-- Изтрийте от Ships всички кораби, които са потънали в битка.

delete from ships 
where ships.name in (select ship from outcomes where result = 'sunk')

-- Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри (в момента е в инчове, 1 инч ~ 2.5 см) и
-- водоизместимостта да се измерва в метрични тонове (1 м.т. = 1.1 т.)

update classes
set bore = bore * 2.5, displacement = displacement * 1.1

-- Изтрийте всички класове, от които има по-малко от три кораба.

delete classes
where class in (select class from ships group by class having count(*) <= 3)

-- Променете калибъра на оръдията и водоизместимостта на класа Iowa, така че да са същите като тези на класа Bismarck.

update classes
set bore = (select distinct bore from classes where class = 'Bismarck'), displacement = (select distinct displacement where class = 'Bismarck' )