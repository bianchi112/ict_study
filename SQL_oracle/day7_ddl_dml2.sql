-- day7_ddl_dml2.sql

-- ���������� ����ؼ� �� ���̺� ����� ----------------------
-- ���� ��� �Ǵ� SELECT �� ����� ���̺�� �����ϴ� �뵵��
-- CREATE TABLE ���̺�� AS ��������;

CREATE TABLE EMP_COPY90
AS 
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = '90';

SELECT * FROM EMP_COPY90;

-- ���̺� ���� Ȯ�� : DESCRIBE ��� ���
DESC EMP_COPY90;

-- ���̺� ���纻 ����� : 
CREATE TABLE EMP_COPY
AS
SELECT * FROM EMPLOYEE;

DESC EMP_COPY;

SELECT * FROM EMP_COPY;
-- ���������� �̿��ؼ� ���� ���̺��� ������ ���,
-- �÷���, �ڷ���, NOT NULL ��������, ��(DATE)�� �״�� �����
-- ������ �������ǵ��� ���� �ȵ�, DEFAULT ������ ���� �� ��

-- �ǽ� 1 : 
-- ��� �������� ���, �̸�, �޿�, ���޸�, �μ���, �ٹ�������, �Ҽӱ����� ��ȸ�� �����
-- EMP_LIST ���̺� �����Ͻÿ�.
CREATE TABLE EMP_LIST
AS
SELECT EMP_ID, EMP_NAME, SALARY, JOB_TITLE, DEPT_NAME, LOC_DESCRIBE, COUNTRY_NAME
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN LOCATION ON (LOC_ID = LOCATION_ID)
LEFT JOIN COUNTRY USING (COUNTRY_ID);


SELECT * FROM EMP_LIST; -- 22��

-- �ǽ� 2 : 
-- EMPLOYEE ���̺��� ���� ���� ������ ��󳻼�, EMP_MAN ���̺� �����Ͻÿ�.
-- �÷��� ��� ������
CREATE TABLE EMP_MAN AS
SELECT * 
FROM EMPLOYEE 
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3');

SELECT * FROM EMP_MAN ; -- 14��

-- �ǽ� 3 : 
-- ���� �������� ������ ��󳻼�, EML_FEMAIL ���̺� �����Ͻÿ�. ��ü �÷� ������
CREATE TABLE EML_FEMAIL
AS
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2','4');

SELECT * FROM EML_FEMAIL ;  -- 8��

-- �ǽ� 4 : 
-- �μ����� ���ĵ� �������� ����� PART_LIST ���̺� �����Ͻÿ�.
-- DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID ������ �÷� ����
-- PART_LIST �� �÷� ���� �߰��� : �μ��̸�, �����̸�, �����̸�, ���

CREATE TABLE PART_LIST 
AS 
SELECT DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID 
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN JOB  USING (JOB_ID)
ORDER BY DEPT_NAME;

SELECT * FROM PART_LIST ;

-- �÷� ���� �߰�
COMMENT ON COLUMN PART_LIST.DEPT_NAME IS '�μ��̸�';
COMMENT ON COLUMN PART_LIST.JOB_TITLE IS '�����̸�';
COMMENT ON COLUMN PART_LIST.EMP_NAME IS '�����̸�';
COMMENT ON COLUMN PART_LIST.EMP_ID IS '���';

-- �ǽ� : ���������� ������ ���̺� �����
-- ���̺�� : PHONEBOOK
-- �÷��� : ID CHAR(3) �⺻Ű(�����̸� : PK_PBID)
--         PNAME       VARCHAR2(20)    �� ������.
--                                    (NN_PBNAME)
--         PHONE       VARCHAR2(15)    �� ������
--                                    (NN_PBPHONE)
--                                     �ߺ��� �Է� ����
--                                    (UN_PBPHONE)
--         ADDRESS     VARCHAR2(100)    �⺻�� ������
--                                    '����� ���α�'

-- NOT NULL�� �����ϰ�, ��� ���̺� �������� �������� ������

CREATE TABLE PHONEBOOK (
    ID CHAR(3),
    PNAME VARCHAR2(20) CONSTRAINT NN_PBNAME NOT NULL,
    PHONE VARCHAR2(15) CONSTRAINT NN_PBPHONE NOT NULL,
    ADDRESS VARCHAR2(100) DEFAULT '����� ���α�',
    CONSTRAINT PK_PBID PRIMARY KEY (ID),
    CONSTRAINT UN_PBPHONE UNIQUE (PHONE)
);

