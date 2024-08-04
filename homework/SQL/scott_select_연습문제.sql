-- SCOTT ���� LOGON

-- DEPT ���̺�� ���� ��� �����͸� ��ȸ
SELECT * FROM DEPT;


-- EMP ���̺�� ���� ���(EMPNO), ����̸�(ENAME)�� ��ȸ
SELECT EMPNO, ENAME 
FROM EMP;


-- EMP ���̺�� ���� �����, �޿�, ���� ��ȸ
SELECT ENAME, SAL, SAL * 12 AS ����
FROM EMP;


-- EMP ���̺�� ���� �����, �޿�, ����, Ŀ�̼�, ����, Ŀ�̼��� ���Ե� ���� ��ȸ
SELECT ENAME, SAL, JOB, COMM, SAL * 12 AS ����, 
       (SAL * 12 + NVL(COMM, 0)) AS Ŀ�̼�
FROM EMP;


-- emp ���̺� ���� �μ��ڵ� �� ��ȸ
SELECT DEPTNO
FROM EMP;

-- emp ���̺� ���� �μ��ڵ� �� ��ȸ, �� �ߺ��� ���� �Ѱ��� ��µǰ� ��.
SELECT DISTINCT DEPTNO
FROM EMP;

-- emp ���̺��� ���� ���� ��ȸ
SELECT JOB
FROM EMP;

-- emp ���̺� ���� ���� �����͸� �Ѱ����� ��ȸ
SELECT DISTINCT JOB
FROM EMP;

-- WHERE �� 
-- �޿��� 3000 �̻��� �޴� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE SAL >= 3000;

-- �μ��ڵ尡 10�� ������ �̸�, ����, �޿� ��ȸ
SELECT ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 10;


-- �񱳰��� ����, ���ڿ�, ��¥ �������� ���� �ݵ�� '��' �� ǥ����.
-- ������ �̸��� 'FORD'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME = 'FORD';


-- �Ի����� 1980�� ���Ŀ� �Ի��� �������� ���� ��ȸ
SELECT *
FROM EMP
WHERE HIREDATE >= TO_DATE('1980-01-01', 'YYYY-MM-DD');


-- �μ��ڵ尡 10�̸鼭, ������ 'MANAGER'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';



-- �μ��ڵ尡 10 �̰ų�, ������ 'MANAGER'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';


-- ������ 'MANAGER'�� �ƴ� �������� ���� ��ȸ
SELECT *
FROM EMP
WHERE JOB NOT LIKE 'MANAGER';


-- �޿��� 2000 �̻� 3000 ������ �޿��� �޴� ������ ��ȸ
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;



--2000 �̸� 3000 �ʰ��� ������ �޿��� �޴� ���� ��ȸ
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;



-- Ŀ�̼��� 300 �Ǵ� 500 �Ǵ� 1400�� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IN (300, 500, 1400);



-- �����ȣ�� 7521 �Ǵ� 7654 �Ǵ� 7844�� ������� �޿� ��ȸ
SELECT *
FROM EMP
WHERE COMM IN (300, 500, 1400);


-- ����� 7521, 7654, 7844 �� �ƴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE EMPNO NOT IN (7521, 7654, 7844);



-- 1980�� 1�� 1�� ���� ���� 1980�� 12�� 31�� ���̿� �Ի��� ���� ��ȸ
SELECT *
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('1980-01-01', 'YYYY-MM-DD')
                   AND TO_DATE('1980-12-31', 'YYYY-MM-DD');

-- 1980�⵵�� �Ի��� ���� ��ȸ
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1980;


-- 1980���� �ƴ� �ؿ� �Ի��� ���� ��ȸ
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) <> 1980;


-- ��� �̸��� 'F'�� �����ϴ� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE 'F%';


-- ��� �̸��� 'J'�� ����ȭ�� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE 'J%';


-- �̸��� 'A'�� ���Ե� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '%A%';


-- �̸��� ������ ���ڰ� 'N'���� ������ ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '%N';



-- �̸��� �ι�° ���ڰ� 'A'�� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';


-- �̸��� ����° ���ڰ� 'A'�� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';


-- ����� '_' ���� �� ���ڰ� �� ������ ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '__%_%';


-- ����� ������ ���ڰ� '%P'�� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '%P';


-- �̸��� 'A'�� ���� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%A%';




