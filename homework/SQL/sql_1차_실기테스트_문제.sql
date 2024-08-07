-- sql_1��_�Ǳ��׽�Ʈ_����.sql

/*1. 2001 �⿡ ���� �� ���а� �л��� �� ������ �л����� ��ȸ�Ͻÿ�. ���а� �ڵ�� TB_DEPARTMENT ����
�˻��Ѵ�. (Join �� ������� �ʴ´�.)*/

SELECT COUNT(*) AS "�л���"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                       FROM TB_DEPARTMENT 
                       WHERE DEPARTMENT_NAME = '���а�')
  AND SUBSTR(ENTRANCE_DATE, 1, 2) = '01';

/*2. �迭�� �����С��� �а� �� ���������� 20 �� �̻�, 30 �� ������ �а��� �迭, �а��̸�, ������ ��ȸ�Ͻÿ�.
�� �а��̸��� �������� �������� �����Ͻÿ�.��*/

SELECT D.CATEGORY AS "�迭", D.DEPARTMENT_NAME AS "�а��̸�", D.CAPACITY AS "����"
FROM TB_DEPARTMENT D
WHERE D.CATEGORY = '����'
  AND D.CAPACITY BETWEEN 20 AND 30
ORDER BY D.DEPARTMENT_NAME;

/*3. ���С��ڰ� �� �迭�� �Ҽ� �а��� �� �� �ִ��� �迭, �а����� ����Ͻÿ�. �� �а����� ���� ������
�����Ͻÿ�.*/

SELECT CATEGORY AS "�迭", COUNT(DEPARTMENT_NAME) AS "�а���"
FROM TB_DEPARTMENT 
WHERE CATEGORY LIKE '%��%'
GROUP BY CATEGORY
ORDER BY COUNT(DEPARTMENT_NAME) DESC;

/*4. ��������а��� �����̸�, ����⵵, �ּҸ� ��ȸ�ϰ� ���̰� ���� ������ �����Ͻÿ�. ������а� �ڵ��
TB_DEPARTMENT ���� �˻��Ѵ�. (Join �� ������� �ʴ´�.)*/

SELECT P.PROFESSOR_NAME AS "�����̸�", SUBSTR(P.PROFESSOR_SSN, 1, 4) AS "����⵵", P.PROFESSOR_ADDRESS AS "�ּ�"
FROM TB_PROFESSOR P
WHERE P.DEPARTMENT_NO = (
    SELECT D.DEPARTMENT_NO
    FROM TB_DEPARTMENT D
    WHERE D.DEPARTMENT_NAME = '������а�'
)
ORDER BY SUBSTR(P.PROFESSOR_SSN, 1, 4) DESC;

/*5. ������а� �л� �� ���￡ �����ϴ� �л��� �а���ȣ, �л��̸�, ���п��θ� ��ȸ�ϰ� �л��̸�����
�������� �����Ͻÿ�. �� ���п��δ� ���� ��Y���̸� �����С����� ��N���̸� ���������� ����Ѵ�. ������а�
�ڵ�� TB_DEPARTMENT ���� ã�´�. (Join �� ������� �ʴ´�)*/

SELECT A.DEPARTMENT_NO AS "�а���ȣ", A.STUDENT_NAME AS "�л��̸�",
       CASE A.ABSENCE_YN
           WHEN 'Y' THEN '����'
           WHEN 'N' THEN '����'
           ELSE '�� �� ����'
       END AS "���п���"
FROM TB_STUDENT A
WHERE A.DEPARTMENT_NO = (
    SELECT D.DEPARTMENT_NO
    FROM TB_DEPARTMENT D
    WHERE D.DEPARTMENT_NAME = '������а�'
)
  AND A.STUDENT_ADDRESS LIKE '%����%'
ORDER BY A.STUDENT_NAME;

/*6. 80 ����� ���л� �� ���� ���衯���� �л��� �ֹι�ȣ, �л��̸��� ��ȸ�Ͻÿ�. �� �л��̸����� ��������
�����Ͻÿ�.*/

