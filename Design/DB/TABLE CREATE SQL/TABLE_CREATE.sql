/* ANONYMOUS_BOARD  */
drop table ANONYMOUS_BOARD;
drop sequence ANONYMOUS_BOARD_SEQ;
purge recyclebin;

create table ANONYMOUS_BOARD(
	SEQ number constraint ANONYMOUS_BOARD_PK primary key,  /* ANONYMOUS_BOARD ������ */
	NAME varchar2(30),					/* �ۼ��� */
	PWD varchar2(20),					/* ��й�ȣ */
 	SUBJECT varchar2(100),					/* ���� */
	CONTENT varchar2(4000),					/* ���� */
	VIEW_COUNT number default 0,				/* ��ȸ�� */
	LIKE_COUNT number default 0,				/* ��õ�� */
	CDATE date default SYSDATE,						/* �ۼ��� */
	RDATE date,				/* ������ */
	PARENT_SEQ number					/* �θ�� */
);

create sequence ANONYMOUS_BOARD_SEQ increment by 1 start with 1 nocache;

/* ANONYMOUS_BOARD_REPLY  */
drop table ANONYMOUS_BOARD_REPLY;
drop sequence ANONYMOUS_BOARD_REPLY_SEQ;
purge recyclebin;

create table ANONYMOUS_BOARD_REPLY(
	SEQ number constraint ANONYMOUS_BOARD_REPLY_PK primary key,	/* ANONYMOUS_BOARD_REPLY ������ */
	NAME varchar2(30),						/* �ۼ��� */
	PWD varchar2(20),						/* ��й�ȣ */
	REPLY_CONTENT varchar2(255),					/* ���� */
	HATE_COUNT number default 0,					/* ��ȸ�� */
	LIKE_COUNT number default 0,					/* ��õ�� */
	PARENT_SEQ number,						/* �θ�� */
	CDATE date							/* �ۼ��� */ 
);

create sequence ANONYMOUS_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;

/* ANONYMOUS_BOARD_FILE  */
DROP TABLE ANONYMOUS_BOARD_FILE;
DROP SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

CREATE TABLE ANONYMOUS_BOARD_FILE (
	SEQ NUMBER primary key,		/* ���Ϲ�ȣ */
	OFNAME VARCHAR2(255),		/* ���Ͽ��� �̸� */
	FNAME VARCHAR2(255),		/* ���ϸ� */
	CDATE DATE default SYSDATE,	/* upload�� */
	PARENT_SEQ NUMBER		/* �θ�� ��ȣ */
);
		
create SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

/*CASH*/
drop table CASH;
drop sequence CASH_SEQ;
purge recyclebin;

create table CASH(	
       SEQ 			number primary key, /*��������*/
       MONEY		number, /*������*/
       CHARING		number, /*�����ݾ�*/
       CHARDATE		date default SYSDATE,   /*������¥*/
       MEMBER_SEQ	number,  /*�����ȣ*/
       APPROVE		number default 0
);

create sequence CASH_SEQ INCREMENT BY 1;

/*CONSULTING BOARD FILE*/
DROP TABLE CONSULTING_BOARD_FILE;
DROP SEQUENCE CONSULTING_BOARD_FILE_SEQ;
/* ���� */
CREATE TABLE CONSULTING_BOARD_FILE (
	SEQ NUMBER primary key, /* ���Ϲ�ȣ */
	OFNAME VARCHAR2(50), /* ���Ͽ��� �̸� */
	FNAME VARCHAR2(50), /* ���ϸ� */
	CDATE DATE default SYSDATE, /* upload�� */
	PARENT_SEQ NUMBER /* �θ�� ��ȣ */
);
		
create SEQUENCE CONSULTING_BOARD_FILE_SEQ;

/* CONSULTING_BOARD_REPLY  */
drop table CONSULTING_BOARD_REPLY;
drop sequence CONSULTING_BOARD_REPLY_SEQ;
purge recyclebin;


create table CONSULTING_BOARD_REPLY(
	SEQ number constraint CONSULTING_BOARD_REPLY_PK primary key,  /* CONSULTING_BOARD_REPLY ������ */
	WRITER_SEQ number,				/* �ۼ��� */
	REPLY_CONTENT varchar2(255),	/* ���� */
	HATE_COUNT number default 0,	/* ��ȸ�� */
	LIKE_COUNT number default 0,	/* ��õ�� */
	PARENT_SEQ number,				/* �θ�� */
	CDATE date						/* �ۼ��� */ 
);

create sequence CONSULTING_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;

/* CONSULTING_BOARD */

drop table CONSULTING_BOARD;
drop sequence CONSULTING_BOARD_SEQ;
drop view CONSULTING_BOARD_VIEW;
purge recyclebin;

