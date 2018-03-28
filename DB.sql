========= DDOTMEMBER ===========

DROP TABLE DDOTMEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DDOTMEMBER;

CREATE TABLE DDOTMEMBER(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	PWD VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL,
	POINT NUMBER(8) NOT NULL,
	NICKNAME VARCHAR2(50) UNIQUE,
	PIC VARCHAR2(50) NOT NULL,
	INTRO VARCHAR2(50) NOT NULL,
	AUTH NUMBER(2)
);

CREATE SEQUENCE SEQ_DDOTMEMBER
START WITH 1 INCREMENT BY 1;

========= DDOTMEMBER ===========

========= DDOTBBS ===========

DROP TABLE DDOTBBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DDOTBBS;

CREATE TABLE DDOTBBS(
	SEQ NUMBER(8) PRIMARY KEY,
	NICKNAME VARCHAR2(50) NOT NULL,
	CATEGORY VARCHAR2(50) NOT NULL,
	SUBCATEGORY VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WDATE DATE NOT NULL,
	UP NUMBER(20),
	DOWN NUMBER(20),
	READCOUNT NUMBER(20),
	DEL NUMBER(2)
);

CREATE SEQUENCE SEQ_DDOTBBS
START WITH 1 INCREMENT BY 1;

ALTER TABLE DDOTBBS
ADD CONSTRAINT FK_DDOTBBS_NICKNAME FOREIGN KEY(NICKNAME)
REFERENCES DDOTMEMBER(NICKNAME);

========= DDOTBBS ===========

========= DDOTCOMM ===========

DROP TABLE DDOTCOMM
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DDOTCOMM;

CREATE TABLE DDOTCOMM(
	SEQ NUMBER(8) PRIMARY KEY,
	NICKNAME VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WDATE DATE NOT NULL,
	UP NUMBER(20),
	DOWN NUMBER(20),
	READCOUNT NUMBER(20),
	DEL NUMBER(2)
);

CREATE SEQUENCE SEQ_DDOTCOMM
START WITH 1 INCREMENT BY 1;

ALTER TABLE DDOTCOMM
ADD CONSTRAINT FK_DDOTCOMM_NICKNAME FOREIGN KEY(NICKNAME)
REFERENCES DDOTMEMBER(NICKNAME);

========= DDOTCOMM ===========

========= DDOTUPDOWN ===========

DROP TABLE DDOTUPDOWN
CASCADE CONSTRAINTS;

CREATE TABLE DDOTUPDOWN(
	BBS_SEQ NUMBER(8),
	COMM_SEQ NUMBER(8),
	NICKNAME VARCHAR2(50) NOT NULL,
	UPDOWN NUMBER(2) NOT NULL	--안눌렀을때 0 눌렀을때 1
);

ALTER TABLE DDOTUPDOWN
ADD CONSTRAINT FK_DDOTUPDOWN_NICKNAME FOREIGN KEY(NICKNAME)
REFERENCES DDOTMEMBER(NICKNAME);

ALTER TABLE DDOTUPDOWN
ADD CONSTRAINT FK_DDOTUPDOWN_BBS_SEQ FOREIGN KEY(BBS_SEQ)
REFERENCES DDOTBBS(SEQ);

ALTER TABLE DDOTUPDOWN
ADD CONSTRAINT FK_DDOTUPDOWN_COMM_SEQ FOREIGN KEY(COMM_SEQ)
REFERENCES DDOTCOMM(SEQ);

========= DDOTUPDOWN ===========

========= DDOTMESSAGE ===========

DROP TABLE DDOTMESSAGE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DDOTMESSAGE;

CREATE TABLE DDOTMESSAGE(
	SEQ NUMBER(8) PRIMARY KEY,
	NICKNAME VARCHAR2(50) NOT NULL,
	SENDTO VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	WDATE DATE NOT NULL,
	READ NUMBER(2)
);

CREATE SEQUENCE SEQ_DDOTMESSAGE
START WITH 1 INCREMENT BY 1;

ALTER TABLE DDOTMESSAGE
ADD CONSTRAINT FK_DDOTMESSAGE_NICKNAME FOREIGN KEY(NICKNAME)
REFERENCES DDOTMEMBER(NICKNAME);

========= DDOTMESSAGE ===========
