/*
1. Напишете заявка, която извежда името на корабите, по-тежки (displacement) от 35000
2. Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на всички кораби, участвали в битката при 'Guadalcanal'
3. Напишете заявка, която извежда имената на тези държави, които имат класове кораби от тип 'bb' и 'bc' едновременно
4. Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по-късно са участвали в друга битка
*/

/*FIRST TASK*/
SELECT s.NAME
FROM SHIPS s JOIN CLASSES c
	ON s.CLASS = c.CLASS
WHERE c.DISPLACEMENT > 35000

/*SECOND TASK*/
SELECT s.NAME, c.BORE, c.NUMGUNS
FROM SHIPS s 
	JOIN CLASSES c ON s.CLASS = c.CLASS
	JOIN OUTCOMES o ON o.SHIP = s.NAME
WHERE o.BATTLE = 'Guadalcanal'


/*THIRD TASK*/
SELECT DISTINCT c1.COUNTRY
FROM CLASSES c1 
    JOIN CLASSES c2 ON c1.COUNTRY = c2.COUNTRY
WHERE c1.TYPE = 'bb' and c2.TYPE = 'bc'

/*FOURTH TASK*/
SELECT DISTINCT o1.SHIP
FROM OUTCOMES o1
    JOIN BATTLES b1 ON o1.BATTLE = b1.NAME
    JOIN OUTCOMES o2 ON o1.SHIP = o2.SHIP
    JOIN BATTLES b2 ON o2.BATTLE = b2.NAME
WHERE o1.RESULT = 'damaged' AND b1.DATE < b2.DATE