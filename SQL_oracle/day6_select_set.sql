-- day6_select_set.sql

-- SELECT : ����(SET) ������ ------------------------------
-- UNION, UNION ALL, INTERSECT, MINUS
--  �� ���̻��� SELECT ������ ���(RESULT SET)���� �ϳ��� ǥ���ϱ� ���� �����
-- ���η� ������(���Ʒ��� ������) --> ������ ���η�(������) ������
-- ù��° SELECT ���� ����� ���ʿ�, �ι�° SELECT ���� ����� �Ʒ��ʿ� ��ġ��

-- ������ : UNION, UNION ALL
-- �� SELECT ���� ����� �ϳ��� ��ħ
-- UNION : �� SELECT ����� ������ �ߺ��Ǵ� ���� 1���� ���õ�
-- UNION ALL : �� SELECT ����� ������ �ߺ�(��ġ) �Ǵ� ���� ���ܽ�Ű�� �ʰ� ��� ������

-- ������ : INTERSECT
-- �� SELECT ����� �ߺ��ุ ����

-- ������ : MINUS
-- ù���� SELECT ������� �ι�° SELECT �� �ߺ��Ǵ� ���� ������ (��)

/*
������� : 
     SELECT �� 1
     ���տ�����
     SELECT �� 2
     ���տ�����
     SELECT �� 3
     ORDER BY ���� ���Ĺ��;
     
���ǻ��� : ������ �����ͺ��̽�(RDB)�� 2���� �簢�� ���̺� ������.
     1. ��� SELECT ���� SELECT ���� �÷� ������ ���ƾ���
       => �÷� ������ �ٸ��� DUMMY COLUMN (NULL �÷�)�� �߰��ؼ� ���� ������
       2. SELECT ���� ������ �÷��� �ڷ����� ���ƾ���
*/

-- �������� ����� ������ ��ȸ
-- EMPLOYEE_ROLE �� ROLE_HISTORY ���� ���� ��ȸ�ؼ� �ϳ��� ��ħ
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE -- 22��
UNION -- 25�� : �ߺ��� '104 SE' �� 1�� ���ܵ�
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY; -- 4��

SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE -- 22��
UNION ALL -- 25�� : �ߺ��� '104 SE' �� ��� ���Ե�
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY; -- 4��

SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE -- 22��
INTERSECT -- 1�� : �ߺ��� '104 SE' �� 1�� ���õ�
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY; -- 4��

SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE -- 22��
MINUS -- 21�� : ù��° SELECT������ �ߺ��� '104 SE' �� 1�� ���ܵ�
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY; -- 4��

-- SET ������ ���� ���ǻ��� Ȯ�� : 
-- 1. �� SELECT ���� �÷����� ���ƾ���
SELECT EMP_NAME, JOB_ID, HIRE_DATE -- 3��
FROM EMPLOYEE
WHERE DEPT_ID = '20'
UNION
--SELECT DEPT_NAME, DEPT_ID -- 2�� (ERROR)
SELECT DEPT_NAME, DEPT_ID, NULL -- ���� �÷����� ���� ����
FROM DEPARTMENT
WHERE DEPT_ID = '20';

-- Ȱ�� : ROLLUP() �Լ��� �߰����� ��ġ�� ���ϴ� ����ó�� �� ��
-- �ذ�����  ���� �����ڸ�  Ȱ���� �� ����
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '20' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '20'
GROUP BY DEPT_NAME;

