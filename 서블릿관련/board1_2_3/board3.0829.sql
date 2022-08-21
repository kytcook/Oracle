


SELECT seq_board_no.nextval FROM dual

INSERT INTO board_master_t(b_no, b_title, b_writer, b_content, b_pw, b_group, b_pos, b_step, b_date)
VALUES(seq_board_no.nextval, '1','1','1','1',0,0,0,to_char(sysdate, 'YYYY-MD-DD'))