-- day6_select_subquery.sql

-- SELECT : �������� (SUBQUERY) ----------------------
-- SELECT �� �ȿ� ���Ǵ� SELECT �� => ����������� ��
-- �ٱ� SELECT ���� �ܺ�����(��������, MAIN_AUERY)��� ��


/*
    �ٱ��Լ�(��ȯ���� �ִ� �Լ�())
    => ���� �Լ��� ���� ����Ǹ鼭, ��ȯ�� ���� �ٱ��Լ��� �����
    
���Ǳ������� �÷��� �񱳿����� �񱳰� <-- �񱳰� �˾Ƴ��� ���� SEELCT ���� �� ��ſ� ����� �� ����   
    �÷��� �񱳿����� (�񱳰� ��ȸ�ϴ� SELECT��) <-- ����(����)������� ��
*/

-- ���¿��� ���� �μ��� �ٹ��ϴ� ���� ��� ��ȸ
SELECT DEPT_ID -- 50
FROM EMPLOYEE
WHERE EMP_NAME = '���¿�';
 
-- 2. ��ȸ�� �μ��ڵ�� ���� ��� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = '50';

-- �������� ���� : 
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = (SELECT DEPT_ID -- 50
                 FROM EMPLOYEE
                 WHERE EMP_NAME = '���¿�');

-- �������� ����(����)
-- ���������� ����� ������� ������ ���� ����
-- �������� �տ� ���Ǵ� �����ڰ� �޶����� ��
-- ������ ���������� ������ ���������� ���е�

-- ������ ������ : SELECT �� ������� 1���� ��������
--      �Ϲ� ��(����)������ (=, != | ^= | <>, >, <, >=, <=) ��밡����
-- ������ �������� : SELECT �� ������� ���� ���� ��������
--       �Ϲ� �񱳿�����(�񱳰� 1���� ��Ģ��) ��� �� �� => IN, ANY, ALL ����ؾ� ��

-- �� �� ���� : 
-- ���߿� ������ �������� : ����� 1��, SELECT ���� �÷��� ���� ��
--       ���������� (�÷�1, �÷�2, ...) �񱳿����� (SELECT �÷�1, �÷�2, ... FROM ...)
-- ���߿� ������ �������� : ����� ���� ��, SELECT ���� �÷��� ���� ��
--       ���������� (�÷�1, �÷�2, ...) IN | ANY | ALL (SELECT �÷�1, �÷�2, ... FROM ...)

-- ��[ȣ��]�� �������� :  ���������� �÷����� �����ٰ� ���������� ����ϴ� ������
-- ��Į�� �������� : ������ + ��ȣ���� ��������

-- ������ �������� (SINGLE ROW SUBAUERY) ----------------
-- ���������� ������� 1���� ���
-- ������ �������� �տ��� �Ϲ� �񱳿����� ����� �� ����

-- �� : ���¿��� ������ �����鼭, ���¿����� �޿��� ���� �޴� ���� ��ȸ
-- 1. ���¿� ���� ��ȸ
SELECT JOB_ID -- J5 : 1��
FROM EMPLOYEE
WHERE EMP_NAME = '���¿�';

-- 2.���¿� �޿� ��ȸ
SELECT SALARY -- 2300000 : 1��
FROM EMPLOYEE
WHERE EMP_NAME = '���¿�';

-- 3. ���� ��ȸ
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = 'J5'
AND SALARY > 23000000;

-- �������� ���� : 
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID -- J5 : 1��, ������ ��������
                FROM EMPLOYEE
                WHERE EMP_NAME = '���¿�')
AND SALARY > (SELECT SALARY -- 2300000 : 1��, ������ ��������
             FROM EMPLOYEE
             WHERE EMP_NAME = '���¿�');
             
-- ���� �߿��� ��ü �޿��� ���� ���� �޿�(���� ������)�� �޴� ���� ��� ��ȸ
-- WHERE ���� �׷��Լ� ��� ���� => ���������� �ذ�
-- 1. �޿��� �ּҰ� ��ȸ
SELECT MIN(SALARY) -- 1500000
FROM EMPLOYEE;

-- 2. �ּҰ��� ��ġ�ϴ� �޿��� �޴� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = 1500000;

-- 3. ���������� ���� : 
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE SALARY = MIN(SALARY); -- ERROR
WHERE SALARY = (SELECT MIN(SALARY) -- 1500000
                FROM EMPLOYEE);

