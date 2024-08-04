/*1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
ǥ�õǵ��� �Ѵ�.)*/
SELECT STUDENT_NO �й�, STUDENT_NAME  �̸�, ENTRANCE_DATE ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO LIKE '002'
ORDER BY ENTRANCE_DATE ASC;

/*2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
�̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL
������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)*/
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

/*3. �� ������б��� ���� �������� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. �� �̶�
���̰� ���� ������� ���� ��� ����(���̰� ���ٸ� �̸��� ������ ����)�� ȭ�鿡
��µǵ��� ����ÿ�. (��, ���� �� 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�"
���� �Ѵ�. ���̴� ���������� ����Ѵ�.)*/
SELECT PROFESSOR_NAME AS �����̸�
FROM TB_PROFESSOR
WHERE SUBSTR(professor_ssn, 8, 1) = '1' 
ORDER BY FLOOR((SYSDATE - TO_DATE('19' || SUBSTR(professor_ssn, 1, 2) || '-' || SUBSTR(professor_ssn, 3, 2) || '-' || SUBSTR(professor_ssn, 5, 2), 'YYYY-MM-DD')) / 365) ASC,  -- ���� �������� �������� ����
         PROFESSOR_NAME ASC;  


/*4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)*/
SELECT SUBSTR(PROFESSOR_NAME, 2) AS �̸�
FROM TB_PROFESSOR
WHERE LENGTH(SUBSTR(PROFESSOR_NAME, 1, 1)) = 1;  


/*5. �� ������б��� ����� ������ �й��� �̸��� ǥ���Ͻÿ�.(�̶�, 19 �쿡 �����ϸ�
����� ���� ���� ������ ����)*/

SELECT *
FROM TB_STUDENT
WHERE (TO_NUMBER(SUBSTR(STUDENT_SSN, 1, 2)) + 1900) <
      CASE
          WHEN TO_NUMBER(SUBSTR(TO_CHAR(ENTRANCE_DATE, 'YY'), 1, 2)) >= 50 THEN
              TO_NUMBER(SUBSTR(TO_CHAR(ENTRANCE_DATE, 'YY'), 1, 2)) + 1900
          ELSE
              TO_NUMBER(SUBSTR(TO_CHAR(ENTRANCE_DATE, 'YY'), 1, 2)) + 2000
      END - 19
ORDER BY STUDENT_NO;




/*6. 2020 �� ũ���������� ���� �����ΰ�?*/
SELECT TO_CHAR(TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'Day') AS Day_Of_Week
FROM DUAL;

/*7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
�� �� ���� �ǹ��ұ�? �� TO_DATE('99/10/11','RR/MM/DD'),
TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?*/

-- TO_DATE('99/10/11', 'YY/MM/DD'): 1999�� 10�� 11��
-- TO_DATE('49/10/11', 'YY/MM/DD'): 1949�� 10�� 11��
-- TO_DATE('99/10/11', 'RR/MM/DD'): 1999�� 10�� 11��
-- TO_DATE('49/10/11', 'RR/MM/DD'): 2049�� 10�� 11��


/*8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
���� �й��� ���� �л����� �й��� �̸��� �й� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE TO_NUMBER('19' || SUBSTR(ENTRANCE_DATE, 1, 2)) < 2000
  AND STUDENT_NO NOT LIKE 'A%'
ORDER BY STUDENT_NO;



/*9. �й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
�̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
�ڸ������� ǥ���Ѵ�.*/
SELECT ROUND(AVG(POINT), 1) AS "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';




