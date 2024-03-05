/*
1. �������� ������, ����� ������� ������� �� ��������� ����, ��������� � 'Terms of Endearment'
2. �������� ������, ����� ������� ������� �� ���������, ��������� ��� �����, ����������� �� �MGM� ���� 1995 �.
3. �������� ������, ����� ������� ����� �� ���������� �� �MGM�
4. �������� ������, ����� ������� ������� �� ������ ����� � �������, ��-������ �� ��������� �� ����� �Star Wars�
*/

/*FIRST TASK*/
SELECT ms.NAME
FROM MOVIESTAR ms JOIN STARSIN si
	ON ms.NAME = si.STARNAME
WHERE si.MOVIETITLE = 'Terms of Endearment'

/*SECOND TASK*/
SELECT si.STARNAME
FROM MOVIE m JOIN STARSIN si 
	ON si.MOVIETITLE = m.TITLE 
WHERE m.YEAR = 1995 AND m.STUDIONAME = 'MGM'

/*THIRD TASK*/
SELECT me.NAME
FROM STUDIO s
	JOIN MOVIEEXEC me ON s.PRESC# = me.CERT#
WHERE s.NAME = 'MGM'

/*FOURTH TASK*/
SELECT m2.TITLE
FROM MOVIE m1 JOIN MOVIE m2
	ON m1.TITLE = 'Star Wars' AND m1.YEAR = 1977
WHERE m1.LENGTH < m2.LENGTH