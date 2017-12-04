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

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE) 
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '하이요' , SYSDATE);

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '하이요' , SYSDATE);

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '하이요' , SYSDATE);

update CONSULTING_BOARD_REPLY set HATE_COUNT=HATE_COUNT+1 where SEQ=3;
update CONSULTING_BOARD_REPLY set LIKE_COUNT=LIKE_COUNT+1 where SEQ=3;

select  * from CONSULTING_BOARD_REPLY order by SEQ;

delete from CONSULTING_BOARD_REPLY where SEQ=1;