/*
1 задача:
Напишете заявка, която извежда броя на класовете кораби
*/
SELECT COUNT(class) AS shipclasses
FROM classes

/*
2 задача:
Напишете заявка, която извежда средния брой на оръжия за всички кораби, пуснати на вода
*/
SELECT AVG(numguns) AS AVGNUMGUNS
FROM classes JOIN ships ON classes.class = ships.class
WHERE NOT (ships.launched IS NULL)

/*
3 задача:
Напишете заявка, която извежда за всеки клас първата и последната година, в която кораб от съответния клас е пуснат на вода
*/
SELECT MIN(LAUNCHED) AS FIRSTLAUNCH, MAX(LAUNCHED) AS LASTLAUNCH
FROM SHIPS
GROUP BY SHIPS.CLASS

/*
4 задача:
Напишете заявка, която извежда броя на корабите потънали в битка според класа
*/
SELECT COUNT(NAME) AS COUNTOFSINK
FROM SHIPS
GROUP BY CLASS

/*
5 задача:
Напишете заявка, която извежда средното тегло на корабите, за всяка страна. 
*/
SELECT COUNTRY, AVG(DISPLACEMENT) AS AVGDIS
FROM CLASSES
GROUP BY COUNTRY