-- �� �� �̻��� SELECT ���� ������� ��ĥ ���� ����
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '10' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '10'
GROUP BY DEPT_NAME
UNION ALL
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '20' -- 3��
UNION ALL
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '20'
GROUP BY DEPT_NAME
UNION ALL
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '50' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '50'
GROUP BY DEPT_NAME
UNION ALL
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '60' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '60'
GROUP BY DEPT_NAME
UNION ALL
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '80' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '80'
GROUP BY DEPT_NAME
UNION ALL
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '90' -- 3��
UNION
SELECT DEPT_NAME, '�޿��հ�', SUM(SALARY)
FROM DEPARTMENT
JOIN EMPLOYEE USING (DEPT_ID)
WHERE DEPT_ID = '90'
GROUP BY DEPT_NAME
UNION ALL
SELECT '������', '�޿�����', SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL
UNION ALL
SELECT  '�μ��̹���', '�޿��հ�', SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NULL;

-- �ݺ��Ǵ� �������� �ʹ� ����� ==> ��ȣ���� ���������� �̿��ϰų�, ���ν��� ���
-- ���ν��� : SQL ������ ���α׷����� �����ϴ� ��ü��

-- 50�� �μ����Ҽӵ� ���� �� �����ڿ� �Ϲ������� ���� ��ȸ�ؼ� �ϳ��� ���Ķ�.
-- Ȯ�� : 50�� �μ��� ���� ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '50';

SELECT EMP_ID, EMP_NAME, '������' ����
FROM EMPLOYEE 
WHERE EMP_ID =  '141' AND DEPT_ID = '50'
UNION
SELECT EMP_ID, EMP_NAME, '����' ����
FROM EMPLOYEE 
WHERE EMP_ID !=  '141' AND DEPT_ID = '50'
--ORDER BY 3, 1; 
ORDER BY ����, 1;

-- ���� ������ ���� �÷�  �Ǵ� ���ͷ��� ��Ī(ALIAS)�� ù��° SELECT ������ ����ص� ��
SELECT 'SQL�� �����ϰ� �ֽ��ϴ�.' ����, 3 ���� FROM DUAL
UNION 
SELECT '�츮�� ����', 1 FROM DUAL
UNION
SELECT '���� ����ְ�', 2 FROM DUAL
ORDER BY 2;
--ORDER BY ����; -- ERROR

-- SET �����ڿ� JOIN �� ����
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
INTERSECT -- 1��
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- �� �������� SELECT ���� ������ �÷����� ������ ��쿡�� �������� �ٲ� �� ����
-- INTERSECT ==> USING (EMP_ID, ROLE_NAME)
-- EQUAL INNER JOIN �� �⺻�̹Ƿ� (104 SE) = (1104 SE) �������� ���� ����� ����
-- (104 SE-ANLY) != (104 SE) : �ٸ���, ���ο� ���� �� ��

-- ���� ������ �������� �ٲ۴ٸ�
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
JOIN ROLE_HISTORY USING (EMP_ID, ROLE_NAME);

-- SET �����ڿ� IN �������� ���� : 
-- UNION �� IN �� ���� ����� ���� �� ����
-- SELECT ���� ���õ� �÷����� ����, ��ȸ�ϴ� ���̺� ����,
-- WHERE ���� �񱳰��� �ٸ� ��쿡 IN ���� �ٲ� �� ����

-- ������ �븮 �Ǵ� ����� ������ �̸�, ���޸� ��ȸ
-- ���޼� ������������, ���� ������ �̸��� ������������ ó����
SELECT EMP_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE IN ('�븮', '���')
ORDER BY 2, 1; -- 8��

-- UNION ���� �ٲ۴ٸ�
SELECT EMP_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '�븮'
UNION
SELECT EMP_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '���'
ORDER BY 2, 1; -- 8��

-- ���ǻ��� 2 : SELECT ���� �÷��� ���Ʒ� �ڷ����� ���ƾ���
--SELECT EMP_NAME, JOB_TITLE, HIRE_DATE -- DATE �ڷ���
SELECT EMP_NAME, JOB_TITLE, BONUS_PCT -- NUMBER �ڷ���
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '�븮'
UNION
SELECT EMP_NAME, JOB_TITLE, SALARY -- NUMBER  �ڷ���
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '���'
ORDER BY 2, 1; -- 8��












