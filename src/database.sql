-- 1 ɾ�����ݿ�
DROP DATABASE IF EXISTS minishop;

-- ɾ�����ݱ� ��ɾ�ӱ� ��ɾ����
DROP TABLE IF EXISTS details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS admin;


-- 2 �������ݿ� �������ַ���
CREATE DATABASE mshop CHARACTER SET UTF8;

-- �л����ݱ�
USE mshop;

-- 1 ������Ʒ���ͱ�
CREATE TABLE item(
	iid int AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	CONSTRAINT pk_iid PRIMARY KEY(iid)
) ENGINE=innodb;

-- 2 ��������Ա��Ϣ�ͱ�
CREATE TABLE admin(
	aid VARCHAR(50),
	password VARCHAR(32) NOT NULL,
	lastdate DATETIME,
	CONSTRAINT pk_mid PRIMARY KEY(aid)
) ENGINE=innodb;

-- 3 �����û���Ϣ��
CREATE TABLE member(
	mid VARCHAR(50),
	password VARCHAR(32) NOT NULL,
	name VARCHAR(50),
	phone VARCHAR(50),
	address VARCHAR(100),
	code VARCHAR(100),
	regdate DATETIME NOT NULL,
	photo VARCHAR(50) DEFAULT 'nophoto.jpg',
	CONSTRAINT pk_mid PRIMARY KEY(mid)
) ENGINE=innodb;

-- 4 ������Ʒ��Ϣ��
CREATE TABLE goods(
	gid INT AUTO_INCREMENT,
	iid INT,
	aid VARCHAR(50),
	title VARCHAR(50),
	pubdate DATETIME NOT NULL,
	price FLOAT,
	amount INT,
	bow INT,
	note TEXT,
	photo VARCHAR(100),
	status INT,
	CONSTRAINT pk_gid PRIMARY KEY(gid),
	CONSTRAINT fk_iid FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE SET NULL,
	CONSTRAINT fk_aid FOREIGN KEY(aid) REFERENCES admin(aid) ON DELETE SET NULL
) ENGINE=innodb;

-- 5 ������Ʒ��Ϣ��
CREATE TABLE orders(
	oid INT AUTO_INCREMENT,
	mid VARCHAR(50),
	name VARCHAR(50),
	phone VARCHAR(50),
	address VARCHAR(100),
	credate DATETIME,
	pay FLOAT,
	CONSTRAINT pk_oid PRIMARY KEY(oid),
	CONSTRAINT fk_mid FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE
) ENGINE=innodb;

-- 6 �������������
CREATE TABLE details(
	odid INT AUTO_INCREMENT,
	oid int NOT NULL,
	gid int,
	title VARCHAR(50) NOT NULL,
	price FLOAT NOT NULL,
	amount INT NOT NULL,
	CONSTRAINT pk_odid PRIMARY KEY(odid),
	CONSTRAINT fk_oid FOREIGN KEY(oid) REFERENCES orders(oid) ON DELETE CASCADE,
	CONSTRAINT fk_gid FOREIGN KEY(gid) REFERENCES goods(gid) ON DELETE SET NULL
) ENGINE=innodb;

-- ��д��������
-- ������Ŀ
INSERT INTO item(title) VALUES ("������Ʒ");
INSERT INTO item(title) VALUES ('��ͯ���');
INSERT INTO item(title) VALUES ('ҽ����е');
INSERT INTO item(title) VALUES ('�˶�����');
INSERT INTO item(title) VALUES ('�칫��Ʒ');

-- ���ӹ���Ա��Ϣ admin ����hello
INSERT INTO admin(aid,password) VALUES ('admin','5d41402abc4b2a76b9719d911017c592');

-- ������ͨ�û� ben haha 
INSERT INTO member(mid,password,regdate) VALUES ('ben','4e4d6c332b6fe62a63afe56171fd3725','1999-10-11');

-- �ύ����
COMMIT;