SELECT S.STUDENT_SSN AS "�ֹι�ȣ", S.STUDENT_NAME AS "�л��̸�"
FROM TB_STUDENT S
WHERE SUBSTR(S.STUDENT_SSN, 1, 2) = '80'   
  AND SUBSTR(S.STUDENT_SSN, 8, 1) IN ('2', '4') 
  AND S.STUDENT_NAME LIKE '��%'           
ORDER BY S.STUDENT_NAME;                 

/*7. �迭�� ����ü�ɡ��� �а��� ������ �������� 40 �� �̻��̸� ���밭�ǽǡ�, 30 �� �̻��̸� ���߰��ǽǡ�, 30 ��
�̸��̸� ���Ұ��ǽǡ��� ����Ѵ�. ��, ������ ���� ������ ���� �Ѵ�.*/

SELECT D.DEPARTMENT_NAME AS "�а��̸�", D.CAPACITY AS "����",
       CASE
           WHEN D.CAPACITY >= 40 THEN '�밭�ǽ�'
           WHEN D.CAPACITY >= 30 THEN '�߰��ǽ�'
           ELSE '�Ұ��ǽ�'
       END AS "���ǽ�ũ��"
FROM TB_DEPARTMENT D
WHERE D.CATEGORY = '��ü��'
ORDER BY D.CAPACITY DESC;

/*8. �ּ����� ����⡯ �Ǵ� ����õ���� �л� �� 1900��뿡 ���� �� �л����� ��ȸ �ϰ��� �Ѵ�. ���ó�¥�� ����
���� ���� �� �Ⱓ�� ����Ͽ� ���� �� �Ⱓ�� ������ ������ ���� �Ѵ�. (�� ���� �� �Ⱓ�� ������ ��(Ҵ)��
�� �ϰ�, �Ҽ��� ���� �ڸ��� ������. ���� ���� �� �Ⱓ�� ���� ��� �̸����� �������� �����Ѵ�.)*/

SELECT S.STUDENT_NAME AS "�а��̸�",
       TO_CHAR(S.ENTRANCE_DATE, 'YY/MM/DD') AS "��������",
       TRUNC(MONTHS_BETWEEN(SYSDATE, S.ENTRANCE_DATE) / 12) AS "�����ıⰣ(��)"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE (S.STUDENT_ADDRESS LIKE '%���%' OR S.STUDENT_ADDRESS LIKE '%��õ%')
  AND EXTRACT(YEAR FROM S.ENTRANCE_DATE) BETWEEN 1900 AND 1999
ORDER BY S.STUDENT_NAME ASC;


/*9. �а��� ���￡ �����ϴ� ���� �� ���̰� ���� ���� ������ ���̸� ��ȸ�Ѵ�. ��, ���̰� ���� ������ ����
�Ѵ�.*/

SELECT DEPARTMENT_NO AS "�а���ȣ",
       CASE
           WHEN TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)) > 40 THEN
               TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1900 + TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)))
           ELSE
               TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (2000 + TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)))
       END AS "����"
FROM TB_PROFESSOR
WHERE PROFESSOR_ADDRESS LIKE '%����%'
ORDER BY PROFESSOR_SSN DESC;

/*10. 2005��1��1�Ϻ��� 2006��12��31�ϱ����� �Ⱓ�� ������ �л� �� �ּҰ� ��ϵ��� ���� ���л��� �а���
ȣ, �л��̸�, ����������ȣ, ���г⵵�� ��ȸ�Ͻÿ�. ���г⵵�� �������� �������� �����Ѵ�.*/

SELECT DEPARTMENT_NO AS "�а���ȣ", STUDENT_NAME AS "�л��̸�", 
        COACH_PROFESSOR_NO AS "����������ȣ", TO_CHAR(ENTRANCE_DATE, 'YYYY') || ' ��' AS "���г⵵"
FROM TB_STUDENT
WHERE ENTRANCE_DATE BETWEEN TO_DATE('2005-01-01', 'YYYY-MM-DD') AND TO_DATE('2006-12-31', 'YYYY-MM-DD')
  AND (STUDENT_ADDRESS IS NULL OR STUDENT_ADDRESS = '')
  AND SUBSTR(STUDENT_SSN, 8, 1) = '1'