-- HAVING �������� �������� ����� ���� ����
-- �� : �μ��� �޿��հ� �� ���� ū ���� ���� �μ��ڵ�� �޿��հ� ��ȸ
-- 1. �μ��� �޿��հ� �� �ִ밪 ��ȸ
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 2. �ִ� �޿������� �������� �μ� ��ȸ
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) =  1810000;

-- 3. ���������� ����
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) =  (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_ID);

-- ���������� SELECT ���� ��� ������ ����� �� ����
-- �ַ� SELECT ��, FROM ��, WHERE ��, HAVING �� �����

-- ���߿� (MULTI COLUMN) [������] �������� ---------------------
-- ���������� ���� ������� 1��, SELECT �� �׸��� ���� ���� ��������
-- ������� 1��(������)�̸� �Ϲ� �񱳿����� ��� ������
-- ���� : ���������� SELECT �� �׸� ������ ���� �÷� ������ ���ƾ� ��
-- (���� �÷�1, ���� �÷�2) �񱳿����� (SELECT �÷�1, �÷�2 FROM ...)

-- ���¿��� ���ް� �޿��� ���� ���� ��ȸ
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
         FROM EMPLOYEE
         WHERE EMP_NAME = '���¿�');
         
-- ������ (MULTI ROW)  [���Ͽ�] �������� --------------------
-- ���������� ���� ����� (�����)�� ���� ���� ��� 
-- ������ �������� �տ��� �Ϲ� �񱳿����� (�񱳰� 1���� ��Ģ) ��� �� �� : ����
-- ���� ���� ���� ���� �� �ִ� ������ ����ؾ� �� : IN, ANY, ALL

-- �� : �� �μ����� �޿��� ���� ���� ���� ���� ��ȸ
-- 1. �μ����� �޿� ���� ���� ��ȸ
SELECT MIN(SALARY) -- 7��
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 2. �䱸���ǿ� �ش��ϴ� ���� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) -- 7�� : ������ ��������
                FROM EMPLOYEE
                GROUP BY DEPT_ID); -- ERROR : �Ϲ� �� ������ ��� �� ��

-- �ذ�
SELECT EMP_ID, EMP_NAME, DEPT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) -- 7�� : ������ ��������
                FROM EMPLOYEE
                GROUP BY DEPT_ID)
ORDER BY 3 NULLS LAST;

-- �÷��� IN (���� ���� ���� | ������ ��������)
-- �÷��� = �񱳰�1 OR �÷��� = �񱳰�2 OR �÷��� = �񱳰�3 OR ........
-- �÷��� ���� ���� �񱳰��� ��ġ�ϴ� ���� ������ �����϶�� �ǹ���

-- �÷��� NOT IN (���� ���� ���� | ������ ��������)
-- NOT �÷��� IN (���� ���� ���� | ������ ��������) �� ����
-- NOT (�÷��� = �񱳰�1 OR �÷��� = �񱳰�2 OR �÷��� = �񱳰�3 OR ........)
-- �÷��� ���� ���� �񱳰��� ��ġ���� �ʴ� ���� ������ �����϶�� �ǹ���

-- �� : �������� ������ �����ڰ� �ƴ� ������ ������ ��ȸ�ؼ� ���Ķ�.
-- 1. �������� ���� ��ȸ
SELECT DISTINCT MGR_ID -- 6��
FROM EMPLOYEE
WHERE MGR_ID IS NOT NULL;

-- 2. ���� �������� �����ڸ� ��ȸ
SELECT EMP_ID, EMP_NAME, '������' ����
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT DISTINCT MGR_ID -- 6�� : ������ ��������
                FROM EMPLOYEE
                WHERE MGR_ID IS NOT NULL)
UNION
SELECT EMP_ID, EMP_NAME, '����' ����
FROM EMPLOYEE
WHERE EMP_ID NOT IN (SELECT DISTINCT MGR_ID -- 6�� : ������ ��������
                FROM EMPLOYEE
                WHERE MGR_ID IS NOT NULL)
ORDER BY ����, 1;

-- SELECT ������ �������� ����� �� ����
-- �ַ� �Լ� �ȿ��� ���������� ����

-- ���� ������ ����
SELECT EMP_ID, EMP_NAME,
        CASE WHEN EMP_ID IN (SELECT DISTINCT MGR_ID -- 6�� : ������ ��������
                            FROM EMPLOYEE
                            WHERE MGR_ID IS NOT NULL)
            THEN '������' 
            ELSE '����'
        END ����
