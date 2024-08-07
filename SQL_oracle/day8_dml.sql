-- day8_dml.sql

-- DML (Data Manipulation Language : ������ ���۾�)
-- ��ɱ��� : INSERT, UPDATE, DELETE
-- ���̺� �����͸� �߰� ��� (���� : INSERT) => �హ�� �þ
-- ���̺� ��ϵ� ������(�÷���)�� ���� (UPDATE) => �హ�� �������
-- ���̺� ��ϵ� ���� ���� (DELETE)= �హ�� �پ��

-- CRUD (C: INSERT, R: SELECT, U: UPDATE, D: DELETE)
-- TRUNCATE �� : ���̺��� ��� ���� ������ (���� �ȵ�)

-- UPDATE �� -------------------------------
/*
��ϵ� ������ ���� ����(����)�ϴ� ����
�ۼ����� : 
UPDATE ���̺��
SET ���ٲ��÷��� = �ٲܰ�, ���ٲ��÷��� = DEFAULT, ���ٲ��÷��� = (��������)
WHERE �÷��� ������ �񱳰� | (��������);

���� : 
WHERE ���� �����Ǹ�  ���̺��� �ش� �÷��� ��ü�� �����
�ٲ� �� �ش� �÷��� �������ǿ� ������� �ʾƾ� ��
*/

SELECT * FROM DCOPY;

UPDATE DCOPY
SET DNAME = '�λ���'
WHERE DID = '10'; -- WHERE ���� �����Ǹ�, �÷� ��ü ���� �����

-- ��� ����� DML ������ ���� ��ҵ�
ROLLBACK;

UPDATE DCOPY
SET DNAME = 'ȫ����'
WHERE DID = '30';

-- UPDATE �� SET ���� �ٲ� �� ��ſ� �������� ����� �� ����
-- WEHRE ���� �񱳰� ��ſ� �������� ����� �� ����

SELECT  * FROM EMP_COPY;

-- ���ϱ� ������ �����ڵ�� �޿���
-- ���ر� ������ �����ڵ�� �޿��� �����Ͻÿ�

-- UPDATE �� ������ Ȯ��
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMP_COPY
WHERE EMP_NAME IN ('���ϱ�', '���ر�');

UPDATE EMP_COPY
SET JOB_ID = (SELECT JOB_ID FROM EMP_COPY
                WHERE EMP_NAME = '���ر�'),
    SALARY = (SELECT SALARY FROM EMP_COPY
                WHERE EMP_NAME = '���ر�')
WHERE EMP_NAME = '���ϱ�';

-- ���߿� ���������� ����
UPDATE EMP_COPY
SET (JOB_ID, SALARY) = (SELECT JOB_ID,  SALARY FROM EMP_COPY
                        WHERE EMP_NAME = '���ر�')
WHERE EMP_NAME = '���ϱ�';

-- UPDATE �� ������ Ȯ��
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMP_COPY
WHERE EMP_NAME IN ('���ϱ�', '���ر�');

-- SET ���� �ٲ� ���� DEFAULT ����ص� ��
-- DEFAULT �� ������ �⺻���� ����(DEFAULT ������ �� �� �÷��̸� NULL ó����)
DESC EMP_COPY;

ALTER TABLE EMP_COPY
MODIFY (MARRIAGE DEFAULT 'N');

-- ���� �� Ȯ��
SELECT EMP_NAME, MARRIAGE
FROM EMP_COPY
WHERE EMP_ID = '210';

-- ����
UPDATE EMP_COPY
SET MARRIAGE = DEFAULT
WHERE EMP_ID = '210';

-- ���� �� Ȯ��
SELECT EMP_NAME, MARRIAGE
FROM EMP_COPY
WHERE EMP_ID = '210';

-- UPDATE �� WHERE ������ �������� ���� ����
-- �� : �ؿܿ���2�� �������� ���ʽ�����Ʈ ��� 0.3���� �����Ͻÿ�.
UPDATE EMP_COPY
SET BONUS_PCT = 0.3
WHERE DEPT_ID = (SELECT DEPT_ID
                 FROM DEPARTMENT
                 WHERE DEPT_NAME = '�ؿܿ���2��');

-- Ȯ��
SELECT EMP_NAME, BONUS_PCT, DEPT_ID
FROM EMP_COPY
WHERE DEPT_ID = (SELECT DEPT_ID
                 FROM DEPARTMENT
                 WHERE DEPT_NAME = '�ؿܿ���2��');

