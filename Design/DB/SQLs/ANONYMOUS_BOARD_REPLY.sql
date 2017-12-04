/* ANONYMOUS_BOARD_REPLY  */
drop table ANONYMOUS_BOARD_REPLY;
drop sequence ANONYMOUS_BOARD_REPLY_SEQ;
purge recyclebin;


create table ANONYMOUS_BOARD_REPLY(
	SEQ number constraint ANONYMOUS_BOARD_REPLY_PK primary key,  /* ANONYMOUS_BOARD_REPLY 시퀀스 */
	NAME varchar2(30),				/* 작성자 */
	PWD varchar2(20),				/* 비밀번호 */
	REPLY_CONTENT varchar2(255),	/* 내용 */
	HATE_COUNT number default 0,	/* 조회수 */
	LIKE_COUNT number default 0,	/* 추천수 */
	PARENT_SEQ number,				/* 부모글 */
	CDATE date						/* 작성일 */ 
);

create sequence ANONYMOUS_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE) 
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '김현수', '1234', '하이요' , SYSDATE);

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE)
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '이민재', '1234', '하이요' , SYSDATE);

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE)
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '김민혁', '1234', '하이요' , SYSDATE);

update ANONYMOUS_BOARD_REPLY set HATE_COUNT=HATE_COUNT+1 where SEQ=3;
update ANONYMOUS_BOARD_REPLY set LIKE_COUNT=LIKE_COUNT+1 where SEQ=3;

select  * from ANONYMOUS_BOARD_REPLY order by SEQ;

delete from ANONYMOUS_BOARD_REPLY where SEQ=1;