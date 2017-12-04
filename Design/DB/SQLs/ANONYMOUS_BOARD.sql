/* ANONYMOUS_BOARD  */
drop table ANONYMOUS_BOARD;
drop sequence ANONYMOUS_BOARD_SEQ;
purge recyclebin;


create table ANONYMOUS_BOARD(
	SEQ number constraint ANONYMOUS_BOARD_PK primary key,  /* ANONYMOUS_BOARD ������ */
	NAME varchar2(30),				/* �ۼ��� */
	PWD varchar2(20),				/* ��й�ȣ */
 	SUBJECT varchar2(100),			/* ���� */
	CONTENT varchar2(4000),			/* ���� */
	VIEW_COUNT number default 0,	/* ��ȸ�� */
	LIKE_COUNT number default 0,	/* ��õ�� */
	CDATE date,						/* �ۼ��� */
	RDATE date default SYSDATE,		/* ������ */
	PARENT_SEQ number				/* �θ�� */
);

create sequence ANONYMOUS_BOARD_SEQ increment by 1 start with 1 nocache;

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE) 
values(ANONYMOUS_BOARD_SEQ.nextval, '������', '1234', '�͸���', '���̿�' , SYSDATE);

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE)
values(ANONYMOUS_BOARD_SEQ.nextval, '�̹���', '1234', '�͸���', '���̿�' , SYSDATE);

insert into ANONYMOUS_BOARD(SEQ, NAME, PWD, SUBJECT, CONTENT, CDATE)
values(ANONYMOUS_BOARD_SEQ.nextval, '�����', '1234', '�͸���', '���̿�' , SYSDATE);

update ANONYMOUS_BOARD set SUBJECT='aaa', CONTENT='bbb', RDATE=SYSDATE where SEQ=1;

delete ANONYMOUS_BOARD where seq = 1;

select ANONYMOUS_BOARD.NEXTVAL from DUAL;

select  * from ANONYMOUS_BOARD order by SEQ;

select * from ANONYMOUS_BOARD where SEQ=1;