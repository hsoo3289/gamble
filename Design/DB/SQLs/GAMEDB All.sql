/* GAME DB */

DROP TABLE GAME_RESULT;

DROP SEQUENCE GAME_RESULT_SEQ;

/* GAME RESULT */
CREATE TABLE GAME_RESULT (
	PLAYER_SEQ NUMBER, /* ȸ����ȣ */
	GAME_NO NUMBER, /* ����ȸ�� */
	PLAYER_REMAINING NUMBER, /* ȸ���ܾ� */
	BET_AMOUNT NUMBER, /* ���ñݾ� */
	THIS_AMOUNT NUMBER, /* ��ȸ�ݾ� */
	GAME_NAME VARCHAR2(255) /* �������� */
);

CREATE SEQUENCE GAME_RESULT_SEQ INCREMENT BY 1;

INSERT INTO GAME_RESULT(GAME_NO, PLAYER_SEQ,  PLAYER_REMAINING, BET_AMOUNT, THIS_AMOUNT, GAME_NAME) 
VALUES(GAME_RESULT_SEQ.NEXTVAL,1, 1000, 100, -100,'��ٸ�');

SELECT * FROM GAME_RESULT WHERE PLAYER_SEQ='1';

DELETE FROM GAME_RESULT WHERE PLAYER_SEQ='1';