ROLLBACK;

-- SET ���� ���氪�� �������� ������� �ʴ� ���̾�� �Ѵ�.
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_DID_ECOPY FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT;

-- �����÷�(�θ�Ű) �� Ȯ��
SELECT DEPT_ID
FROM DEPARTMENT;

UPDATE  EMP_COPY
SET DEPT_ID = '65' -- ERROR : �������� �ʴ� ����
WHERE DEPT_ID IS NULL;

-- INSERT �� --------------------------------------
-- ���̺� ���ο� �����͸� ��� ������ �� ����� : �� ������ �þ
/*
�ۼ����� : 
INSERT INTO ���̺�� (������� �÷���, �÷���, ......)
VALUED (����Ұ�, ����Ұ�, .....);

VALUES ��ſ� �������� ����ص� ��, (��������) ��ȣ ������
INSERT INTO ���̺��
(SELECT ��������);

���� : 
1. ������ �÷��� ����� ���� ������ �ڷ��� ������ ��ġ�ؾ� ��
2. �÷� ������ �����Ǹ�, ���̺��� ��� �÷��� ���� ����Ѵٴ� �ǹ���
    => ���̺��� �÷� ���� ������ ���缭 ���� ����ؾ� ��
3. ��ϰ��� �������� ������� �ʴ� �� ����� ��
4. �÷��� ��ϰ��� ������ ���� ������ �� (EMP_NO �� �����̸� ��� ��)
*/

CREATE TABLE DEPT (
    DEPTID CHAR(2)
    , DEPTNAME VARCHAR(20)
);

SELECT COUNT(*) FROM DEPT; -- 0
SELECT * FROM DEPT;

INSERT INTO DEPT (DEPTID, DEPTNAME)
VALUES ('10', 'ȸ����');

SELECT COUNT(*)  FROM DEPT; -- 1
SELECT * FROM DEPT;

INSERT INTO DEPT
VALUES ('20', '�λ���');

SELECT COUNT(*)  FROM DEPT; -- 2
SELECT * FROM DEPT;

-- ���� ����� DML ��ɹ�(INSERT, UPDATE, DELETE)�� �޸��� ���ۻ󿡼� �۵��Ǿ���
-- ���̺� �߰�/����/������ ������ ����� ��ũ���� �����ͺ��̽� ���� �ý������� ����(�ݿ�)��Ŀ�� ��
-- Ʈ����� ��ɾ� (TCL : Transaction Control Language, Ʈ����� �����) : COMMIT,  ROLLBACK

COMMIT;

-- ���̺��� ���� ��ü �÷��� �� ��Ͻÿ��� �÷��� ������ �� ����
-- INSERT �ÿ� ����� �� ��ſ� DEFAULT, NULL ����ص� ��
SELECT * FROM  EMP_COPY; -- 22��
DESC EMP_COPY; -- �÷� 12��

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, HIRE_DATE,
                      JOB_ID, SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID)
VALUES ('900', 'ȫ�浿', '891225-1234567', 'hong123@test.org', '01012345678', '20/06/12',
        'J6', 4500000, 0.05, DEFAULT, '176', NULL);

SELECT * FROM  EMP_COPY; -- 23��

SELECT * FROM EMP_COPY
WHERE EMP_ID = '900'; -- ��ȸ Ȯ��

COMMIT;

INSERT INTO EMP_COPY
VALUES ('840', '������', '880315-2345678', 'ha_88@test.org', '01088887777', '22/03/15',
        'J6', 4300000, 0.045, 'Y', '141', '30');

SELECT * FROM  EMP_COPY; -- 24��

COMMIT;

-- INSERT �ÿ� �÷��� �Ϻ� �����Ǹ�, �ش� �÷��� NULL ó����
-- DEFAULT �� �������� ���� �÷��� DEFAULT ����ϸ� NULL ó����
INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO, SALARY, MARRIAGE)
VALUES ('888', '�ſ���', '880209-1456789', DEFAULT, DEFAULT);

SELECT * FROM  EMP_COPY
WHERE EMP_ID = '888'; -- 25��

-- INSERT �� �������� ���
-- VALUES ��ſ� �����

