-- SCOTT ���� : JOIN ��������
-- ����Ŭ ���뱸���� ANSI ǥ�ر��� �� ������ �ۼ��Ͻÿ�.

-- 1. �μ� ���̺�� ���� ���̺��� ���, �����, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�. 
-- ����� ���� �������� ���� ó����

-- ����Ŭ : 
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY E.ENAME ASC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.ENAME ASC;

-- 2. �μ� ���̺�� ���� ���̺��� �޿��� 2000 �̻��� ����� ���Ͽ�
-- ���, �����, �޿�, �μ����� ��ȸ�Ͻÿ�. 
-- ��, �޿��������� �������� ���� ó����

-- ����Ŭ : 
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.SAL >= 2000
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL >= 2000
ORDER BY E.SAL DESC;


-- 3. �μ� ���̺�� ���� ���̺��� ������ Manager�̰� �޿��� 2500 �̻��� ������
-- ���, �����, ������, �޿�, �μ����� ��ȸ�Ͻÿ�. 
-- ��, ����� �������� �������� ���� ó����. 

-- ����Ŭ : 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.JOB = 'MANAGER'
  AND E.SAL >= 2500
ORDER BY E.EMPNO ASC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER'
  AND E.SAL >= 2500
ORDER BY E.EMPNO ASC;


-- 4. ���� ���̺�� �޿� ��� ���̺��� 
-- �޿��� ���Ѱ��� ���Ѱ� ������ ���Եǰ� ����� 4�� ��������
-- ���, �����, �޿�, ����� ��ȸ�Ͻÿ�. 
-- ��, �޿��� �������� �������� ���� ó����

-- ����Ŭ : 
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
  AND S.GRADE = 4
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE = 4
ORDER BY E.SAL DESC;

-- 5. �μ� ���̺�, ���� ���̺�, �޿���� ���̺��� 
-- �޿��� ���Ѱ��� ���Ѱ� ������ ���ԵǴ� ����� �����Ͽ�
-- ���, �����, �μ���, �޿�, ����� ��ȸ�Ͻÿ�. 
-- ��, ����� �������� �������� ���� ó����

-- ����Ŭ : 
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
  AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY S.GRADE DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY S.GRADE DESC;

 
-- 6. ���� ���̺��� ������ �ش� ����� �����ڸ��� ��ȸ�Ͻÿ�

-- ����Ŭ : 
SELECT E1.ENAME AS �����, E2.ENAME AS �����ڸ�
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- ANSI : 
SELECT E1.ENAME AS �����, E2.ENAME AS �����ڸ�
FROM EMP E1
JOIN EMP E2 ON E1.MGR = E2.EMPNO;


-- 7. ���� ���̺��� 
-- �����, �ش� ����� �����ڸ�, �ش� ����� �������� �����ڸ��� ��ȸ�Ͻÿ�

-- ����Ŭ : 
SELECT E1.ENAME AS �����,
       E2.ENAME AS �����ڸ�,
       E3.ENAME AS "�������� �����ڸ�"
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO
  AND E2.MGR = E3.EMPNO;


-- ANSI : 
SELECT E1.ENAME AS �����,
       E2.ENAME AS �����ڸ�,
       E3.ENAME AS "�������� �����ڸ�"
FROM EMP E1
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO
LEFT JOIN EMP E3 ON E2.MGR = E3.EMPNO
WHERE E3.EMPNO IS NOT NULL;

-- 8. 7�� ������� �����ڿ� ���� �����ڰ� ���� ��� ������ ������ ��µǵ��� �����Ͻÿ�.

-- ����Ŭ : 
SELECT E1.ENAME AS �����,
       E2.ENAME AS �����ڸ�,
       E3.ENAME AS "�������� �����ڸ�"
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO(+)
  AND E2.MGR = E3.EMPNO(+);


-- ANSI : 
SELECT E1.ENAME AS �����,
       E2.ENAME AS �����ڸ�,
       E3.ENAME AS "�������� �����ڸ�"
