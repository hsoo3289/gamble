/* ANONYMOUS_BOARD  */
drop table ANONYMOUS_BOARD;
drop sequence ANONYMOUS_BOARD_SEQ;
purge recyclebin;


create table ANONYMOUS_BOARD(
	SEQ number constraint ANONYMOUS_BOARD_PK primary key,  /* ANONYMOUS_BOARD 시퀀스 */
	NAME varchar2(30),				/* 작성자 */
	PWD varchar2(20),				/* 비밀번호 */
 	SUBJECT varchar2(100),			/* 제목 */
	CONTENT varchar2(4000),			/* 내용 */
	VIEW_COUNT number default 0,	/* 조회수 */
	LIKE_COUNT number default 0,	/* 추천수 */
	CDATE date,						/* 작성일 */
	RDATE date default SYSDATE,		/* 수정일 */
	PARENT_SEQ number				/* 부모글 */
);

create sequence ANONYMOUS_BOARD_SEQ increment by 1 start with 1 nocache;

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE) 
values(ANONYMOUS_BOARD_SEQ.nextval, '김현수', '1234', '익명임', '하이요' , SYSDATE);

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE)
values(ANONYMOUS_BOARD_SEQ.nextval, '이민재', '1234', '익명임', '하이요' , SYSDATE);

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE)
values(ANONYMOUS_BOARD_SEQ.nextval, '김민혁', '1234', '익명임', '하이요' , SYSDATE);

update ANONYMOUS_BOARD set SUBJECT='aaa', CONTENT='bbb', RDATE=SYSDATE where SEQ=1;

delete ANONYMOUS_BOARD where seq = 1;

select ANONYMOUS_BOARD.NEXTVAL from DUAL;

select  * from ANONYMOUS_BOARD order by SEQ;

select * from ANONYMOUS_BOARD where SEQ=1;