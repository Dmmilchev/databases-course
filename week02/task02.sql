/*
1. Напишете заявка, която извежда производителя и честотата на процесора на тези лаптопи с размер на диска поне 9 GB

2. Напишете заявка, която извежда номер на модел и цена на всички продукти, произведени от производител с име ‘B’. Сортирайте резултата така, 
че първо да се изведат най-скъпите продукти

3. Напишете заявка, която извежда размерите на тези дискове, които се предлагат в поне два компютъра

4. Напишете заявка, която извежда всички двойки модели на компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж,
например само (i, j), но не и (j, i)

5. Напишете заявка, която извежда производителите на поне два различни компютъра с честота на процесора поне 500 MHz.
*/

/*FIRST TASK*/
SELECT p.MAKER, l.SPEED
FROM PRODUCT p JOIN LAPTOP l 
	ON p.MODEL = l.MODEL
WHERE l.HD >= 9

/*SECOND TASK*/
SELECT a.MODEL, a.PRICE
FROM PRODUCT p 
JOIN (SELECT MODEL, PRICE FROM LAPTOP
	UNION
	SELECT MODEL, PRICE FROM PC
	UNION
	SELECT MODEL, PRICE FROM PRINTER) a 
	ON p.MODEL = a.MODEL
WHERE p.MAKER = 'B'
ORDER BY PRICE DESC

/*THIRD TASK*/
SELECT DISTINCT pc1.HD
FROM PC pc1 JOIN PC pc2
	ON pc1.code != pc2.code
WHERE pc1.hd = pc2.hd

/*FOURTH TASK*/
SELECT DISTINCT pc1.model, pc2.model
FROM PC pc1 JOIN PC pc2
	ON pc1.model < pc2.model
WHERE pc1.ram = pc2.ram AND pc1.hd = pc2.hd

/*FIFTH TASK*/
SELECT DISTINCT p.maker
FROM PRODUCT p
	JOIN PC pc1 ON p.model = pc1.model
	JOIN PC pc2 ON p.model = pc2.model
WHERE pc1.code != pc2.code 
	AND pc1.speed >= 500 
	AND pc2.speed >= 500