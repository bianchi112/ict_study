-- JOIN ��������

--1. 2020�� 12�� 25���� ���� �������� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'Day') AS Day_of_Week
FROM dual;


--2. �ֹι�ȣ�� 60��� ���̸鼭 ������ �����̰�, ���� �达�� �������� 
--�����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       E.EMP_NO AS �ֹι�ȣ,
       D.DEPT_NAME AS �μ���,
       J.JOB_TITLE AS ���޸�  
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE SUBSTR(E.EMP_NO, 1, 2) BETWEEN '60' AND '69' 
  AND DECODE(SUBSTR(E.EMP_NO, 8, 1), '1', '��', '3', '��', '��') = '��' 
  AND E.EMP_NAME LIKE '��%'  
ORDER BY E.EMP_NAME;



--3. ���� ���̰� ���� ������ ���, �����, ����, �μ���, ���޸��� ��ȸ�Ͻÿ�.
-- ���� ���� ���� ���̰� ���� ���� ã��
SELECT E.EMP_ID AS ���,
       E.EMP_NAME AS �����,
       EXTRACT(YEAR FROM SYSDATE) - 
       CASE 
           WHEN TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
           ELSE 2000 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
       END AS ����,
       D.DEPT_NAME AS �μ���,
       J.JOB_TITLE AS ���޸�
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE EXTRACT(YEAR FROM SYSDATE) - 
      CASE 
          WHEN TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
          ELSE 2000 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
      END = (
          SELECT MIN(EXTRACT(YEAR FROM SYSDATE) - 
                     CASE 
                         WHEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
                         ELSE 2000 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
                     END)
          FROM EMPLOYEE
      );


SELECT EMP_ID ���, EMP_NAME �����
        , TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR')) ����
        , DEPT_NAME �μ���
        , JOB_TITLE ���޸�
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR'))
        = (SELECT MIN(TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR')))
            FROM EMPLOYEE);



--4. �̸��� '��'�ڰ� ���� �������� ���, �����, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMP_ID AS ���,
       E.EMP_NAME AS �����,
       D.DEPT_NAME AS �μ���
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
WHERE E.EMP_NAME LIKE '%��%';


--5. �ؿܿ������� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       J.JOB_TITLE AS ���޸�,
       E.DEPT_ID AS �μ��ڵ�,
       D.DEPT_NAME AS �μ���
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE D.DEPT_NAME LIKE '�ؿܿ���%��';



--6. ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       E.BONUS_PCT AS ���ʽ�����Ʈ,
       D.DEPT_NAME AS �μ���,
       L.LOC_DESCRIBE AS �ٹ�������
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
WHERE E.BONUS_PCT IS NOT NULL;


--7. �μ��ڵ尡 20�� �������� �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       J.JOB_TITLE AS ���޸�,
       D.DEPT_NAME AS �μ���,
       L.LOC_DESCRIBE AS �ٹ�������
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE E.DEPT_ID = '20';


--8. ���޺� ������ �ּұ޿�(MIN_SAL)���� ���� �޴� ��������
--�����, ���޸�, �޿�, ������ ��ȸ�Ͻÿ�.
--������ ���ʽ�����Ʈ�� �����Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       J.JOB_TITLE AS ���޸�,
       E.SALARY AS �޿�,
       (E.SALARY * 12) + NVL(E.BONUS_PCT, 0) * (E.SALARY * 12) AS ����
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE (E.SALARY * 12) > J.MIN_SAL;




--9. �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� 
--�����(emp_name), �μ���(dept_name), ������(loc_describe), ������(country_name)�� ��ȸ�Ͻÿ�.
SELECT E.EMP_NAME AS �����,
       D.DEPT_NAME AS �μ���,
       L.LOC_DESCRIBE AS ������,
       C.COUNTRY_NAME AS ������
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
JOIN COUNTRY C ON L.COUNTRY_ID = C.COUNTRY_ID
WHERE C.COUNTRY_ID IN ('KO', 'JP');

--10. ���� �μ��� �ٹ��ϴ� �������� �����, �μ��ڵ�, �����̸��� ��ȸ�Ͻÿ�.
--self join ���
SELECT E1.EMP_NAME AS �����,
       E1.DEPT_ID AS �μ��ڵ�,
       E2.EMP_NAME AS �����̸�
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_ID = E2.DEPT_ID
                 AND E1.EMP_ID != E2.EMP_ID
ORDER BY E1.DEPT_ID, E1.EMP_NAME, E2.EMP_NAME;


--11. ���ʽ�����Ʈ�� ���� ������ �߿��� �����ڵ尡 J4�� J7�� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.
--��, join�� IN ����� ��
SELECT E.EMP_NAME AS �����,
       J.JOB_TITLE AS ���޸�,
       E.SALARY AS �޿�
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE E.BONUS_PCT IS NULL
  AND J.JOB_ID IN ('J4', 'J7');

--12. ��ȥ�� ������ ��ȥ�� ������ ���� ��ȸ�Ͻÿ�.
SELECT MARRIAGE AS ��ȥ����,
       COUNT(*) AS ������
FROM EMPLOYEE
GROUP BY MARRIAGE;



