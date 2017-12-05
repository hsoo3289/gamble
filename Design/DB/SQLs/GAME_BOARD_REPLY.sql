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

insert into GAME_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE) 
values(GAME_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

insert into GAME_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(GAME_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

insert into GAME_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(GAME_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

update GAME_BOARD_REPLY set HATE_COUNT=HATE_COUNT+1 where SEQ=3;
update GAME_BOARD_REPLY set LIKE_COUNT=LIKE_COUNT+1 where SEQ=3;

select  * from GAME_BOARD_REPLY order by SEQ;

delete from GAME_BOARD_REPLY where SEQ=1;