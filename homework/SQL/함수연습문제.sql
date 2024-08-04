-- �Լ� ��������

--1. ������� �ֹι�ȣ�� ��ȸ��
--  ��, �ֹι�ȣ 9��° �ڸ����� �������� '*'���ڷ� ä��
--  �� : ȫ�浿 771120-1******
SELECT EMP_NAME AS �̸�,
       SUBSTR(EMP_NO, 1, 8) || REPLACE(SUBSTR(EMP_NO, 9), SUBSTR(EMP_NO, 9), '******') AS �ֹι�ȣ
FROM EMPLOYEE;


-- 2. ������, �����ڵ�, ����(��) ��ȸ
-- ��, ������ ��57,000,000 ���� ǥ�õǰ� ��
-- ������ ���ʽ�����Ʈ�� ����� 1��ġ �޿���
SELECT EMP_NAME AS ������,
       JOB_ID AS �����ڵ�,
       TO_CHAR(SALARY * 12 * (1 + NVL(BONUS_PCT, 0)), 'L99,999,999') AS ����
FROM EMPLOYEE;

/*
3. �μ��ڵ尡 50, 90�� ������ �߿��� 2004�⵵�� �Ի��� ������ 
   �� ��ȸ��.
	��� ����� �μ��ڵ� �Ի���*/
SELECT EMP_ID, EMP_NAME, DEPT_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90')
AND EXTRACT(YEAR FROM HIRE_DATE) = 2004;

/*
4. ������, �Ի���, �Ի��� ���� �ٹ��ϼ� ��ȸ
  ��, �ָ��� ������*/
SELECT EMP_NAME AS ������,
       HIRE_DATE AS �Ի���,
       ROUND(LAST_DAY(HIRE_DATE) - TRUNC(HIRE_DATE, 'MM') + 1, 0) AS �ٹ��ϼ�
FROM EMPLOYEE;



/*5. ������, �μ��ڵ�, �������, ����(��) ��ȸ
  ��, ��������� �ֹι�ȣ���� �����ؼ�, 
     ������ ������ �����Ϸ� ��µǰ� ��.
  ���̴� �ֹι�ȣ���� �����ؼ� ��¥�����ͷ� ��ȯ�� ����, �����*/
SELECT EMP_NAME, EMP_ID, EMP_NO,
       SUBSTR(EMP_NO, 1, 2) || '��' || SUBSTR(EMP_NO, 3, 2) || '��' || SUBSTR(EMP_NO, 5, 2) || '��' AS �������,
       EXTRACT(YEAR FROM SYSDATE) - 
       CASE 
           WHEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) >= 50 
           THEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) + 1900
           ELSE TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) + 2000
       END + 1 AS ����
FROM EMPLOYEE;







/*6. �������� �Ի��Ϸ� ���� �⵵�� ������, �� �⵵�� �Ի��ο����� ���Ͻÿ�.
  �Ʒ��� �⵵�� �Ի��� �ο����� ��ȸ�Ͻÿ�.
  => to_char, decode, sum ���

	-------------------------------------------------------------
	��ü������   2001��   2002��   2003��   2004��
	-------------------------------------------------------------*/
SELECT 
    COUNT(*) AS ��ü������,
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2001', 1, 0)) AS "2001��",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2002', 1, 0)) AS "2002��",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2003', 1, 0)) AS "2003��",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2004', 1, 0)) AS "2004��"
FROM EMPLOYEE;


/*7.  �μ��ڵ尡 50�̸� �ѹ���, 60�̸� ��ȹ��, 90�̸� �����η� ó���Ͻÿ�.
   ��, �μ��ڵ尡 50, 60, 90 �� ������ ������ ��ȸ��
  => case ���
	�μ��ڵ� ���� �������� ������.*/
SELECT 
    EMP_NAME AS ������,
    EMP_ID AS ���,
    CASE 
        WHEN DEPT_ID = '50' THEN '�ѹ���'
        WHEN DEPT_ID = '60' THEN '��ȹ��'
        WHEN DEPT_ID = '90' THEN '������'
        ELSE '��Ÿ' -- �����δ� �μ��ڵ尡 50, 60, 90�� �ƴ� ���� ����
    END AS �μ���
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '60', '90')
ORDER BY DEPT_ID;


















