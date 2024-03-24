/*
1 задача:
Напишете заявка, която за всеки кораб извежда името му, държавата, броя оръдия и годината на пускане (launched).
*/
SELECT s.NAME, c.COUNTRY, c.NUMGUNS, s.LAUNCHED
FROM 
SHIPS s 
JOIN CLASSES c ON c.CLASS = s.CLASS

/*
2 задача:
Напишете заявка, която извежда имената на корабите, участвали в битка от 1942г.
*/
SELECT o.SHIP
FROM 
OUTCOMES o
JOIN BATTLES b ON b.NAME = o.BATTLE
WHERE YEAR(b.DATE) = 1942

/*
3 задача: 
За всяка страна изведете имената на корабите, които никога не са участвали в битка.
*/
SELECT c.COUNTRY, s.NAME
FROM 
CLASSES c
JOIN SHIPS s ON s.CLASS = c.CLASS
LEFT OUTER JOIN OUTCOMES o ON o.SHIP = s.NAME
WHERE o.SHIP IS NULL
