CREATE OR REPLACE PROCEDURE SCOTT.proc_boardlist(cb_search In varchar, tb_search IN varchar,rc_board OUT sys_refcursor)
IS
BEGiN
    OPEN rc_board
     FOR 
        SELECT bm.b_no, bm.b_title, bm.b_writer, bs.b_file, bm.b_hit 
              ,bm.b_content, bm.b_date, bm.b_group, bm.b_pos, bm.b_step
              ,bm.b_pw, bs.b_file, NVL(bs.bs_size,0) bs_size
          FROM board_master_t bm LEFT OUTER JOIN board_sub_t bs
            ON bm.b_no = bs.b_no
         WHERE 1=1
           AND bm.b_title LIKE '%'||tb_search||'%'
      ORDER BY bm.b_group desc, b_step asc;
END;
/