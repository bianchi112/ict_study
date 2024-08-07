-- day8_ddl_dml3.sql

-- DDL (������ ���Ǿ�)
-- �����ͺ��̽� ��ü�� ����(CREATE), ����(ALTER), ����(DROP)�� ����ϴ� ����

-- ���̺� ���� --------------------------------------
-- �÷� �߰�/����, �ڷ��� ����, �⺻��(DEFAULT) ����
-- �������� �߰�/����
-- �̸� ���� : ���̺�, �÷�, ��������

-- �÷� �߰�
-- ���̺� ���� �� �÷� ������ �����ϰ� �ۼ��ϸ� ��
SELECT * FROM DCOPY;

ALTER TABLE DCOPY
ADD ( LNAME VARCHAR2(40) );

-- �÷� �߰� Ȯ��
DESC DCOPY;

SELECT * FROM DCOPY;

ALTER TABLE DCOPY
ADD ( CNAME VARCHAR2(30) DEFAULT '�ѱ�' );

-- �������� �߰�
-- ���纻 ���̺� �����
CREATE TABLE EMP2
AS
SELECT * FROM EMPLOYEE;

ALTER TABLE EMP2
ADD PRIMARY KEY (EMP_ID); -- �������� �̸� �ڵ� �ο��� : SYS_C................

-- �������� �߰� Ȯ�� : �������� ���� ��ųʸ� �̿�
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP2';

-- NOT NULL �� ADD �� �߰��ϴ� ���� �ƴ϶�, NULL ���� NOT NULL �� �����ϴ� ����
ALTER TABLE EMP2
ADD NOT NULL (HIRE_DATE); -- ERROR

ALTER TABLE EMP2
MODIFY ( HIRE_DATE NOT NULL );

ALTER TABLE EMP2
MODIFY (HIRE_DATE NULL);

-- �÷� �ڷ��� ����
CREATE TABLE EMP4
AS
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

-- ���̺� ���� Ȯ��
DESC EMP4;
-- ��ϵ� ������ Ȯ��
SELECT * FROM EMP4;

ALTER TABLE EMP4
MODIFY ( EMP_ID VARCHAR2(20)
        , EMP_NAME CHAR(20) ); -- ������ (CHAR <=> VARCHAR2) ������ ������ �� ����
        -- ũ��� ���ų� ������ų �� ���� (���� ���� ���� => ERROR)
        
-- DEFAULT �� ����
CREATE TABLE EMP5(
    EMP_ID CHAR(3)
    , EMP_NAME VARCHAR2(20)
    , ADDR1 VARCHAR(20) DEFAULT '����'
    , ADDR2 VARCHAR2(100)
);

-- ������ ���(����)
INSERT INTO EMP5 VALUES ('A10', '������', DEFAULT, 'û�㵿 123');
INSERT INTO EMP5 VALUES ('B10', '�̺���', DEFAULT, '�д籸 ���ڵ� 77');

SELECT * FROM EMP5;

ALTER TABLE EMP5
MODIFY ( ADDR1 DEFAULT '���');

-- ���� ���Ŀ� DEFAULT ���ÿ��� �ٲ� �� ����
INSERT INTO EMP5 VALUES ('C10', '�ӽ¿�', DEFAULT, '�д籸 ȿ�ڵ� 987');

SELECT * FROM EMP5;

-- �÷� ����
ALTER TABLE DCOPY
DROP COLUMN CNAME; -- �÷� 1���� ����

DESC DCOPY;
ROLLBACK; -- �÷� ������ ������ �� ����

ALTER TABLE DCOPY
DROP ( LOC_ID, LNAME ); -- �÷� ���� �� ����

SELECT * FROM DCOPY; -- �����͵� �Բ� ���� Ȯ��

-- ���̺��� �÷��� ��� ������ �� ����
-- ���̺��� �ּ� �� ���� �÷��� �־�� �� => �÷� ���� �� ���̺��� ������ �� ����
CREATE TABLE TTT(); -- ERROR

ALTER TABLE DCOPY
DROP ( DID, DNAME ); --  ERROR

-- �ܷ�Ű (FOREIGN KEY) ������������ �����Ǵ� �÷�(�θ�Ű)�� ���� �� ��
ALTER TABLE  DEPARTMENT
--DROP  (DEPT_ID); -- ERROR
DROP (DEPT_ID) CASCADE CONSTRAINTS; -- OK : �÷��� ������ �������ǵ鵵 �Բ� �����ǰ� �ϸ� ������

DESC  DEPARTMENT;

