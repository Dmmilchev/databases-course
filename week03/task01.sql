/*

1. Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетна стойност по-голяма от 10 милиона.
2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти.
3. Напишете заявка, която извежда имената на всички филми с дължина по-голяма от дължината на филма ‘Gone With the Wind’
4. Напишете заявка, която извежда имената на продуцентите и имената на продукциите за които стойността им е по-голяма от продукциите на продуценти ‘Mery Griffin’ 

*/

/*FIRST TASK*/
SELECT ms.NAME 
FROM MOVIESTAR ms
WHERE ms.GENDER = 'F' AND ms.NAME IN (SELECT NAME
			FROM  MOVIEEXEC
			WHERE NETWORTH > 1)

/*SECOND TASK*/
SELECT ms.NAME
FROM MOVIESTAR ms
WHERE ms.NAME NOT IN (SELECT me.NAME FROM MOVIEEXEC me)

/*THIRD TASK*/
SELECT m1.TITLE
FROM MOVIE m1
WHERE m1.LENGTH > (SELECT m2.LENGTH
					FROM MOVIE m2
					WHERE m2.TITLE = 'Gone With the Wind')
					
/*FOURTH TASK*/
SELECT m.TITLE, me.NAME
FROM MOVIE m, MOVIEEXEC me
WHERE me.NETWORTH > (SELECT NETWORTH
					FROM MOVIEEXEC
					WHERE m.PRODUCERC# = CERT# 
					AND NAME = 'merv griffin')