CREATE TABLE EMP(
    EMP_ID CHAR(3)
    , EMP_NAME VARCHAR2(20)
    , DEPT_NAME VARCHAR2(20)
);

SELECT * FROM EMP;

INSERT INTO EMP
SELECT EMP_ID, EMP_NAME, DEPT_NAME
FROM EMPLOYEE
LEFT OUTER JOIN DEPARTMENT USING (DEPT_ID); -- 22�� �߰�

SELECT * FROM EMP;

COMMIT;

-- �� ��Ͻ� �������� ������� �ʴ� ���̾�� ��

-- EMP_COPY ���̺� �������� �߰�
ALTER TABLE EMP_COPY
--ADD PRIMARY KEY (EMP_ID);
--ADD CONSTRAINT FK_MID_ECOPY FOREIGN KEY (MGR_ID) REFERENCES EMP_COPY;
ADD CONSTRAINT FK_JID_ECOPY FOREIGN KEY (JOB_ID) REFERENCES JOB
ADD UNIQUE (EMP_NO)
ADD CONSTRAINT CHK_MRG_ECOPY CHECK (MARRIAGE IN ('Y', 'N'));

-- DEFAULT ����
ALTER TABLE EMP_COPY
MODIFY (HIRE_DATE DEFAULT SYSDATE);

-- �������� ���� ���� Ȯ��
INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES (NULL, 'ȫ���', '911123-2345678'); -- ���� : EMP_ID �� PRIMARY KEY ��, NULL ��� �� ��

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('100', 'ȫ���', '911123-2345678'); -- ���� : EMP_ID �� PRIMARY KEY ��, ���� �� ��� �� ��

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', NULL, '94823-2345678'); -- ���� : EMP_NAME �� NOT NULL ��������, NULL ��� ����

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', 'ȫ���', '741122-2515789'); -- ���� : EMP_NO �� UNIQUE ��������, ���� �� �ι� ��� ����

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', 'ȫ���', NULL); -- ���� : EMP_NO �� NOT NULL ��������, NULL ��� ����

-- DELETE �� -------------------------------------
-- ���� �����ϴ� ������
-- ���̺��� �హ�� �پ��
-- ROLLBACK ������ (DELETE ������ ����� �� ����)
/*
DELETE FROM ���̺��
WHERE �÷��� ������ �񱳰�;

���� : 
1. FOREIGN KEY ������������ ����(REFERENCE)�ǰ� �ִ� ���̺��� �����÷�(�θ�Ű)�� ���� �Ұ�����
    => �ܷ�Ű �������� ������ ������ (SET NULL, CASCADE)�� �Բ� ������ ����  ���� ������
2. WHERE ���� �����Ǹ� ���̺��� ��� ���� ������ (���� ������)

���̺��� ��� ���� �����ϴ� ��� ���� : 
TRUNCATE TABLE ���̺��; --> ���� �Ұ���(�ѹ� �ȵ�)
*/

SELECT * FROM DCOPY; -- 7��

-- WHERE �� ����
DELETE FROM DCOPY;
-- Ȯ��
SELECT * FROM DCOPY; -- 0��

ROLLBACK; -- DELETE ���
SELECT * FROM DCOPY; -- 7��  : ������

TRUNCATE TABLE DCOPY;
SELECT * FROM DCOPY; -- 0��
ROLLBACK; -- ���� �� ��
SELECT * FROM DCOPY; -- 0�� 

-- �ٸ� ���̺��� FOREIGN KEY(�ܷ�Ű)�� �����ϰ� �ִ� ��(�θ�Ű)�� ���� �� ��
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90'; -- EMPLOYEE  �� DEPT_ID ���� ����ϰ� �ִ� ����, ���� �� ��

-- �θ�Ű Ȯ��
SELECT * FROM DEPARTMENT
ORDER BY DEPT_ID;

-- �ڽķ��ڵ� Ȯ�� : ����ϴ� �÷�
SELECT  DISTINCT DEPT_ID
FROM EMPLOYEE
ORDER BY 1 NULLS LAST;

-- ������ ���� �θ�Ű�� ������ �� ����
SELECT * FROM EMP_COPY
WHERE DEPT_ID = '30';

UPDATE EMP_COPY
SET DEPT_ID = NULL
WHERE EMP_ID = '840';

COMMIT;

DELETE FROM DEPARTMENT
WHERE DEPT_ID = '30';

ROLLBACK;



