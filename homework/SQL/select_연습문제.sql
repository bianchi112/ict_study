--SELECT ��������
--
--1. �μ��ڵ尡 90�̸鼭, �����ڵ尡 J2�� �������� ���, �̸�, �μ��ڵ�, �����ڵ�, �޿� ��ȸ��
--   ��Ī ������
SELECT EMP_ID AS ���, EMP_NAME AS �̸�, DEPT_ID AS �μ��ڵ�, JOB_ID AS �����ڵ�, SALARY AS �޿�
FROM EMPLOYEE
WHERE DEPT_ID = '90' AND JOB_ID = 'J2';

--
--2. �Ի����� '1982-01-01' �����̰ų�, �����ڵ尡 J3 �� �������� ���, �̸�, ������ ���, ���ʽ�����Ʈ ��ȸ��
SELECT EMP_ID AS ���, EMP_NAME AS �̸�, MGR_ID AS �����ڻ��, BONUS_PCT AS ���ʽ�����Ʈ
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('82/01/01') OR JOB_ID = 'J3';

--
--3. �����ڵ尡 J4�� �ƴ� �������� �޿��� ���ʽ�����Ʈ�� ����� ������ ��ȸ��.
--  ��Ī ������, ���, �����, �����ڵ�, ����(��)
--  ��, ���ʽ�����Ʈ�� null �� ���� 0���� �ٲپ� ����ϵ��� ��.
SELECT EMP_ID AS ���, EMP_NAME AS �����, JOB_ID AS �����ڵ�,(SALARY + (SALARY * NVL(BONUS_PCT, 0))) * 12 AS ����_��
FROM EMPLOYEE
WHERE JOB_ID <> 'J4';
--
--4. ���ʽ�����Ʈ�� 0.1 �̻� 0.2 ������ �������� ���, �����, �̸���, �޿�, ���ʽ�����Ʈ ��ȸ��
SELECT EMP_ID AS ���, EMP_NAME AS �����, EMAIL AS �̸���, SALARY AS �޿�, BONUS_PCT AS ���ʽ�����Ʈ
FROM EMPLOYEE
WHERE BONUS_PCT BETWEEN 0.1 AND 0.2;

--
--5. ���ʽ�����Ʈ�� 0.1 ���� �۰ų�(�̸�), 0.2 ���� ����(�ʰ�) �������� ���, �����, ���ʽ�����Ʈ, �޿�, �Ի��� ��ȸ��
SELECT EMP_ID AS ���, EMP_NAME AS �����, BONUS_PCT AS ���ʽ�����Ʈ, SALARY AS �޿�, HIRE_DATE AS �Ի���
FROM EMPLOYEE
WHERE BONUS_PCT < 0.1 OR BONUS_PCT > 0.2;
--
--6. '1982-01-01' ���Ŀ� �Ի��� �������� �����, ���ʽ�����Ʈ, �޿� ��ȸ��
SELECT EMP_NAME AS �����, BONUS_PCT AS ���ʽ�����Ʈ, SALARY AS �޿�
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('82/01/01');

--
--7. ���ʽ�����Ʈ�� 0.1, 0.2 �� �������� ���, �����, ���ʽ�����Ʈ, ��ȭ��ȣ ��ȸ��
SELECT EMP_ID AS ���, EMP_NAME AS �����, BONUS_PCT AS ���ʽ�����Ʈ, PHONE AS ��ȭ��ȣ
FROM EMPLOYEE
WHERE BONUS_PCT IN (0.1, 0.2);

--
--8. ���ʽ�����Ʈ�� 0.1�� 0.2�� �ƴ� �������� ���, �����, ���ʽ�����Ʈ, �ֹι�ȣ ��ȸ��
SELECT EMP_ID AS ���, EMP_NAME AS �����, BONUS_PCT AS ���ʽ�����Ʈ, EMP_NO AS �ֹι�ȣ
FROM EMPLOYEE
WHERE BONUS_PCT NOT IN (0.1, 0.2);

--
--9. ���� '��'���� �������� ���, �����, �Ի��� ��ȸ��
--  ��, �Ի��� ���� �������� ������
SELECT EMP_ID AS ���, EMP_NAME AS �����, HIRE_DATE AS �Ի���
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%'
ORDER BY HIRE_DATE ASC;

--
--10. �ֹι�ȣ 8��° ���� '2'�� ������ ���, �����, �ֹι�ȣ, �޿��� ��ȸ��
--  ��, �޿� ���� �������� ������
SELECT EMP_ID AS ���, EMP_NAME AS �����, EMP_NO AS �ֹι�ȣ, SALARY AS �޿�
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2'
ORDER BY SALARY DESC;