ORDER BY TO_CHAR(ENTRANCE_DATE, 'YYYY');

/*11. �������ǿ� �´� �����͸� ��ȸ �Ͻÿ�.
? ���������� �л��� ���� ������ ������ �л����� �⵵ �� ������ ǥ���ϴ� ������ �ۼ��Ѵ�.
? ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ�� �Ѱ� �⵵�� �ֱ� ������ ���� �Ѵ�. */

SELECT SUBSTR(G.TERM_NO, 1, 4) AS "�⵵",
       ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.COACH_PROFESSOR_NO = (
    SELECT COACH_PROFESSOR_NO
    FROM TB_STUDENT
    WHERE STUDENT_NAME = '������'
)
GROUP BY SUBSTR(G.TERM_NO, 1, 4)
ORDER BY SUBSTR(G.TERM_NO, 1, 4) DESC;

/*12. �Ʒ� ���ǿ� �´� ������ �˻� �Ͻÿ�.
? ��ü ���л� �� ������ �л��� ���� ���ڸ� ��ȸ�Ѵ�.
? �������ڰ� 2001 �� 1 �� 1 ��(����)���� �������(����)�� �л��� ǥ���ϴ� ������ �ۼ��Ѵ�.
? ���� ���ڰ� �ֱ� ������ �����Ѵ�.*/

SELECT D.DEPARTMENT_NAME AS "�а���", S.STUDENT_NAME AS "�л���", TO_CHAR(S.ENTRANCE_DATE, 'YY/MM/DD') AS "��������"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE S.ABSENCE_YN = 'Y'
  AND SUBSTR(S.STUDENT_SSN, 8, 1) IN ('1', '3') 
  AND S.ENTRANCE_DATE >= TO_DATE('2001-01-01', 'YYYY-MM-DD')
ORDER BY S.ENTRANCE_DATE ;

/*13. �Ʒ� ���ǿ� �´� ������ �˻� �Ͻÿ�
? ������ �ϳ��� ���� ���� ���� ������ ���������� �л����� ǥ���ϴ� ������ �ۼ��Ѵ�*/

SELECT P.PROFESSOR_NAME AS "��������", COUNT(S.STUDENT_NO) AS "�л���"
FROM TB_PROFESSOR P
LEFT JOIN TB_CLASS C ON P.PROFESSOR_NO = C.CLASS_NO
LEFT JOIN TB_STUDENT S ON P.PROFESSOR_NO = S.COACH_PROFESSOR_NO
WHERE C.CLASS_NO IS NULL
GROUP BY P.PROFESSOR_NAME
HAVING COUNT(S.STUDENT_NO) > 0
ORDER BY P.PROFESSOR_NAME;

/*14. �������ǿ� �´� �����͸� ��ȸ �Ͻÿ�.
? �����С��迭�� �л��� �� 2009 �⵵ ���� �� 4.0 �̻��� �л��� ǥ���ϴ� ������ �ۼ��Ѵ�.
? ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ�� �Ѵ�.
? ������ ���� ������ ���� �ϰ� ������ �л��̸���(�����ټ�)���� ���� �Ѵ�*/

SELECT S.STUDENT_NAME AS "�л��̸�", G.TERM_NO AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_GRADE G ON S.STUDENT_NO = G.STUDENT_NO
WHERE D.CATEGORY = '����'
  AND G.TERM_NO LIKE '2009%'
GROUP BY S.STUDENT_NAME, G.TERM_NO
HAVING ROUND(AVG(G.POINT), 1) >= 4.0
ORDER BY S.STUDENT_NAME;

/*15. �������ǿ� �´� �����͸� ��ȸ �Ͻÿ�
? ����� �л��� �ִ� ���� 2007 ��, 2008 �� �б� �� ������
�⵵ �� ���� ����, �� ������ ǥ���ϴ� ������ �ۼ��Ѵ�. (������ �Ҽ��� 1 �ڸ������� �ݿø�)*/

SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "�⵵",
    SUBSTR(G.TERM_NO, 5, 2) AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) IN (2007, 2008)
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')), SUBSTR(G.TERM_NO, 5, 2)

UNION ALL

-- ������ �� ����
SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "�⵵",
    '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) IN (2007, 2008)
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY'))

UNION ALL

-- 01 �б���� ����
SELECT
    NULL AS "�⵵", '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '01'

UNION ALL

-- 02 �б���� ����
SELECT
    NULL AS "�⵵", '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '02'

UNION ALL

-- 03 �б���� ����
SELECT
    NULL AS "�⵵", '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '03'

UNION ALL

-- ��� �б��� ��� ����
SELECT
    NULL AS "�⵵", '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '����'
)

ORDER BY "�⵵", "�б�";


/*16. �������ǿ� �´� �����͸� ��ȸ �Ͻÿ�
? �����а������С� ������ �����ϴ� ���� 2004 �⵵ �б� �� ������
�� ������ ǥ���ϴ� ������ �ۼ��Ѵ�.
? ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ�� �Ѵ�.*/

SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "�⵵",
    SUBSTR(G.TERM_NO, 5, 2) AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT C.DEPARTMENT_NO
    FROM TB_CLASS C
    WHERE C.CLASS_NAME = '���а�������'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) = 2004
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')), SUBSTR(G.TERM_NO, 5, 2)

UNION ALL

SELECT
    2004 AS "�⵵", '' AS "�б�", ROUND(AVG(G.POINT), 1) AS "����"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT C.DEPARTMENT_NO
    FROM TB_CLASS C
    WHERE C.CLASS_NAME = '���а�������'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) = 2004
ORDER BY "�⵵", "�б�";









DESC TB_GRADE;
DESC TB_CLASS;

/*17. �л���ȣ�� �� 7 �ڸ��̰� 'A'�� �����ϸ� 4 ��° �ڸ� �����Ͱ� '3'�� �л� �� ���������� ���� '��'����
�л��� �л��̸� ��(�����ټ�)���� ǥ���ϴ� ������ �ۼ� �Ͻÿ�*/

SELECT S.STUDENT_NAME AS "�л��̸�",
       P.PROFESSOR_NAME AS "��������"
FROM TB_STUDENT S
JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
WHERE S.STUDENT_NO LIKE 'A__3___'
  AND SUBSTR(P.PROFESSOR_NAME, 1, 1) = '��'
ORDER BY S.STUDENT_NAME;

/*18. �������ǿ� �´� �����͸� ��ȸ �Ͻÿ�
? ����ü�ɡ��� �����С� �迭�� ��� �а��� �а��̸��� �л����� ǥ���ϴ� ������ �ۼ� �Ͻÿ�.
? �迭�̸� ��(�����ټ�)���� ���� �ϰ� ������ �л����� ���� ������ ���� �Ѵ�.*/

SELECT D.CATEGORY AS "�迭",
       D.DEPARTMENT_NAME AS "�а��̸�",
       COUNT(S.STUDENT_NO) AS "�л���"
FROM TB_DEPARTMENT D
JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
WHERE D.CATEGORY IN ('��ü��', '����')
GROUP BY D.CATEGORY, D.DEPARTMENT_NAME
ORDER BY D.CATEGORY ;

/*19. �������а����� ��� ������ ���� ����� �Բ� �����̸���(�����ټ�)���� ǥ���ϴ� ������ �ۼ� �Ͻÿ�.
(���������� ���� ��µ��� �ʴ´�.)*/

SELECT C.CLASS_NAME AS "����",
       COALESCE(P.CLASS_NAME, C.CLASS_NAME) AS "��������"
FROM TB_CLASS C
LEFT JOIN TB_CLASS P ON C.PREATTENDING_CLASS_NO = P.CLASS_NO
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE D.DEPARTMENT_NAME = '�����а�'
  AND C.PREATTENDING_CLASS_NO IS NOT NULL
ORDER BY C.CLASS_NAME;










