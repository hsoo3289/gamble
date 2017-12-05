/* GAME_BOARD_FILE*/

DROP TABLE GAME_BOARD_FILE;
DROP SEQUENCE GAME_BOARD_FILE_SEQ;

/* 파일 */
CREATE TABLE GAME_BOARD_FILE (
	SEQ NUMBER primary key, /* 파일번호 */
	OFNAME VARCHAR2(50), /* 파일원래 이름 */
	FNAME VARCHAR2(50), /* 파일명 */
	CDATE DATE default SYSDATE, /* upload일 */
	PARENT_SEQ NUMBER /* 부모글 번호 */
);
		
create SEQUENCE GAME_BOARD_FILE_SEQ;

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(1, 'aa', 'bb', 2);

insert into GAME_BOARD_FILE(SEQ, OFNAME, FNAME, PARENT_SEQ)
values(2, 'cc', 'dd', 1);

select * from GAME_BOARD_FILE where PARENT_SEQ=1;

select * from GAME_BOARD_FILE where SEQ=1;

delete from GAME_BOARD_FILE where seq=1;