edit board_master_t

edit board_sub_t


SELECT
       bm.b_no, bm.b_titlte, bm.b_writer, NVL(bs.b_file,'¾øÀ½'), bm.b_hit
  FORM board_master_t bm LEFT OUTER JOIN board_sub_t bs
    ON bm.b_no = bs.b_no
ORDER BY bm.b_group desc, b_step asc

SELECT
     *
  FROM board_master_t bm, board_sub_t bs
 WHERE bm.b_no = bs.b_no(+)