FROM EMPLOYEE
ORDER BY 3,1;

-- �÷��� > ANY (������ ��������)
-- ������ ���������� ���� ������� �� ���� ���� ������ ū ���̸� ���õ�
-- �÷��� < ANY (������ ��������)
-- ������ ���������� ���� ������� �� ���� ū ������ ���� ���̸� ���õ�
-- ���� ���� ����� �� �� �ּ� �ϳ��� ������ �����ϸ� �� ��쿡  ����
-- = ANY : IN �� �����ڿ� ����

-- �� : �븮 ������ ���� �߿��� ���� ������ �ּұ޿����� ���� �޴� �븮 ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE SALARY > ANY (SELECT SALARY
                    FROM EMPLOYEE
                    JOIN JOB USING (JOB_ID)
                    WHERE JOB_TITLE = '����')
AND JOB_TITLE =  '�븮';

-- �÷��� > ALL (������ ��������) : ���� ū ������ ū �� ������
-- �÷��� < ALL (������ ��������) : ���� ���� ������ ���� �� ������

-- �� : ��� ������� �޿����� �� ���� �޿��� �޴� �븮 ���� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE SALARY > ANY (SELECT SALARY -- 3GOD
                    FROM EMPLOYEE
                    JOIN JOB USING (JOB_ID)
                    WHERE JOB_TITLE = '����')
AND JOB_TITLE =  '�븮';

-- �������� ��뱸�� : 
-- SELECT ���� ��� ������ �������� ��밡����
-- �ַ�, SELECT �� �Լ�  �ȿ� �����, WHERE ��, GROUP BY ��, HAVING ��, ORDER BY ��
-- DML �� : INSERT ��, UPDATE ��
-- DDL �� : CREATE TABLE ��, CREATE VIEW ��

-- ���߿� ������ �������� ---------------------------
-- �� : �ڱ� ������ ��� �޿��� �޴� ���� ��ȸ
-- 1. ���޺� �޿� ��� ��ȸ
SELECT JOB_ID, TRUNC(AVG(SALARY), -5)
FROM EMPLOYEE
GROUP BY JOB_ID;
-- ���� ��ϵ� �޿����� ��հ��� �ڸ������߱Ⱑ �ʿ���

-- 2.����
SELECT  EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
WHERE (JOB_ID,  SALARY) IN (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) -- 8��
                            FROM EMPLOYEE
                            GROUP BY JOB_ID);

-- FROM �������� �������� ����� �� ���� => ���������� ����並 ���̺� ��� �����
-- FROM (��������) ��Ī ==> ��Ī�� ���̺���� �����
-- �ζ��� ��(INLINE VIEW)��� ��

-- ���̺� ��Ī ��� ������� : 
-- ���νÿ� ����Ŭ ���뱸���� FROM ���� ������ ���̺�� ���� ��Ī�� ������ �� ����
--       ���̺��.�÷��� => ���̺�Ī.�÷��� ���� �����
-- ANSI ǥ�ر������δ� ���νÿ��� USING �� ����� ���� ���̺� ��Ī ��� �� ��
--      ON ���ÿ��� ���̺� ��Ī ����� �� ����
-- FROM ���� �������� ����, �ζ��κ�� ��Ī �����

-- �ڱ� ������ ��� �޿��� �޴� ���� ��ȸ
-- �ζ��� �並 ����Ѵٸ�
SELECT EMP_NAME,  JOB_TITLE, SALARY
FROM (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) JOBAVG
      FROM EMPLOYEE
      GROUP BY JOB_ID) V -- �ζ��� ��
JOIN EMPLOYEE E ON (V.JOBAVG = E.SALARY AND V.JOB_ID = E.JOB_ID)
JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
ORDER BY 3, 2;

-- ��[ȣ��]�� �������� (CORRELATE SUBQUERY) -------------------------
-- ��κ��� ���������� ���������� ���� ����� ���������� ����ϴ� ������
-- ���������� ���� �����ؼ� ����� Ȯ���� �� ����
-- ��ȣ���� ���������� ���������� ���������� ���� �����ٰ� ����� ����
-- ��, ���������� ���� �ٲ�� ���������� ����� �޶����� ��
-- ���������� ���� ������ �� ����

