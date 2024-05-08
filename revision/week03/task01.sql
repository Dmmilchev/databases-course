/*
1. �������� ������, ����� ������� ������� �� ���������, ����� �� ���� � ���������� � ����� �������� ��-������ �� 10 �������.
2. �������� ������, ����� ������� ������� �� ���� ������� (���� � ����), ����� �� �� ����������.
3. �������� ������, ����� ������� ������� �� ������ ����� � ������� ��-������ �� ��������� �� ����� �Gone With the Wind�
*/

/*FIRST TASK*/
SELECT ms.NAME 
FROM MOVIESTAR ms
WHERE ms.GENDER = 'F' AND ms.NAME IN (SELECT NAME
FROM  MOVIEEXEC
WHERE NETWORTH > 1)

/*SECOND TASK*/
SELECT s.STARNAME
FROM STARSIN s
WHERE s.STARNAME NOT IN (SELECT NAME FROM MOVIEEXEC)

/*THIRD TASK*/
SELECT m1.TITLE
FROM MOVIE m1 JOIN MOVIE m2
ON m1.LENGTH > m2.LENGTH
WHERE m2.TITLE = 'Gone With the Wind'
