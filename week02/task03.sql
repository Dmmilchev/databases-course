/*
1. �������� ������, ����� ������� ����� �� ��������, ��-����� (displacement) �� 35000
2. �������� ������, ����� ������� �������, ����������������� � ���� ������ �� ������ ������, ��������� � ������� ��� 'Guadalcanal'
3. �������� ������, ����� ������� ������� �� ���� �������, ����� ���� ������� ������ �� ��� 'bb' � 'bc' ������������
4. �������� ������, ����� ������� ������� �� ���� ������, ����� �� ���� ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����
*/

/*FIRST TASK*/
SELECT s.NAME
FROM SHIPS s JOIN CLASSES c
	ON s.CLASS = c.CLASS
WHERE c.DISPLACEMENT > 35000

/*SECOND TASK*/
SELECT s.NAME, c.BORE, c.NUMGUNS
FROM SHIPS s 
	JOIN CLASSES c ON s.CLASS = c.CLASS
	JOIN OUTCOMES o ON o.SHIP = s.NAME
WHERE o.BATTLE = 'Guadalcanal'


/*THIRD TASK*/
SELECT DISTINCT c1.COUNTRY
FROM CLASSES c1 
    JOIN CLASSES c2 ON c1.COUNTRY = c2.COUNTRY
WHERE c1.TYPE = 'bb' and c2.TYPE = 'bc'

/*FOURTH TASK*/
SELECT DISTINCT o1.SHIP
FROM OUTCOMES o1
    JOIN BATTLES b1 ON o1.BATTLE = b1.NAME
    JOIN OUTCOMES o2 ON o1.SHIP = o2.SHIP
    JOIN BATTLES b2 ON o2.BATTLE = b2.NAME
WHERE o1.RESULT = 'damaged' AND b1.DATE < b2.DATE