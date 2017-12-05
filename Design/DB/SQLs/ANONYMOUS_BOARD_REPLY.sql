/* ANONYMOUS_BOARD_REPLY  */
drop table ANONYMOUS_BOARD_REPLY;
drop sequence ANONYMOUS_BOARD_REPLY_SEQ;
purge recyclebin;


create table ANONYMOUS_BOARD_REPLY(
	SEQ number constraint ANONYMOUS_BOARD_REPLY_PK primary key,  /* ANONYMOUS_BOARD_REPLY ������ */
	NAME varchar2(30),				/* �ۼ��� */
	PWD varchar2(20),				/* ��й�ȣ */
	REPLY_CONTENT varchar2(255),	/* ���� */
	HATE_COUNT number default 0,	/* ��ȸ�� */
	LIKE_COUNT number default 0,	/* ��õ�� */
	PARENT_SEQ number,				/* �θ�� */
	CDATE date						/* �ۼ��� */ 
);

create sequence ANONYMOUS_BOARD_REPLY_SEQ increment by 1 start with 1 nocache;

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE) 
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '������', '1234', '���̿�' , SYSDATE);

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE)
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '�̹���', '1234', '���̿�' , SYSDATE);

insert into ANONYMOUS_BOARD_REPLY(SEQ, NAME, PWD, REPLY_CONTENT, CDATE)
values(ANONYMOUS_BOARD_REPLY_SEQ.nextval, '�����', '1234', '���̿�' , SYSDATE);

update ANONYMOUS_BOARD_REPLY set HATE_COUNT=HATE_COUNT+1 where SEQ=3;
update ANONYMOUS_BOARD_REPLY set LIKE_COUNT=LIKE_COUNT+1 where SEQ=3;

select  * from ANONYMOUS_BOARD_REPLY order by SEQ;

delete from ANONYMOUS_BOARD_REPLY where SEQ=1;