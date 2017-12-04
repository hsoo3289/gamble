/*CASH*/
drop table CASH;
drop sequence CASH_SEQ;

/*CASH*/
create table CASH(	
       HISTORY   number, /*충전내역*/
       MONEY	 number, /*소지금*/
       CHARING   number, /*충전금액*/
       CHARDATE  date default SYSDATE,   /*충전날짜*/
       MEMBER_SEQ number  /*사람번호*/
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