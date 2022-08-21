SELECT bm.b_no, bm.b_title, bm.b_writer, bs.bs_file, bm.b_hit
       , bm.b_content, bm.b_date
  FORM board_master_t bm LEFT OUTER JOIN board_sub_t bs
    ON bm.b_no = bs.b_no
ORDER BY bm.b_group desc, b_step asc

------------------------------------------------------------------------------------

INSERT INTO board_master_T (b_no, b_title, b_writer, b_content, b_pw, b_group,
b_pos, b_step, b_date)
VALUES(seq_board_no.nextval, '1', '1', '1', '1', 0, 0, 0, to_char(sysdate, 'YYYY-MM-DD'))


ALTER TABLE SCOTT.BOARD_MASTER_T
MODIFY(B_HIT DEFAULT 0);

------------------------------------------------------------------


SELECT seq_board_no.nextval FROM dual;

----------------------------------------------------------------

INSERT INTO board_master_t(b_no, b_title, b_writer, b_content, b_pw, b_group, b_pos, b_step, b_date)
VALUES(seq_board_no.nextval, '1','1','1','1',0,0,0,to_char(sysdate, 'YYYY-MD-DD'));

------------------------------------------------------------------

DROP INDEX SCOTT.XPKBOARD_MASTER_T ;


--------------------------------------------------------------------
CREATE UNIQUE INDEX SCOTT.BOARD_SUB_T ON SCOTT.BOARD_MASTER_T
(B_NO)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;
----------------------------------------------------------------------
DDL문
-- 인덱스를 만드는 명령어
create index 인덱스이름 on 테이블명(컬럼명)


create index i_bgroup on board_master_t(b_group)

------------------------------------------------

인덱스를 이용한 채번하는 쿼리
Ctrl+E 로 확인해보기

SELECT /*+index_desc(board_master_t i_bgroup)*/b_group
  FROM board_master_t
 WHERE b_group > 0
 
SELECT NVL((SELECT /*+index_desc(board_master_t i_bgroup)*/b_group
              FROM board_master_t
             WHERE rownum = 1
               AND b_group > 0),0) +1 b_group
  FROM dual
  
  
--------------------------------------------------------------

DELETE FROM board_master_t

DELETE FROM board_sub_t

----------------------------------------------------------------