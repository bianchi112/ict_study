-- SCOTT���� �������� ��������


-- 1. ���� ���̺��� BLAKE ���� �޿��� ���� �������� ���, �̸�, �޿��� ��ȸ�Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, SAL �޿�
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');



-- 2. ���� ���̺��� MILLER ���� �ʰ� �Ի��� ������ ���, �̸�, �Ի����� ��ȸ�Ͻÿ�
SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');



-- 3. ���� ���̺��� ���� ��ü�� ��ձ޿����� �޿��� ���� �������� 
-- ���, �̸�, �޿��� ��ȸ�Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, SAL �޿�
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);



-- 4. ���� ���̺��� �μ��� �ִ� �޿��� �޴� �������� 
-- ���, �̸�, �μ��ڵ�, �޿��� ��ȸ�Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, DEPTNO �μ��ڵ�, SAL �޿�
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);




-- 5. Salgrade�� 2����� �������� ��ձ޿����� �޿��� ���� �޴� 
-- ������ ��� ������ ��ȸ�Ͻÿ�.

-- ����Ŭ : 
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(E.SAL)
            FROM EMP E, SALGRADE S
            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
              AND S.GRADE = 2);




-- ANSI : 
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(E.SAL)
                FROM EMP E
                JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
                WHERE S.GRADE = 2 );


-- 6. �Ҽӵ� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ ���� ��ȸ
-- �μ���ȣ, �����̸�, �޿� ���
-- ��ȣ���� �������� ����� ��
SELECT DEPTNO �μ���ȣ, ENAME �����̸�, SAL �޿�
FROM EMP E1
WHERE SAL > (SELECT AVG(E2.SAL)
                FROM EMP E2
                WHERE E1.DEPTNO = E2.DEPTNO);


-- 7. 30�� �μ��� ���� �ֱ� �Ի��Ϻ��� ���� �Ի��� 30�� �μ����� �ƴ� �������� ���� ��ȸ
-- �̸�, �Ի���, �μ���ȣ, �޿�

-- ������ �������� ���
SELECT ENAME �̸�, HIREDATE �Ի���, DEPTNO �μ���ȣ, SAL �޿�
FROM EMP
WHERE DEPTNO <> 30
  AND HIREDATE < (SELECT MAX(HIREDATE)
                  FROM EMP
                  WHERE DEPTNO = 30);

-- ������ �������� ���
SELECT ENAME, HIREDATE, DEPTNO, SAL
FROM EMP
WHERE DEPTNO <> 30
  AND HIREDATE < ALL (SELECT HIREDATE
                      FROM EMP
                      WHERE DEPTNO = 30);


-- 8 job�� analyst�� ��� ������� �޿��� ���� �޴� Ÿ ������ ����� ��� 
-- (��, ������ clerk�� ����� ����)

-- ������ �������� ���
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB <> 'CLERK'
  AND SAL > ALL (SELECT SAL
                  FROM EMP
                  WHERE JOB = 'ANALYST');

-- ������ �������� ���
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB <> 'CLERK'
  AND SAL > (SELECT MAX(SAL)
              FROM EMP
              WHERE JOB = 'ANALYST');

