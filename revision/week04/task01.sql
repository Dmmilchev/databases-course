-- 1.1. Напишете заявка, която за всеки филм, по-дълъг от 120 минути,
--      извежда заглавие, година, име и адрес на студио.
SELECT m.TITLE, m.YEAR, m.STUDIONAME, s.ADDRESS
FROM MOVIE m JOIN STUDIO s
ON m.STUDIONAME = s.NAME
WHERE m.LENGTH > 120

-- 1.2. Напишете заявка, която извежда името на студиото и имената на
--      актьорите, участвали във филми, произведени от това студио,
--      подредени по име на студио.
SELECT DISTINCT s.STARNAME, m.STUDIONAME
FROM STARSIN s JOIN MOVIE m
ON s.MOVIETITLE = m.TITLE
ORDER BY m.STUDIONAME ASC

-- 1.3. Напишете заявка, която извежда имената на продуцентите на филмите,
--      в които е играл Harrison Ford.
SELECT DISTINCT me.NAME
FROM MOVIEEXEC me 
	JOIN MOVIE m ON me.CERT# = m.PRODUCERC#
	JOIN STARSIN s ON m.TITLE = s.MOVIETITLE
WHERE s.STARNAME = 'Harrison Ford'

-- 1.4. Напишете заявка, която извежда имената на актрисите, играли във
--      филми на MGM.
SELECT DISTINCT ms.NAME
FROM MOVIESTAR ms 
	JOIN STARSIN s ON ms.NAME = s.STARNAME
	JOIN MOVIE m ON s.MOVIETITLE = m.TITLE
WHERE m.STUDIONAME = 'MGM' AND ms.GENDER = 'F'


-- 1.5. Напишете заявка, която извежда името на продуцента и имената на
--      филмите, продуцирани от продуцента на 'Star Wars'.
SELECT *
FROM MOVIE m
JOIN MOVIEEXEC e ON e.CERT# = m.PRODUCERC#
WHERE m.PRODUCERC# = (SELECT PRODUCERC# 
                      FROM MOVIE 
					  WHERE TITLE = 'Star Wars' AND YEAR = 1977)