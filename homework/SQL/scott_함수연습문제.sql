-- SCOTT �Լ� �������� 


-- COMM �� ���� NULL�� �ƴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;


-- Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NULL;


-- �����ڰ� ���� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE EMPNO NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);




-- �޿��� ���� �޴� ���� ������ ��ȸ
SELECT *
FROM EMP
ORDER BY SAL DESC;



-- �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT *
FROM EMP
ORDER BY SAL DESC, COMM DESC;



-- EMP ���̺��� �����ȣ, �����,����, �Ի��� ��ȸ
-- �� �Ի����� �������� ���� ó����.
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;

      

-- EMP ���̺�� ���� �����ȣ, ����� ��ȸ
-- �����ȣ ���� �������� ����
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;



-- ���, �Ի���, �����, �޿� ��ȸ
-- �μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��ϼ����� ó��
SELECT EMPNO, HIREDATE, ENAME, SAL
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE DESC;




/***** �Լ� *****/

-- �ý������� ���� ���� ��¥�� ���� ������ ����� �� ��
SELECT SYSDATE AS ���ó�¥
FROM DUAL;

   

-- EMP ���̺�� ���� ���, �����, �޿� ��ȸ
-- ��, �޿��� 100���� ������ ���� ��� ó����.
-- �޿� ���� �������� ������.
SELECT EMPNO, ENAME, FLOOR(SAL / 100) * 100 AS �޿�
FROM EMP
ORDER BY �޿� DESC;



-- EMP ���̺�� ���� �����ȣ�� Ȧ���� ������� ��ȸ
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;



/* ���� ó�� �Լ�*/  

-- EMP ���̺�� ���� �����, �Ի��� ��ȸ
-- ��, �Ի����� �⵵�� ���� �и� �����ؼ� ���
SELECT ENAME, 
       TO_CHAR(HIREDATE, 'YYYY') AS �Ի�⵵, 
       TO_CHAR(HIREDATE, 'MM') AS �Ի��
FROM EMP;


-- EMP ���̺�� ���� 9���� �Ի��� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') = '09';


-- EMP ���̺�� ���� '81'�⵵�� �Ի��� ���� ��ȸ
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YY') = '81';


-- EMP ���̺�� ���� �̸��� 'E'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';



-- emp ���̺�� ���� �̸��� ����° ���ڰ� 'R'�� ������ ���� ��ȸ
-- LIKE �����ڸ� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';



-- SUBSTR() �Լ� ���
SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R';





/************ ��¥ ó�� �Լ� **************/

-- �Ի��Ϸ� ���� 40�� �Ǵ� ��¥ ��ȸ
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 12 * 40) 
FROM EMP;



-- �Ի��Ϸ� ���� 33�� �̻� �ٹ��� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE HIREDATE <= ADD_MONTHS(SYSDATE, -12 * 33);


-- ���� ��¥���� �⵵�� ����
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;






   