-- ���������� ������ �÷��� �÷��� ���� ���� = �÷��� �������ǵ� ���� �����ؾ� ��
CREATE TABLE TB1(
    PK NUMBER PRIMARY KEY
    ,  FK NUMBER REFERENCES TB1
    , COL1 NUMBER
    -- ���̺���
    , CHECK (PK > 0 AND COL1 > 0)
);

ALTER TABLE T1
DROP (PK ) ; -- ERROR

ALTER TABLE  TB1
DROP (COL1); -- ERROR

-- �������ǵ� �Բ� �����ϸ� �� : CASCADE CONSTRAINTS
ALTER TABLE TB1
DROP (PK) CASCADE CONSTRAINTS; -- OK

ALTER TABLE TB1
DROP (COL1) CASCADE CONSTRAINTS; -- OK

DESC TB1;

-- �������� ����
-- �������� ������ ��ųʸ����� ���� Ȯ��
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'CONSTRAINT_EMP';

-- �������� 1�� ����
ALTER TABLE CONSTRAINT_EMP
DROP CONSTRAINT CHK;

-- �������� ���� �� ����
ALTER TABLE CONSTRAINT_EMP
DROP CONSTRAINT FKMID
DROP CONSTRAINT NENAME
DROP CONSTRAINT UEMAIL;

-- �������� ������ ����
ALTER TABLE CONSTRAINT_EMP
DROP PRIMARY KEY;

ALTER TABLE CONSTRAINT_EMP
DROP UNIQUE (ENO);

-- NOT NULL �������� ������ ����� �̸� ����  �Ǵ� NULL �� �����ϴ� ����� ����
ALTER TABLE CONSTRAINT_EMP
-- DROP CONSTRAINT NENO;
MODIFY (ENO NULL);

-- ���̺��� �÷��� �����ϴ� ������ ��ųʸ� : USER_TAB_COLS
SELECT * FROM USER_TAB_COLS;
DESC USER_TAB_COLS;

-- �÷��� ���������� �����ϴ� ������ ��ųʸ� : USER_CONS_COLUMNS
CREATE TABLE TB_EXAM (
    COL1 CHAR(3) PRIMARY KEY
    , ENAME VARCHAR(20)
    , FOREIGN KEY (COL1) REFERENCES EMPLOYEE -- �⺻Ű�� �����÷��� ��
);

-- ��ųʸ��� Ȯ��
SELECT CONSTRAINT_NAME �̸�,
        CONSTRAINT_TYPE ����,
        COLUMN_NAME �÷�,
        R_CONSTRAINT_NAME ����,
        DELETE_RULE ������Ģ
FROM USER_CONSTRAINTS
JOIN USER_CONS_COLUMNS USING (CONSTRAINT_NAME, TABLE_NAME)
WHERE TABLE_NAME = 'TB_EXAM';

-- �̸� �ٲٱ� ----------------------------
-- ���̺��, �÷���, �������� �̸�

DESC TB_EXAM;

-- �÷��� �ٲٱ�
ALTER TABLE TB_EXAM
RENAME COLUMN COL1 TO DEMPID;

-- �������� �̸� �ٲٱ�
SELECT CONSTRAINT_NAME, COLUMN_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
JOIN USER_CONS_COLUMNS USING (CONSTRAINT_NAME, TABLE_NAME)
WHERE TABLE_NAME = 'TB_EXAM';

ALTER TABLE TB_EXAM
RENAME CONSTRAINT SYS_C008733 TO PK_EID;

ALTER TABLE TB_EXAM
RENAME CONSTRAINT SYS_C008734 TO FK_EID;

-- ���̺�� �ٲٱ�
ALTER TABLE TB_EXAM RENAME TO TB_SAMPLE1;
-- �Ǵ�
RENAME TB_SAMPLE1 TO TB_SAMPLE;

-- ���̺� �����ϱ�-------------------------
-- DROP TABLE ���̺�� [CASACDE CONSTRAINTS];

CREATE TABLE DEPT (
    DID CHAR(2) PRIMARY KEY
    , DNAME VARCHAR2(10) 
);

CREATE TABLE EMP6(
    EID CHAR(3)  PRIMARY KEY
    , ENAME VARCHAR2(10)
    , DID CHAR(2) REFERENCES DEPT
);

-- �����Ǵ� ���̺� (�θ� ���̺�)�� ���� �� ��
DROP TABLE DEPT; -- ERROR
DROP TABLE DEPT CASCADE CONSTRAINTS;
-- DEPT �� ���� REFERENCES �������ǵ� �Բ� ������






