/*
1. �������� ������ ����� ������� ��������������� �� ���������� �������� � ������� ���� 500.
2. �������� ������ ����� ������� ���������� � ���-������ ����.
3. �������� ������ ����� ������� ��������� ����� ������� � ��-����� �� ��������� �� ����� � �� � ���������� ��������.
*/

/*FIRST TASK*/
SELECT DISTINCT PRODUCT.MAKER
FROM PRODUCT 
WHERE MODEL IN (SELECT MODEL FROM LAPTOP WHERE SPEED > 500)

/*SECOND TASK*/
SELECT DISTINCT PRINTER.MODEL
FROM PRINTER
WHERE PRINTER.PRICE >= ALL (SELECT PRICE FROM PRINTER)

/*THIRD TASK*/
SELECT DISTINCT LAPTOP.MODEL
FROM LAPTOP
WHERE LAPTOP.SPEED < ALL (SELECT SPEED FROM PC)