FROM EMP E1
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO
LEFT JOIN EMP E3 ON E2.MGR = E3.EMPNO;


-- 9. 20�� �μ��� �̸��� �� �μ��� �ٹ��ϴ� ������ �̸��� ��ȸ�Ͻÿ�.

-- ����Ŭ : 
SELECT D.DNAME AS �μ���, E.ENAME AS ������
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
  AND D.DEPTNO = 20;

-- ANSI : 
SELECT D.DNAME AS �μ���, E.ENAME AS ������
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
WHERE D.DEPTNO = 20;



-- 10. Ŀ�̼��� �޴� ������ �̸�, Ŀ�̼�, �μ��̸��� ��ȸ�Ͻÿ�.

-- ����Ŭ : 
SELECT E.ENAME AS ������, E.COMM AS Ŀ�̼�, D.DNAME AS �μ���
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.COMM IS NOT NULL;

-- ANSI : 
SELECT E.ENAME AS ������, E.COMM AS Ŀ�̼�, D.DNAME AS �μ���
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.COMM IS NOT NULL;


-- 11. �̸��� ��A�� �� ���� �������� �̸��� �μ����� ��ȸ�Ͻÿ�.

-- ����Ŭ : 
SELECT E.ENAME AS ������, D.DNAME AS �μ���
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.ENAME LIKE '%A%';

-- ANSI : 
SELECT E.ENAME AS ������, D.DNAME AS �μ���
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME LIKE '%A%';


-- 12. DALLAS�� �ٹ��ϴ� ���� �� �޿��� 1500 �̻��� 
-- ����� �̸�, �޿�, �Ի���, ���ʽ�(comm)�� ��ȸ�Ͻÿ�.
-- �޿� ���� �������� ���� ó����

-- ����Ŭ : 
SELECT E.ENAME AS ������, E.SAL AS �޿�, E.HIREDATE AS �Ի���, E.COMM AS ���ʽ�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'DALLAS'
  AND E.SAL >= 1500
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.ENAME AS ������, E.SAL AS �޿�, E.HIREDATE AS �Ի���, E.COMM AS ���ʽ�
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS'
  AND E.SAL >= 1500
ORDER BY E.SAL DESC;


-- 13. �ڽ��� ������ ���� ����(sal)�� ���� �޴� 
-- ������ �̸��� ������ ��ȸ�Ͻÿ�.

-- ����Ŭ : 
SELECT E1.ENAME AS ������, E1.SAL AS ����
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
  AND E1.SAL > E2.SAL;

-- ANSI : 
SELECT E1.ENAME AS ������, E1.SAL AS ����
FROM EMP E1
JOIN EMP E2 ON E1.MGR = E2.EMPNO
WHERE E1.SAL > E2.SAL;


-- 14. ���� �� ����ð� �������� �ٹ����� ���� 
-- 30���� �ʰ��� ������ �̸�, �޿�, �Ի���, �μ����� ��ȸ�Ͻÿ�

-- ����Ŭ : 
SELECT E.ENAME AS ������, E.SAL AS �޿�, E.HIREDATE AS �Ի���, D.DNAME AS �μ���
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND MONTHS_BETWEEN(SYSDATE, E.HIREDATE) > 12 * 30;

-- ANSI : 
SELECT E.ENAME AS ������, E.SAL AS �޿�, E.HIREDATE AS �Ի���, D.DNAME AS �μ���
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE MONTHS_BETWEEN(CURRENT_DATE, E.HIREDATE) > 12 * 30;


-- 15. �� �μ����� 1982�� ������ �Ի��� �������� �ο����� ��ȸ�Ͻÿ�.
-- �μ���ȣ �������� �������� ���� ó����

-- ����Ŭ : 
SELECT DEPTNO �μ���ȣ, COUNT(*) �ο���
FROM EMP
WHERE HIREDATE < TO_DATE('1982-01-01', 'YYYY-MM-DD')
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;


-- ANSI : 
SELECT DEPTNO �μ���ȣ, COUNT(*) �ο���
FROM EMP
WHERE HIREDATE < DATE '1982-01-01'
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;










