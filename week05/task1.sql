/* 
1 задача: Напишете заявка, която извежда средната честота на компютрите*/SELECT AVG(speed) FROM pcGROUP BY speed/*2 задача:Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител
*/
SELECT AVG(screen)
FROM 
laptop l JOIN product p ON  l.model = p.model
GROUP BY p.maker

/*
3 задача:
Напишете заявка, която извежда средната честота на лаптопите с цена над 1000*/
SELECT AVG(hd)
FROM laptop WHERE price > 1000

/*
4 задача:
Напишете заявка, която извежда средната цена на компютрите произведени от производител ‘A’*/
SELECT AVG(pc.price)
FROM pc pc JOIN product p ON pc.model = p.model
WHERE p.maker = 'A'

/*
5 задача:
Напишете заявка, която извежда средната цена на компютрите и лаптопите за производител ‘B’
*/

SELECT AVG(pcl.price)
FROM 
(SELECT model, price FROM pc
UNION
SELECT model, price FROM laptop) pcl
JOIN product p ON pcl.model = p.model
WHERE p.maker = 'B'

/*
6 задача:
Напишете заявка, която извежда средната цена на компютрите според различните им честоти
*/
SELECT AVG(price)
FROM pc
GROUP BY speed

/*
7 задача:
Напишете заявка, която извежда производителите, които са произвели поне по 3 различни модела компютъра
*/
SELECT p.maker, COUNT(pc.model)
FROM product p JOIN pc ON p.model = pc.model
GROUP BY p.maker
HAVING COUNT(pc.model) >= 3

/*
8 задача:
Напишете заявка, която извежда производителите на компютрите с най-висока цена
*/
SELECT p.maker
FROM product p JOIN pc ON p.model = pc.model
WHERE pc.price = (SELECT MAX(price) FROM pc)

/*
9 задача:
Напишете заявка, която извежда средната цена на компютрите за всяка честота по-голяма от 800*/SELECT AVG(PRICE)FROM pc WHERE speed > 800/*10 задача:Напишете заявка, която извежда средния размер на диска на тези компютри произведени от производители, които произвеждат и принтери
*/
SELECT AVG(pc.hd)
FROM pc JOIN product ON pc.model = product.model
WHERE product.maker IN (SELECT product.maker FROM product JOIN printer ON product.model = printer.model)

/*
11 задача:
Напишете заявка, която за всеки размер на лаптоп намира разликата в цената на най-скъпия и най-евтиния лаптоп със същия размер
*/
SELECT screen, MAX(price) - MIN(price) AS PriceDiff
FROM laptop
GROUP BY screen