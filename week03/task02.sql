/*

1. Напишете заявка, която извежда производителите на персонални компютри с честота поне 500.
2. Напишете заявка, която извежда принтерите с най-висока цена.
3. Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от честотата на който и да е персонален компютър.
4. Напишете заявка, която извежда модела на продукта (PC, лап топ или принтер) с най-висока цена.
5. Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.
6. Напишете заявка, която извежда производителите на тези персонални компютри с най-малко RAM памет, които имат най-бързи процесори. 

*/

/*FIRST TASK*/
SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT PC.MODEL
FROM PC
WHERE speed > 500)

/*SECOND TASK*/
SELECT MODEL
FROM PRINTER
WHERE PRICE >= ALL (SELECT PRICE FROM PRINTER)

/*THIRD TASK*/
SELECT MODEL
FROM LAPTOP
WHERE SPEED < ALL(SELECT SPEED FROM PC)

/*FOURTH TASK*/
SELECT MODEL, PRICE FROM LAPTOP
UNION
SELECT MODEL, PRICE FROM PC
UNION
SELECT MODEL, PRICE FROM PRINTER
WHERE PRICE >= ALL 
(
SELECT PRICE FROM LAPTOP
UNION
SELECT PRICE FROM PC
UNION
SELECT PRICE FROM PRINTER
)

/*FIFTH TASK*/
SELECT MAKER
FROM PRODUCT
WHERE MODEL IN (SELECT MODEL
FROM PRINTER
WHERE COLOR = 'Y')

/*SIXTH TASK*/
SELECT DISTINCT MAKER
FROM PRODUCT
WHERE PRODUCT.MODEL IN 
(
SELECT PC.MODEL
FROM PC
WHERE PC.RAM <= ALL 
(SELECT pc2.RAM FROM PC AS pc2 WHERE pc2.SPEED >= ALL
(SELECT pc3.SPEED FROM PC AS pc3))
)

SELECT DISTINCT MAKER
FROM PRODUCT 
WHERE PRODUCT.MODEL IN
(SELECT PC.MODEL FROM PC 
WHERE PC.SPEED = (SELECT TOP 1 PC2.SPEED FROM PC AS PC2 
WHERE PC2.RAM <= ALL(SELECT RAM FROM PC) ORDER BY SPEED DESC))

