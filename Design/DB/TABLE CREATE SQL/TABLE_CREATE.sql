/* ANONYMOUS_BOARD  */
drop table ANONYMOUS_BOARD;
drop sequence ANONYMOUS_BOARD_SEQ;
purge recyclebin;

create table ANONYMOUS_BOARD(
	SEQ number constraint ANONYMOUS_BOARD_PK primary key,  /* ANONYMOUS_BOARD 시퀀스 */
	NAME varchar2(30),					/* 작성자 */
	PWD varchar2(20),					/* 비밀번호 */
 	SUBJECT varchar2(100),					/* 제목 */
	CONTENT varchar2(4000),					/* 내용 */
	VIEW_COUNT number default 0,				/* 조회수 */
	LIKE_COUNT number default 0,				/* 추천수 */
	CDATE date default SYSDATE,						/* 작성일 */
	RDATE date,				/* 수정일 */
	PARENT_SEQ number					/* 부모글 */
);

create sequence ANONYMOUS_BOARD_SEQ increment by 1 start with 1 nocache;

/* ANONYMOUS_BOARD_REPLY  */
drop table ANONYMOUS_BOARD_REPLY;
drop sequence ANONYMOUS_BOARD_REPLY_SEQ;
purge recyclebin;

create table ANONYMOUS_BOARD_REPLY(
	SEQ number constraint ANONYMOUS_BOARD_REPLY_PK primary key,	/* ANONYMOUS_BOARD_REPLY 시퀀스 */
	NAME varchar2(30),						/* 작성자 */
	PWD varchar2(20),						/* 비밀번호 */
	REPLY_CONTENT varchar2(255),					/* 내용 */
	HATE_COUNT number default 0,					/* 조회수 */
	LIKE_COUNT number default 0,					/* 추천수 */
	PARENT_SEQ number,						/* 부모글 */
	CDATE date							/* 작성일 */ 
);

create sequence ANONYMOUS_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;

/* ANONYMOUS_BOARD_FILE  */
DROP TABLE ANONYMOUS_BOARD_FILE;
DROP SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

CREATE TABLE ANONYMOUS_BOARD_FILE (
	SEQ NUMBER primary key,		/* 파일번호 */
	OFNAME VARCHAR2(255),		/* 파일원래 이름 */
	FNAME VARCHAR2(255),		/* 파일명 */
	CDATE DATE default SYSDATE,	/* upload일 */
	PARENT_SEQ NUMBER		/* 부모글 번호 */
);
		
create SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

/*CASH*/
drop table CASH;
drop sequence CASH_SEQ;
purge recyclebin;

create table CASH(	
       SEQ 			number primary key, /*충전내역*/
       MONEY		number, /*소지금*/
       CHARING		number, /*충전금액*/
       CHARDATE		date default SYSDATE,   /*충전날짜*/
       MEMBER_SEQ	number,  /*사람번호*/
       APPROVE		number default 0
);

create sequence CASH_SEQ INCREMENT BY 1;

/*CONSULTING BOARD FILE*/
DROP TABLE CONSULTING_BOARD_FILE;
DROP SEQUENCE CONSULTING_BOARD_FILE_SEQ;
/* 파일 */
CREATE TABLE CONSULTING_BOARD_FILE (
	SEQ NUMBER primary key, /* 파일번호 */
	OFNAME VARCHAR2(50), /* 파일원래 이름 */
	FNAME VARCHAR2(50), /* 파일명 */
	CDATE DATE default SYSDATE, /* upload일 */
	PARENT_SEQ NUMBER /* 부모글 번호 */
);
		
create SEQUENCE CONSULTING_BOARD_FILE_SEQ;

/* CONSULTING_BOARD_REPLY  */
drop table CONSULTING_BOARD_REPLY;
drop sequence CONSULTING_BOARD_REPLY_SEQ;
purge recyclebin;


create table CONSULTING_BOARD_REPLY(
	SEQ number constraint CONSULTING_BOARD_REPLY_PK primary key,  /* CONSULTING_BOARD_REPLY 시퀀스 */
	WRITER_SEQ number,				/* 작성자 */
	REPLY_CONTENT varchar2(255),	/* 내용 */
	HATE_COUNT number default 0,	/* 조회수 */
	LIKE_COUNT number default 0,	/* 추천수 */
	PARENT_SEQ number,				/* 부모글 */
	CDATE date						/* 작성일 */ 
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

/* 파일 */
CREATE TABLE GAME_BOARD_FILE (
	SEQ NUMBER primary key, /* 파일번호 */
	OFNAME VARCHAR2(50), /* 파일원래 이름 */
	FNAME VARCHAR2(50), /* 파일명 */
	CDATE DATE default SYSDATE, /* upload일 */
	PARENT_SEQ NUMBER /* 부모글 번호 */
);
		
create SEQUENCE GAME_BOARD_FILE_SEQ;

/* GAME_BOARD_REPLY  */
drop table GAME_BOARD_REPLY;
drop sequence GAME_BOARD_REPLY_SEQ;
purge recyclebin;


create table GAME_BOARD_REPLY(
	SEQ number constraint GAME_BOARD_REPLY_PK primary key,  /* GAME_BOARD_REPLY 시퀀스 */
	WRITER_SEQ number,				/* 작성자 */
	REPLY_CONTENT varchar2(255),	/* 내용 */
	HATE_COUNT number default 0,	/* 조회수 */
	LIKE_COUNT number default 0,	/* 추천수 */
	PARENT_SEQ number,				/* 부모글 */
	CDATE date						/* 작성일 */ 
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
	MEMBER_SEQ NUMBER, /* 회원번호 */
	GAME_NO NUMBER, /* 게임회차 */
	PLAYER_REMAINING NUMBER, /* 회원잔액 */
	BET_AMOUNT NUMBER, /* 배팅금액 */
	THIS_AMOUNT NUMBER, /* 금회금액 */
	GAME_NAME VARCHAR2(255), /* 게임종류 */
	CDATE DATE default SYSDATE
);

CREATE SEQUENCE GAME_SEQ INCREMENT BY 1;

/*MEMBER*/
drop table MEMBER;
drop sequence MEMBER_SEQ;

/*MEMBER*/
create table MEMBER(
	NO 	number constraint MEMBER_PK primary key, /*회원번호*/
	NAME	varchar2(15),			     /*이름*/
	ID		varchar2(15),			     /*아이디*/
	PWD		varchar2(15),			     /*비밀번호*/
	EMAIL	varchar2(30),			     /*이메일*/
	PHONE   varchar2(30),			     /*핸드폰번호*/
	ACCNUM  varchar2(40),			     /*계좌번호*/
	MONEY	NUMBER,				     /*잔액*/
	JOINDATE date default SYSDATE,		     /*회원가입날짜*/
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

