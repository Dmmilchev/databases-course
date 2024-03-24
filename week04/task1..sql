/*
1 задача: Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда заглавие, година, име и адрес на студио.
*/
SELECT m.TITLE, m.YEAR, s.NAME, s.ADDRESS
FROM MOVIE m JOIN STUDIO s ON m.STUDIONAME = s.NAME
WHERE m.LENGTH > 120

/*
2 задача: Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
*/
SELECT DISTINCT s.NAME, si.STARNAME
FROM 
STUDIO s 
JOIN MOVIE m ON m.STUDIONAME = s.NAME
JOIN STARSIN si ON si.MOVIETITLE = m.TITLE
ORDER BY s.NAME DESC

/*
3 задача: Напишете заявка, която извежда имената на продуцентите на филмите, в които е играл Harrison Ford.
*/
SELECT DISTINCT me.NAME
FROM 
MOVIEEXEC me 
JOIN MOVIE m ON m.PRODUCERC# = me.CERT#
JOIN STARSIN si ON m.TITLE = si.MOVIETITLE AND m.YEAR = si.MOVIEYEAR
WHERE si.STARNAME = 'Harrison Ford'

/*
4 задача: Напишете заявка, която извежда имената на актрисите, играли във филми на MGM.
*/
SELECT ms.NAME
FROM 
STARSIN si 
JOIN MOVIE m ON m.TITLE = si.MOVIETITLE
JOIN MOVIESTAR ms ON ms.NAME  = si.STARNAME
WHERE m.STUDIONAME = 'MGM' AND ms.GENDER = 'F'

/*
5 задача: Напишете заявка, която извежда името на продуцента и имената на филмите, продуцирани от продуцента на ‘Star Wars’.
*/
SELECT me.NAME, m.TITLE
FROM
MOVIEEXEC me
JOIN MOVIE m ON m.PRODUCERC#  = me.CERT#
WHERE m.PRODUCERC#  = 
(SELECT PRODUCERC# FROM MOVIE WHERE TITLE = 'Star Wars' AND YEAR = 1977)

/*
6 задача: Напишете заявка, която извежда имената на актьорите не участвали в нито един филм.
*/
SELECT ms.NAME
FROM
MOVIESTAR ms 
LEFT OUTER JOIN STARSIN si ON si.STARNAME = ms.NAME
WHERE si.STARNAME = NULL