create table CONSULTING_BOARD(
	SEQ number constraint RCONSULTING_BOARD_PK primary key,
	SUBJECT varchar2(100),
	CONTENT varchar2(4000),
	WRITER_SEQ number,
	VIEW_COUNT number default 0,
	LIKE_COUNT number default 0,
	CDATE date default SYSDATE,
	RDATE date,
	PARENT_SEQ number
);

create sequence CONSULTING_BOARD_SEQ increment by 1 start with 1 nocache;

create or replace view CONSULTING_BOARD_VIEW
as SELECT ROWNUM as ROWNUMBER, JOINBOARD.* from
(select * from CONSULTING_BOARD left outer join MEMBER on (WRITER_SEQ=MEMBER.SEQ)) as JOINBOARD
start with PARENT_SEQ is null
connect by prior SEQ = PARENT_SEQ
order siblings by SEQ desc;



/* GAME_BOARD_FILE*/
DROP TABLE GAME_BOARD_FILE;
DROP SEQUENCE GAME_BOARD_FILE_SEQ;

/* ���� */
CREATE TABLE GAME_BOARD_FILE (
	SEQ NUMBER primary key, /* ���Ϲ�ȣ */
	OFNAME VARCHAR2(50), /* ���Ͽ��� �̸� */
	FNAME VARCHAR2(50), /* ���ϸ� */
	CDATE DATE default SYSDATE, /* upload�� */
	PARENT_SEQ NUMBER /* �θ�� ��ȣ */
);
		
create SEQUENCE GAME_BOARD_FILE_SEQ;

/* GAME_BOARD_REPLY  */
drop table GAME_BOARD_REPLY;
drop sequence GAME_BOARD_REPLY_SEQ;
purge recyclebin;


create table GAME_BOARD_REPLY(
	SEQ number constraint GAME_BOARD_REPLY_PK primary key,  /* GAME_BOARD_REPLY ������ */
	WRITER_SEQ number,				/* �ۼ��� */
	REPLY_CONTENT varchar2(255),	/* ���� */
	HATE_COUNT number default 0,	/* ��ȸ�� */
	LIKE_COUNT number default 0,	/* ��õ�� */
	PARENT_SEQ number,				/* �θ�� */
	CDATE date						/* �ۼ��� */ 
);

create sequence GAME_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;


/* GAME_BOARD */

drop table GAME_BOARD;
drop sequence GAME_BOARD_SEQ;
purge recyclebin;

create table GAME_BOARD(
	SEQ number constraint RGAME_BOARD_PK primary key,
	SUBJECT varchar2(100),
	CONTENT varchar2(4000),
	WRITER_SEQ number,
	VIEW_COUNT number default 0,
	LIKE_COUNT number default 0,
	CDATE date default SYSDATE,
	RDATE date,
	PARENT_SEQ number
);

create sequence GAME_BOARD_SEQ increment by 1 start with 1 nocache;

/* GAME DB */
DROP TABLE GAME;
DROP SEQUENCE GAME_SEQ;

/* GAME RESULT */
CREATE TABLE GAME (
	MEMBER_SEQ NUMBER, /* ȸ����ȣ */
	GAME_NO NUMBER, /* ����ȸ�� */
	PLAYER_REMAINING NUMBER, /* ȸ���ܾ� */
	BET_AMOUNT NUMBER, /* ���ñݾ� */
	THIS_AMOUNT NUMBER, /* ��ȸ�ݾ� */
	GAME_NAME VARCHAR2(255), /* �������� */
	CDATE DATE default SYSDATE
);

CREATE SEQUENCE GAME_SEQ INCREMENT BY 1;

/*MEMBER*/
drop table MEMBER;
drop sequence MEMBER_SEQ;

/*MEMBER*/
create table MEMBER(
	NO 	number constraint MEMBER_PK primary key, /*ȸ����ȣ*/
	NAME	varchar2(15),			     /*�̸�*/
	ID		varchar2(15),			     /*���̵�*/
	PWD		varchar2(15),			     /*��й�ȣ*/
	EMAIL	varchar2(30),			     /*�̸���*/
	PHONE   varchar2(30),			     /*�ڵ�����ȣ*/
	ACCNUM  varchar2(40),			     /*���¹�ȣ*/
	MONEY	NUMBER,				     /*�ܾ�*/
	JOINDATE date default SYSDATE,		     /*ȸ�����Գ�¥*/
	AUTHOR_LEVEL NUMBER
);

create sequence MEMBER_SEQ increment by 1 start with 1 nocache;

/* HELPER */
drop table HELPER;
drop sequence HELPER_SEQ;

/* HELPER */

create table HELPER(
	SEQ number constraint HELPER_PK primary key,
	MEMBER_SEQ NUMBER,
	CDATE DATE DEFAULT SYSDATE,
	GAME_DATE DATE,
	GAME_TODAY NUMBER DEFAULT 0 
);

create sequence HELPER_SEQ INCREMENT BY 1 start with 1 nocache;

