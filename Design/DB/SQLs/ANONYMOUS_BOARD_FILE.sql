DROP TABLE ANONYMOUS_BOARD_FILE;
DROP SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

/* ���� */
CREATE TABLE ANONYMOUS_BOARD_FILE (
	SEQ NUMBER primary key, /* ���Ϲ�ȣ */
	OFNAME VARCHAR2(255), /* ���Ͽ��� �̸� */
	FNAME VARCHAR2(255), /* ���ϸ� */
	CDATE DATE default SYSDATE, /* upload�� */
	PARENT_SEQ NUMBER /* �θ�� ��ȣ */
);

		
create SEQUENCE ANONYMOUS_BOARD_FILE_SEQ;

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(1, 'aa', 'bb', 2);

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(2, 'cc', 'dd', 1);

select * from GAME_BOARD_FILE where PARENT_SEQ=1;

select * from GAME_BOARD_FILE where SEQ=1;

delete from GAME_BOARD_FILE where seq=1;