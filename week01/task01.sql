/*
Напишете заявка, която извежда адресът на студио ‘MGM’
Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock
Напишете заявка, която извежда имената на всички актьори, които са участвали във филм през 1980, в заглавието на които има думата ‘Empire’
Напишете заявка, която извежда имената всички изпълнители на филми с нетна стойност над 10 000 000 долара
Напишете заявка, която извежда имената на всички актьори, които са мъже или живеят в Malibu
*/

SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM'

SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock'

SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR >= 1980 AND MOVIETITLE LIKE '%Empire%'

SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH >= 10000000

SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'm' OR 
	ADDRESS LIKE '%Malibu%'