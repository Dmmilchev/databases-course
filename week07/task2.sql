-- 1. Създайте нова база от данни с име test

create database test

-- 2. Дефинирайте следните релации:
-- а) Product(maker, model, type), където моделът е низ от точно 4 символа, maker - един символ, 
--    а type - низ до 7 символа
-- б) Printer(code, model, color, price), където code е цяло число, color е 'y' или 'n' и по 
--    подразбиране е 'n', price - цена с точност до два знака след десетичната запетая
-- в) Classes(class, type), където class е до 50 символа, а type може да бъде 'bb' или 'bc'

use test

create table product (
	maker char(1), 
	model char(4), 
	type varchar(7)
)

create table printer (
	code int, 
	model char(4),
	color char(1) check (color like 'y' or color like 'n') default 'n',
	price decimal(9, 2)
)

create table classes (
	class varchar(50),
	type char(2) check (type like 'bb' or type like 'bc')
)

-- 2. Добавете кортежи с примерни данни към новосъздадените релации. Добавете информация за принтер, 
--    за когото знаем само кода и модела.

INSERT INTO product VALUES ('a', 'abcd', 'printer')

INSERT INTO printer (code, model) VALUES (1, 'abcd')

INSERT INTO classes VALUES ('Bismark', 'bb')
-- 3. Добавете към Classes атрибут bore - число с плаваща запетая.

alter table  classes add bore float

-- 4. Напишете заявка, която премахва атрибута price от Printer.

alter table printer drop column price

-- 5. Изтрийте всички таблици, които сте създали в това упражнение.

drop table product
drop table printer
drop table classes

-- 6. Изтрийте базата test

use master

drop database test
