-- 1. За всяка филмова звезда да се изведе името, рождената дата и с кое
--    студио е записвала най-много филми. (Ако има две студиа с еднакъв 
--    брой филми, да се изведе кое да е от тях)

-- 2. Да се изведат всички производители, за които средната цена на 
--    произведените компютри е по-ниска от средната цена на техните лаптопи.
USE pc

SELECT p.maker
FROM PRODUCT p JOIN PC pc ON p.model = pc.model
GROUP BY p.maker
HAVING AVG(pc.price) < (SELECT AVG(l.price) 
						FROM product p2 JOIN LAPTOP l ON p2.model = l.model
						WHERE p2.maker = p.maker)

-- 3. Един модел компютри може да се предлага в няколко конфигурации 
--    с евентуално различна цена. Да се изведат тези модели компютри,
--    чиято средна цена (на различните му конфигурации) е по-ниска
--    от най-евтиния лаптоп, произвеждан от същия производител.
USE pc

SELECT pc.model
FROM PC pc JOIN PRODUCT p ON pc.model = p.model
GROUP BY pc.MODEL, p.MAKER
HAVING AVG(pc.price) < (SELECT AVG(l.price)
						FROM PRODUCT p2 JOIN LAPTOP l ON p2.model = l.model
						WHERE p2.maker = p.maker)

-- 4. Битките, в които са участвали поне 3 кораба на една и съща страна.
USE ships

SELECT DISTINCT o.BATTLE
FROM OUTCOMES o 
	JOIN SHIPS s ON s.NAME = o.SHIP
	JOIN CLASSES c ON s.NAME = c.CLASS
GROUP BY c.COUNTRY, o.BATTLE
HAVING COUNT(*) >= 3

-- 5. За всеки кораб да се изведе броят на битките, в които е бил увреден.
--    Ако корабът не е участвал в битки или пък никога не е бил
--    увреждан, в резултата да се вписва 0.
USE ships

SELECT s.NAME, COUNT(o.RESULT)
FROM SHIPS s LEFT OUTER JOIN OUTCOMES o ON s.NAME = o.SHIP AND o.RESULT = 'damaged'
GROUP BY s.NAME

-- 6. За всеки клас да се изведе името, държавата и първата година, в която 
--    е пуснат кораб от този клас
USE ships

SELECT s.NAME, c.COUNTRY, MIN(s.LAUNCHED)
FROM SHIPS s JOIN CLASSES c ON s.NAME = c.CLASS
GROUP BY s.NAME, c.COUNTRY

-- 7. За всяка държава да се изведе броят на корабите и броят на потъналите 
--    кораби. Всяка от бройките може да бъде и нула.
USE ships

SELECT c.COUNTRY, COUNT(s.NAME), COUNT(o.RESULT)
FROM CLASSES c
	LEFT OUTER JOIN SHIPS s ON c.CLASS = s.NAME
	LEFT OUTER JOIN OUTCOMES o ON s.NAME = o.SHIP AND o.RESULT = 'sunk'
GROUP BY c.COUNTRY
	

-- 8. Намерете за всеки клас с поне 3 кораба броя на корабите от 
--    този клас, които са с резултат ok.



-- 9. За всяка битка да се изведе името на битката, годината на 
--    битката и броят на потъналите кораби, броят на повредените
--    кораби и броят на корабите без промяна.

-- 10. Да се изведат имената на корабите, които са участвали в битки в
--     продължение поне на две години.
USE ships

SELECT o.SHIP
FROM OUTCOMES o LEFT OUTER JOIN BATTLES b ON o.BATTLE = b.NAME
GROUP BY o.SHIP
HAVING YEAR(MAX(b.DATE)) - YEAR(MIN(b.DATE)) >= 2

-- 11. За всеки потънал кораб колко години са минали от пускането му на вода 
--     до потъването.
USE ships

SELECT s.NAME, YEAR(b.DATE) - s.LAUNCHED
FROM SHIPS s 
	JOIN OUTCOMES o ON s.NAME = o.SHIP
	JOIN BATTLES b ON b.NAME = o.BATTLE
 WHERE o.RESULT = 'sunk'

-- 12. Имената на класовете, за които няма кораб, пуснат на вода след 1921 г., 
--     но имат пуснат поне един кораб.
USE ships

SELECT CLASS
FROM SHIPS 
GROUP BY CLASS
HAVING MAX(LAUNCHED) <= 1921