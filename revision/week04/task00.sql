/*
Задача 1:
За всяка държава да се изведат имената на корабите, които никога не са участвали в битка.
*/
SELECT c.CLASS, s.NAME
FROM CLASSES c
JOIN SHIPS s
ON c.CLASS = s.CLASS 
LEFT OUTER JOIN OUTCOMES o ON s.NAME = o.SHIP
WHERE o.BATTLE IS NULL

/*
Задача 2: 
За всеки клас, да се изведат името му, държавата и имената на всички негови кораби,
пуснати през 1916г. В резултата да участват и класовете без кораби пуснати през 1916г.
*/
SELECT c.CLASS, c.COUNTRY, s.NAME
FROM CLASSES c LEFT OUTER JOIN SHIPS s
ON c.CLASS = s.CLASS
WHERE s.LAUNCHED = 1916

/*
Задача 3: 
За всеки клас британски кораби - да се извлече името на класа и имената на всички битки, 
в които са участвали кораби от този клас. Ако за даден клас няма кораби или те не са участвали 
в битка - да се включат със стойност NULL за името на битката
*/
SELECT s.CLASS, o.BATTLE
FROM SHIPS s RIGHT OUTER JOIN OUTCOMES o
ON s.NAME = o.SHIP
WHERE s.CLASS = 'Gt.Britain'