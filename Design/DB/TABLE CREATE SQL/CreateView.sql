create or replace view CONSULTING_BOARD_VIEW
as SELECT ROWNUM as ROWNUMBER, JOINBOARD.* from
(select * from CONSULTING_BOARD left outer join MEMBER on (WRITER_SEQ=MEMBER.SEQ)) as JOINBOARD
start with PARENT_SEQ is null
connect by prior SEQ = PARENT_SEQ
order siblings by SEQ desc;