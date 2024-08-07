-- ��ũ�� _v2.0 
-- DDL

/*1. �迭 ������ ������ ī�װ� ���̺��� ������� ����. ������ ���� ���̺���
�ۼ��Ͻÿ�*/

CREATE TABLE TB_CATEGORY (
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

/*2. ���� ������ ������ ���̺��� ������� ����. ������ ���� ���̺��� �ۼ��Ͻÿ�.*/

CREATE TABLE TB_CLASS_TYPE (
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

/*3. TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� ���ٸ� �̸��� ������
�˾Ƽ� ������ �̸��� �������.)*/

ALTER TABLE TB_CATEGORY
ADD CONSTRAINT PK_TB_CATEGORY PRIMARY KEY (NAME);

/*4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.*/

ALTER TABLE TB_CLASS_TYPE
MODIFY NAME VARCHAR2(10) NOT NULL;

/*5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷�����
NAME �� ���� ���C������ ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.*/

-- TB_CATEGORY 
ALTER TABLE TB_CATEGORY
MODIFY NAME VARCHAR2(20);

-- TB_CLASS_TYPE 
ALTER TABLE TB_CLASS_TYPE
MODIFY NO VARCHAR2(10)
MODIFY NAME VARCHAR2(20);

/*6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_ �� ������ ���̺� �̸��� �տ�
���� ���·� ��������.
(ex. CATEGORY_NAME)*/

-- TB_CATEGORY 
ALTER TABLE TB_CATEGORY
RENAME COLUMN NAME TO CATEGORY_NAME;

-- TB_CLASS_TYPE 
ALTER TABLE TB_CLASS_TYPE
RENAME COLUMN NO TO CLASS_TYPE_NO;

ALTER TABLE TB_CLASS_TYPE
RENAME COLUMN NAME TO CLASS_TYPE_NAME;

/*7. TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ����
�����Ͻÿ�.
Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )*/

--TB_CATAGORY
ALTER TABLE TB_DEPARTMENT
DROP CONSTRAINT FK_DEPARTMENT_CATEGORY;

ALTER TABLE TB_CATEGORY
DROP CONSTRAINT PK_TB_CATEGORY;

ALTER TABLE TB_CATEGORY
ADD CONSTRAINT PK_CATEGORY_NAME PRIMARY KEY (CATEGORY_NAME);

--TB_CLASS_TYPE
SELECT CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'TB_CLASS_TYPE' AND CONSTRAINT_TYPE = 'P'; --SYS_C008777

ALTER TABLE TB_CLASS_TYPE
DROP CONSTRAINT SYS_C008777;

ALTER TABLE TB_CLASS_TYPE
ADD CONSTRAINT PK_CLASS_NAME PRIMARY KEY (CLASS_TYPE_NO);

/*8. ������ ���� INSERT ���� ��������.*/

INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT; 

/*9.TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ�
������ �����ϵ��� FOREIGN KEY �� �����Ͻÿ�. �� �� KEY �̸���
FK_���̺��̸�_�÷��̸����� ��������. (ex. FK_DEPARTMENT_CATEGORY )*/

ALTER TABLE TB_DEPARTMENT
ADD CONSTRAINT FK_DEPARTMENT_CATEGORY
FOREIGN KEY (CATEGORY)
REFERENCES TB_CATEGORY (CATEGORY_NAME);

-- DML
/*1. �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�.*/
INSERT INTO TB_CLASS_TYPE (CLASS_TYPE_NO, CLASS_TYPE_NAME) VALUES ('01', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE (CLASS_TYPE_NO, CLASS_TYPE_NAME) VALUES ('02', '��������');
INSERT INTO TB_CLASS_TYPE (CLASS_TYPE_NO, CLASS_TYPE_NAME) VALUES ('03', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE (CLASS_TYPE_NO, CLASS_TYPE_NAME) VALUES ('04', '���缱��');
INSERT INTO TB_CLASS_TYPE (CLASS_TYPE_NO, CLASS_TYPE_NAME) VALUES ('05', '������');

/*2. �� ������б� �л����� ������ ���ԵǾ� �ִ� �л��Ϲ����� ���̺��� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�)*/

CREATE TABLE TB_�л��Ϲ����� (
    �й� VARCHAR2(10),
    �л��̸� VARCHAR2(50),
    �ּ� VARCHAR2(200)
);

INSERT INTO TB_�л��Ϲ����� (�й�, �л��̸�, �ּ�)
SELECT STUDENT_NO AS �й�,
       STUDENT_NAME AS �л��̸�,
       STUDENT_ADDRESS AS �ּ�
FROM TB_STUDENT;

/*3. ������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ�
�ۼ��Ͻÿ�)*/

CREATE TABLE TB_������а� (
    �й� VARCHAR2(10),
    �л��̸� VARCHAR2(50),
    ����⵵ NUMBER(4),
    �����̸� VARCHAR2(50)
);

INSERT INTO TB_������а� (�й�, �л��̸�, ����⵵, �����̸�)
SELECT S.STUDENT_NO AS �й�,
       S.STUDENT_NAME AS �л��̸�,
       -- STUDENT_SSN���� 'YYMMDD'�� �����Ͽ� ������ ��ȯ
       CASE
           WHEN TO_NUMBER(SUBSTR(S.STUDENT_SSN, 1, 2)) >= 20 THEN
               TO_NUMBER('19' || SUBSTR(S.STUDENT_SSN, 1, 2)) -- 1900���
           ELSE
               TO_NUMBER('20' || SUBSTR(S.STUDENT_SSN, 1, 2)) -- 2000���
       END + TO_NUMBER(SUBSTR(S.STUDENT_SSN, 3, 2)) AS ����⵵,
       P.PROFESSOR_NAME AS �����̸�
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
WHERE D.DEPARTMENT_NAME = '������а�';

/*4. �� �а����� ������ 10% ������Ű�� �Ǿ���. �̿� ����� SQL ���� �ۼ��Ͻÿ�. (��,
�ݿø��� ����Ͽ� �Ҽ��� �ڸ����� ������ �ʵ��� ����)*/

UPDATE TB_DEPARTMENT
SET CAPACITY  = ROUND(CAPACITY  * 1.10);

/*5. �й� A413042 �� �ڰǿ� �л��� �ּҰ� "����� ���α� ���ε� 181-21 "�� ����Ǿ��ٰ�
����. �ּ����� �����ϱ� ���� ����� SQL ���� �ۼ��Ͻÿ�.*/

UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE STUDENT_NO = 'A413042';

/*6. �ֹε�Ϲ�ȣ ��ȣ���� ���� �л����� ���̺��� �ֹι�ȣ ���ڸ��� �������� �ʱ��
�����Ͽ���. �� ������ �ݿ��� ������ SQL ������ �ۼ��Ͻÿ�.
(��. 830530-2124663 ==> 830530 )*/

UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN, 1, INSTR(STUDENT_SSN, '-') - 1);

/*7. ���а� ����� �л��� 2005 �� 1 �б⿡ �ڽ��� ������ '�Ǻλ�����' ������
�߸��Ǿ��ٴ� ���� �߰��ϰ�� ������ ��û�Ͽ���. ��� ������ Ȯ�� ���� ��� �ش�
������ ������ 3.5 �� ����Ű�� �����Ǿ���. ������ SQL ���� �ۼ��Ͻÿ�.*/

UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = (SELECT STUDENT_NO 
                     FROM TB_STUDENT 
                     WHERE STUDENT_NAME = '�����' 
                       AND DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                                            FROM TB_DEPARTMENT 
                                            WHERE DEPARTMENT_NAME = '���а�'))
  AND CLASS_NO = (SELECT CLASS_NO 
                  FROM TB_CLASS 
                  WHERE CLASS_NAME = '�Ǻλ�����')
  AND TERM_NO = '200501';

/*8. ���� ���̺�(TB_GRADE) ���� ���л����� �����׸��� �����Ͻÿ�.*/

DELETE FROM TB_GRADE
WHERE STUDENT_NO IN (
    SELECT STUDENT_NO
    FROM TB_STUDENT
    WHERE ABSENCE_YN = 'Y'
);



