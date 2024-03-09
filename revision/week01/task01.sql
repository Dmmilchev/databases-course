--Напишете заявка, която извежда имената всички изпълнители на филми с нетна стойност над 10 000 000 долара
SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000

--Напишете заявка, която извежда имената на всички актьори, които са мъже или живеят в Malibu
SELECT NAME FROM MOVIESTAR WHERE GENDER = 'M' OR ADDRESS ='malibu'
