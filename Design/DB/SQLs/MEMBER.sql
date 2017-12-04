/*MEMBER*/
drop table MEMBER;
drop sequence MEMBER_SEQ;

/*MEMBER*/
create table MEMBER(
	SEQ 	number constraint MEMBER_PK primary key, /*ȸ����ȣ*/
	NAME	varchar2(15),			     /*�̸�*/
	ID		varchar2(15),			     /*���̵�*/
	PWD		varchar2(15),			     /*��й�ȣ*/
	EMAIL	varchar2(30),			     /*�̸���*/
	PHONE   varchar2(30),			     /*�ڵ�����ȣ*/
	ACCNUM  varchar2(40),			     /*���¹�ȣ*/
	MONEY	NUMBER default 50000,				     /*�ܾ�*/
	JOINDATE date default SYSDATE,		     /*ȸ�����Գ�¥*/
	AUTHOR_LEVEL NUMBER
	);

create sequence MEMBER_SEQ increment by 1 start with 1 nocache;

/*MEMBER*/
insert into MEMBER(SEQ, NAME, ID, PWD, EMAIL, PHONE, ACCNUM, AUTHOR_LEVEL) 
values(MEMBER_SEQ.nextval, '������', 'khs', '1234', 'khs@naver.com', '010123456789', '1234567890123', 0);
insert into MEMBER(SEQ, NAME, ID, PWD, EMAIL, PHONE, ACCNUM, AUTHOR_LEVEL) 
values(MEMBER_SEQ.nextval, '�̹���', 'emj', '1234', 'emj@daum.net', '010213456789', '1234567890123', 0);
insert into MEMBER(SEQ, NAME, ID, PWD, EMAIL, PHONE, ACCNUM, AUTHOR_LEVEL)
values(MEMBER_SEQ.nextval, '�����', 'kmh', '1234', 'kmh@megapass.co.kr', '010312456789', '1234567890123', 0);

update MEMBER set PWD='aaaaa', EMAIL='bbb@asdf.com', PHONE='123434', ACCNUM='20000' where seq = 1;

update MEMBER set MONEY=20000 where seq=2;

delete from MEMBER where seq=1;

select * from MEMBER order by SEQ desc;
select * from MEMBER where SEQ=1;
