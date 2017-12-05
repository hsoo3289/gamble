/* CONSULTING_BOARD */

drop table CONSULTING_BOARD;
drop sequence CONSULTING_BOARD_SEQ;
purge recyclebin;

create table CONSULTING_BOARD(
	SEQ number constraint RCONSULTING_BOARD_PK primary key,
	SUBJECT varchar2(100),
	CONTENT varchar2(4000),
	WRITER_SEQ number,
	VIEW_COUNT number default 0,
	LIKE_COUNT number default 0,
	CDATE date default SYSDATE,
	RDATE date default SYSDATE,
	PARENT_SEQ number
);

create sequence CONSULTING_BOARD_SEQ increment by 1 start with 1 nocache;

insert into CONSULTING_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(1, 1, 'asdf', 'asdfsdf');

insert into CONSULTING_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(2, 2, 'asdf', 'asdfsdf');

insert into CONSULTING_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(3, 3, 'asdf', 'asdfsdf');

insert into CONSULTING_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT, PARENT_SEQ)
values(4, 1, 'asdfasdf', 'asdfasdf', 1);

update CONSULTING_BOARD set SUBJECT='aaa', CONTENT='bbbb' where SEQ=1;

delete from CONSULTING_BOARD where SEQ=3;

select LEVEL as REPLY_LEVEL, CONSULTING.* from 
(select ROWNUM as rownumber, CONSULTING_BOARD.* from CONSULTING_BOARD) CONSULTING
start with PARENT_SEQ is null
connect by prior SEQ = PARENT_SEQ
order siblings by seq desc;

select  * from CONSULTING_BOARD order by SEQ;
