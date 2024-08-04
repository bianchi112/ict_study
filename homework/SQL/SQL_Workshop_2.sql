-- SQL_Workshop02 ����

-- 10�� �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO AS �а���ȣ, COUNT(STUDENT_NO) AS "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO ASC;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� �ۼ��Ͻÿ�.
SELECT COUNT(*) AS "�̹��� �л���"
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

/*12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
�̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
�Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.*/
SELECT SUBSTR(TERM_NO, 1, 4) �⵵, ROUND(AVG(POINT), 1) �⵵������
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY �⵵;

-- 13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO AS �а��ڵ��, 
        COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 END) AS "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME AS �����̸�, 
        COUNT(*) AS �����μ�
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY STUDENT_NAME;

-- 15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
-- ������ �⵵ ������ ǥ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
-- �ݿø��Ͽ� ǥ���Ѵ�.)

SELECT
    SUBSTR(TERM_NO, 1, 4) AS �⵵,
    SUBSTR(TERM_NO, 5, 2) AS �б�,
    ROUND(AVG(POINT), 1) AS ����
FROM 
    TB_GRADE
WHERE 
    STUDENT_NO = 'A112113'
GROUP BY 
    ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2))
ORDER BY 
    SUBSTR(TERM_NO, 1, 4),
    SUBSTR(TERM_NO, 5, 2);




