INSERT INTO PHONEBOOK
VALUES ('A01', 'ȫ�浿', '010-1234-5678', DEFAULT);

SELECT * FROM PHONEBOOK;

-- ���������� �� ���̺� ���� ��,
-- ���������� SELECT �� �÷����� ������� �ʰ�, �� ���̺��� �÷����� �ٲ� ���� ����

CREATE TABLE JOB_COPY
AS
SELECT * FROM JOB;

SELECT * FROM JOB_COPY;

DESC JOB_COPY;

-- ���̺� ���� : DROP TABLE ���̺��;
DROP TABLE JOB_COPY;

CREATE TABLE JOB_COPY (�����ڵ�, ���޸�,  �����޿�, �ְ�޿�) -- ��ü �÷��� ����ÿ� ���
AS
SELECT * FROM JOB;

SELECT * FROM JOB_COPY;

DESC JOB_COPY;

-- �Ϻ� �÷� �� ���� �÷����� �ٲٰ��� �Ѵٸ�
CREATE TABLE DCOPY (DID, DMANE) -- ERROR, �������� SELECT �� �׸� ������ �ٸ�
AS
SELECT DEPT_ID, DEPT_NAME, LOC_ID
FROM DEPARTMENT;

-- �ذ�
CREATE TABLE DCOPY
AS
SELECT DEPT_ID DID, DEPT_NAME DNAME, LOC_ID
FROM DEPARTMENT;

DESC DCOPY;

-- ���������� �� ���̺� ���� ��, ��ü �÷��� �ٲٸ鼭 �������ǵ� �߰��� �� ����
-- ��, �ܷ�Ű(FOREIGN KEY) ���������� �߰��� �� ����

DROP TABLE TBL_SUBQUERY;

CREATE TABLE TBL_SUBQUERY (
    EID PRIMARY KEY, 
    ENAME, 
    SAL CHECK (SAL > 2000000), -- ERROR : �������� ����� 2�鸸���� ���� ���� ������
    DNAME, 
    JTITLE NOT NULL) -- ERROR : �������� ����� NULL �� ������
    -- �ذ��� 1 : NVL() �̿��ؼ� NULL �� �ٸ� ������ �ٲٴ� ���
    -- �ذ��� 2 : NULL�� ����
AS
SELECT  EMP_ID, EMP_NAME, SALARY, DEPT_NAME, NVL(JOB_TITLE, '������')
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
-- CHECK ���� ������ �߰��ǰ� �Ϸ���
WHERE SALARY > 2000000;

-- **************************************************************
-- ������ ��ųʸ� (������ ����)
-- ����ڰ� ������ ��� ��ü �������� ���̺� ���·� DBMS  �� �ڵ� ���� ������
-- ��, ����ڰ� ������ �������ǵ� �ڵ� ����ǰ� ���� => USER_CONSTRAINTS
-- ����� ������ ��ȸ�� �� �� ����
-- ��ųʸ��� ����ڰ� ���� �Ǵ� ������ �� ���� (DBMS �� �ڵ����� ������)

DESC USER_CONSTRAINTS;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PHONEBOOK'; 

-- CONSTRAINT_TYPE
-- P : PRIMARY KEY
-- U : UNIQUE
-- R : FOREIGN KEY
-- C : CHECK, NOT NULLL

-- ����ڰ� ���� ���̺� ���� : USER_TABLES, USER_CATEGORY, USER_OBJECTS
DESC USER_TABLES;

SELECT * FROM USER_TABLES;

-- ����ڰ� ���� ������ ��ü : USER_SEQUENCES
SELECT * FROM USER_SEQUENCES;

-- ����ڰ� ���� �� ��ü : USER_VIEWS
SELECT * FROM USER_VIEWS;

-- ���� �����(USER)�� ������ �� �ִ� ��� ���̺���� ��ȸ
SELECT * FROM ALL_TABLES;

-- DBA(DataBasa Administrator : �����ͺ��̽� ������)�� ������ �� �ִ� ���̺� ��ȸ
-- DBA_TABLES
SELECT * FROM DBA_TABLES; -- �����ڰ������� Ȯ���ؾ� ��























