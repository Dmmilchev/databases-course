/*
Напишете заявка, която извежда производител, модел и тип на продукт за тези производители, за които съответния продукт не се продава 
(няма го в таблиците PC, лаптоп или принтер).
*/
SELECT p.MAKER, p.MODEL, p.TYPE
FROM
PRODUCT p
LEFT OUTER JOIN 
(SELECT MODEL FROM LAPTOP
UNION 
SELECT MODEL FROM PC
UNION
SELECT MODEL FROM PRINTER) ct ON p.MODEL = ct.MODEL
WHERE ct.MODEL IS NULL

