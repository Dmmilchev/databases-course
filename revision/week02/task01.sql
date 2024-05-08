/*
1. �������� ������, ����� ������� ������� �� ��������� ����, ��������� � 'Terms of Endearment'
2. �������� ������, ����� ������� ������� �� ���������, ��������� ��� �����, ����������� �� �MGM� ���� 1995 �.
3. �������� ������, ����� ������� ����� �� ���������� �� �MGM�
4. �������� ������, ����� ������� ������� �� ������ ����� � �������, ��-������ �� ��������� �� ����� �Star Wars�
*/

/* FIRST TASK */
SELECT ms.NAME 
FROM MOVIESTAR ms JOIN STARSIN s
	ON ms.NAME = s.STARNAME
	WHERE s.MOVIETITLE = 'Terms of Endearment'

/* SECOND TASK*/
SELECT s.STARNAME
FROM STARSIN s JOIN MOVIE m
	ON s.MOVIETITLE = m.TITLE
	WHERE m.STUDIONAME = 'MGM' AND m.YEAR = 1995

/*THIRD TASK*/
SELECT m.NAME
FROM STUDIO s JOIN MOVIEEXEC m
	ON CERT# = PRESC#
	WHERE s.NAME = 'MGM'

/* FOURTH TASK*/
SELECT m1.TITLE
FROM MOVIE m1 JOIN MOVIE m2
	ON m1.LENGTH  > m2.LENGTH
	WHERE m2.TITLE = 'Star Wars'