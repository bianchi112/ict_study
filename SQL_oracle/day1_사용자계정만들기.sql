-- day1 : �����ڰ���(system/oracle) ���� �Ϲ� ����ڰ��� �����ϱ�

-- ���� ���ӵ� ����� ���� ����
show user;
SHOW USER;
Show uSer;

/*
11g ������ ������ ��ġ�� ���͵� ���� ������ ������ �Ǿ���.
soctt/tiger, hr/hr => ���� ���̺�� �����͵��� ������ ��
18c ���ʹ� ������ �� ��
*/

-- ����� ���� �����
-- create user ���̵�� identified by ��ȣ;
-- 12c ���ʹ� ����ڰ���(���̵�) �����, ���̵� ���� �տ� �ݵ�� c## �� �ٿ��� ��

-- �����ͺ��̽��� ����ڰ����� ��ȣ ���� �Ŀ� ������ �ο��ؾ� ��
-- ���� �ο� ��� ���� : 
-- grant ��������, ��������, ..... to ����ڰ���;
-- �������� : create session(�α׿� ����), create table, insert ito, update, delete, select ���
-- ���� ���ѵ��� ��� ���� ��ü�� �̿��� ���� ���� : ��(ROLE) �̶�� ��
-- ����Ŭ�� �����ϴ� ���� �̿��� ���� ���� : CONNECT ��, RESOURCE �� ��
-- ��� ���� : GRANT ���̸�, ���̸� TO ����ڰ���;

-- ������ ���� �����, ���Ѱ� ���̺����̽� �Ҵ�
CREATE USER c##student IDENTIFIED BY student;
GRANT CONNECT, RESOURCE TO c##scott;
ALTER USER c##student QUOTA 1024M ON USERS;

-- ����Ŭ 12C ������ ����(GRANT)�� �ο��ϸ� ���̺� ������ ������ ��� ���� ��������
-- 18C ���ʹ� ���� �ο� �Ŀ� Ƽ�̺� �����̼�(TABLE SPACE)�� �Ҵ�޾ƾ�
-- ���̺� ������ ������ ���� ����� ����������
-- ����� ���� �������� ������
-- ��� ���� : 
-- ALTER USER ����ڰ��� QUOTA �Ҵ����ũ�� ON USERS;

-- ����ڰ��� : c##scott, ��ȣ : tiger
-- ����� �߰� �����ϰ�, ���� �� �ڿ� ��� ��(Role)�� �̿��ؼ� ���Ѻο�
-- ���̺� �����̽� �Ҵ��� : 1024M

CREATE USER c##scott IDENTIFIED BY tiger;
GRANT CONNECT, RESOURCE TO c##scott;
ALTER USER c##scott QUOTA 1024M ON USERS;

/*
������ ���� : c##homework, ��ȣ : homework
���� �ο� : �� �̿� - connect, resource
���̺� �����̽� �Ҵ� : 1024M 
���� �信 '���������' �߰� ����ϱ�
����������� ����� ��ũ��Ʈ ������ 
*/
CREATE USER c##homework IDENTIFIED BY homework;
GRANT CONNECT, RESOURCE TO c##homework;
ALTER USER c##homework QUOTA 1024M ON USERS;

drop user c##homework;

-- ����ڰ��� �����ϱ�
-- ����ڰ����� ������ ���� ��, �����ϰ� �ٽ� �������
-- ���� : DROP USER ����ڰ��� [CASCADE];

CREATE USER c##ttt IDENTIFIED BY ttt;

DROP USER c##ttt;
DROP USER c##ttt CASCADE;

-- �����ͺ��̽� ���ӽ� ���� �Ǵ� ��ȣ�� ��Ÿ�� ��� ������ �߻���Ű�ų�
-- �ڹ� �Ǵ� ���̽��� �ڵ�� SQL������ �����ͺ��̽��� �����ؼ� ���� ��û�� ���
-- SQL���� ������ ���� ��� (��� �ݺ��� ���)
-- �����ͺ��̽��� �ش� ����ڰ����� ��ۼ� ���� (LOCK)
-- �����ڰ������� ��� ����ڰ����� LOCK ���� ó���ؾ� ��
-- ���� : ALTER USER ����ڰ��� IDENTIFIED BY ��ȣ ACCOUNT UNLOCK;

-- ����ڰ��� ��ױ� (LOCK)
ALTER USER c##student IDENTIFIED BY student ACCOUNT LOCK; -- ���
ALTER USER c##student IDENTIFIED BY student ACCOUNT UNLOCK; -- ����

-- ��ȣ �����
-- ALTER USER ����ڰ��� IDENRIFIED BY �ٲܾ�ȣ;

CREATE USER c##ttt IDENTIFIED BY ttt;
GRANT CONNECT TO c##ttt;
CONN c##ttt/ttt;

ALTER USER c##ttt IDENTIFIED BY s123;
CONN c##ttt/ttt; -- ���� ���� Ȯ��
DROP USER c##ttt;











