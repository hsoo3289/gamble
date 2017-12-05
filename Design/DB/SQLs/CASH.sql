/*CASH*/
drop table CASH;
drop sequence CASH_SEQ;

/*CASH*/
create table CASH(	
       HISTORY   number, /*��������*/
       MONEY	 number, /*������*/
       CHARING   number, /*�����ݾ�*/
       CHARDATE  date default SYSDATE,   /*������¥*/
       MEMBER_SEQ number  /*�����ȣ*/
);

create sequence CASH_SEQ INCREMENT BY 1;

insert into CASH(HISTORY,MONEY,CHARING,MEMBER_SEQ) 
values(CASH_SEQ.NEXTVAL, 100, 200, 1);

insert into CASH(HISTORY,MONEY,CHARING,MEMBER_SEQ) 
values(CASH_SEQ.NEXTVAL, 100, 200, 1);

insert into CASH(HISTORY,MONEY,CHARING,MEMBER_SEQ) 
values(CASH_SEQ.NEXTVAL, 100, 200, 2);

insert into CASH(HISTORY,MONEY,CHARING,MEMBER_SEQ) 
values(CASH_SEQ.NEXTVAL, 100, 200, 3);

select * from CASH where MEMBER_SEQ = 1 order by HISTORY desc;