-- �ڱ� ������ ��� �޿��� �޴� ���� ��ȸ : ��ȣ���� ���������� �ۼ��Ѵٸ�
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE E
LEFT JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
-- WHERE �ش� ������ SALARY = (�ش� ������ ������ ��ձ޿� ���)
-- WHERE ù��° ������ SALARY = (ù��° ������ ������ �����ٰ� �ش� ������ �޿������ ���)
-- WHERE �ι�° ������ SALARY = (�ι�° ������ ������ �����ٰ� �ش� ������ �޿���� ���)
-- 22�� ���� 22�� �۵��� ����
WHERE SALARY = (SELECT TRUNC(AVG(SALARY), -5)
                FROM EMPLOYEE
                WHERE NVL(JOB_ID, ' ') = NVL(E.JOB_ID, ' '));
                
-- EXISTS / NOT EXISTS ������
-- ��ȣ���� �������� �տ����� ����ϴ� ��������
-- ���������� ���� ����� �����ϴ��� ��� �� EXISTS �����
-- �� ������ ���ÿ��� �������� SELECT ���� �÷��� ����ϸ� �ȵ� => NULL �÷� �����
-- �÷��� EXISTS(SELECT NULL FROM ��ȣ���� ��������)
-- ��ȣ���� ���������� ����� �ִ���, ������ ����� ��������

-- �� : �������� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, '������' ����
FROM EMPLOYEE E
WHERE EXISTS (SELECT NULL
              FROM EMPLOYEE
              WHERE E.EMP_ID = MGR_ID);
-- ��ȣ���� ���������� ����� �����ϸ�, �ش� ���� ���� ���� ���

-- NOT EXISTS : ��ȣ���� ���������� ����� �������� �ʴ���
-- �� : �����ڰ� �ƴ� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, '����' ����
FROM EMPLOYEE E
WHERE NOT EXISTS (SELECT NULL
              FROM EMPLOYEE
              WHERE E.EMP_ID = MGR_ID);
-- ��ȣ���� ���������� ����� �������� ������, �ش� ���� ���� ���� ���

-- ��Į�� �������� -----------------------------------
-- ������ + ��ȣ���� ��������

-- �� : �̸�, �μ��ڵ�, �޿�, �ش� ������ �Ҽӵ� �μ��� ��ձ޿� ��ȸ
SELECT EMP_NAME, DEPT_ID, SALARY,
        (SELECT TRUNC(AVG(SALARY), -5)
        FROM EMPLOYEE
        WHERE E.DEPT_ID = DEPT_ID) "�ҼӺμ��� �޿� ���"
FROM EMPLOYEE E;

-- ORDER BY ������ ��Į�� �������� ����� �� ����
-- ������ �Ҽӵ� �μ��� �μ����� ū ������ �������� ���ĵ� ���� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_ID, HIRE_DATE
FROM EMPLOYEE E
ORDER BY (SELECT DEPT_NAME
          FROM DEPARTMENT
          WHERE E.DEPT_ID = DEPT_ID) DESC NULLS LAST;
          
-- TOP-N �м� -----------------------------
-- ���� �� ��, ���� �� ���� ��ȸ�ϴ� ��
-- ��� 1 : �ζ��κ�� RANK() �Լ��� �̿�
-- ��� 2 : �ζ��κ�� ROWNUM �̿�

-- ��� 1 : �ζ��κ�� RANK() �Լ��� �̿�
-- ���� �������� �޿��� ���� ���� �޴� ���� 5�� ��ȸ
-- �̸�, �޿�, ����

SELECT * 
FROM (SELECT EMP_NAME, SALARY, RANK() OVER (ORDER BY SALARY DESC) ����
        FROM EMPLOYEE)
WHERE ���� <= 5;

-- ��� 2 : �ζ��κ�� ROWNUM �̿�
-- �ζ��κ信�� ORDER BY �� ���� ROWNUM �� �ο��ǰ� ��
-- ROWNUM : ���ȣ, WHERE �� �۵� �Ŀ� �ڵ����� �ο���

-- Ȯ��
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE -- ROWNUM ������
ORDER BY SALARY DESC;

-- �޿� ���� �޴� ���� 5�� ��ȸ : �ζ��κ� ������� ���� ���
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE 
WHERE ROWNUM <= 5 -- ROWNUM ������
ORDER BY SALARY DESC;

-- �ذ� : �����ϰ� ���� ROWNUM �� �ο��ǰԲ� ���� �ۼ���
-- �ζ��κ� �����
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT * FROM EMPLOYEE
      ORDER BY SALARY DESC) -- �����ϰ� ���� ROWNUM �ο���
WHERE ROWNUM <= 5;







