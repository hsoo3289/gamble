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
	RDATE date default SYSDATE,
	PARENT_SEQ number
);

create sequence GAME_BOARD_SEQ increment by 1 start with 1 nocache;

insert into GAME_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(1, 1, 'asdf', 'asdfsdf');

insert into GAME_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(2, 2, 'asdf', 'asdfsdf');

insert into GAME_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT)
values(3, 3, 'asdf', 'asdfsdf');

insert into GAME_BOARD(SEQ, WRITER_SEQ, SUBJECT, CONTENT, PARENT_SEQ)
values(4, 1, 'asdfasdf', 'asdfasdf', 1);

update GAME_BOARD set SUBJECT='aaa', CONTENT='bbbb' where SEQ=1;

delete from GAME_BOARD where SEQ=3;

select LEVEL as REPLY_LEVEL, CONSULTING.* from 
(select ROWNUM as rownumber, GAME_BOARD.* from GAME_BOARD) CONSULTING
start with PARENT_SEQ is null
connect by prior SEQ = PARENT_SEQ
order siblings by seq desc;

select  * from GAME_BOARD order by SEQ;
