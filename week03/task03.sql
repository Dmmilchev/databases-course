/*

1. Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.
2. Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка.
3. Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).
4. Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас ‘Kongo’.

*/

/*FIRST TASK*/
SELECT COUNTRY
FROM CLASSES
WHERE NUMGUNS = (SELECT TOP 1 NUMGUNS FROM CLASSES)

/*SECOND TASK*/
SELECT CLASS
FROM SHIPS
WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'sunk')

/*THIRD TASK*/
SELECT NAME
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES WHERE BORE = 16)

/*FOURTH TASK*/
SELECT BATTLE 
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS WHERE CLASS = 'kongo')
