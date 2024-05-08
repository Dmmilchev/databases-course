/*
1. Напишете заявка която извежда производителите на персонални компютри с честота поне 500.
2. Напишете заявка която извежда принтерите с най-висока цена.
3. Напишете заявка която извежда лаптопите чиято честота е по-ниска от честотата на който и да е персонален компютър.
*/

/*FIRST TASK*/
SELECT DISTINCT PRODUCT.MAKER
FROM PRODUCT 
WHERE MODEL IN (SELECT MODEL FROM LAPTOP WHERE SPEED > 500)

/*SECOND TASK*/
SELECT DISTINCT PRINTER.MODEL
FROM PRINTER
WHERE PRINTER.PRICE >= ALL (SELECT PRICE FROM PRINTER)

/*THIRD TASK*/
SELECT DISTINCT LAPTOP.MODEL
FROM LAPTOP
WHERE LAPTOP.SPEED < ALL (SELECT SPEED FROM PC)
