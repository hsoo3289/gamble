/* GAME_BOARD_FILE*/

DROP TABLE GAME_BOARD_FILE;
DROP SEQUENCE GAME_BOARD_FILE_SEQ;

/* ���� */
CREATE TABLE GAME_BOARD_FILE (
	SEQ NUMBER primary key, /* ���Ϲ�ȣ */
	OFNAME VARCHAR2(50), /* ���Ͽ��� �̸� */
	FNAME VARCHAR2(50), /* ���ϸ� */
	CDATE DATE default SYSDATE, /* upload�� */
	PARENT_SEQ NUMBER /* �θ�� ��ȣ */
);
		
create SEQUENCE GAME_BOARD_FILE_SEQ;

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(1, 'aa', 'bb', 2);

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(2, 'cc', 'dd', 1);

select * from GAME_BOARD_FILE where PARENT_SEQ=1;

select * from GAME_BOARD_FILE where SEQ=1;

delete from GAME_BOARD_FILE where seq=1;