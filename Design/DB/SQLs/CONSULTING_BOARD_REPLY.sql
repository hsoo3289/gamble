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

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE) 
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

insert into CONSULTING_BOARD_REPLY(SEQ, WRITER_SEQ, REPLY_CONTENT, CDATE)
values(CONSULTING_BOARD_REPLY_SEQ.nextval, 1, '���̿�' , SYSDATE);

update CONSULTING_BOARD_REPLY set HATE_COUNT=HATE_COUNT+1 where SEQ=3;
update CONSULTING_BOARD_REPLY set LIKE_COUNT=LIKE_COUNT+1 where SEQ=3;

select  * from CONSULTING_BOARD_REPLY order by SEQ;

delete from CONSULTING_BOARD_REPLY where SEQ=1;