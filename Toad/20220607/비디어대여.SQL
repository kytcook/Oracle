SELECT * FROM HD_VIDEO_MEMBER_T;

-- 누가 언제 어떤 비디오를 대여 했는지 알고 싶다.
-- 만일 미반납 상태이면 전화를 걸어 반납 요청을 해야 한다고 한다면
-- 어떤 집합들이 필요할지 적어보시오.

-- 테이블이 5개 필요하다.
-- 회원, 대여상세, 비디오,전화번호
-- mem_cd, mem_tel,

-- 카타시안의 곱, CROSS JOIN의 경우
-- 일어날 수 있는 모든 경우의 수가 나온다 - 108건
-- 108건 안에는 실제 일어난 대여건만 들어 있는게 아닌데.... 그러면 어떻게 해야
-- 실제 일어난 대여 건만 볼 수 있을까?
SELECT 
       *
  FROM hd_video_loan_mast_t, hd_video_loan_detail_t; 
  
SELECT
       vm.loan_no as "대여번호"
     , 1 as "대여일자"
     , 'test' as "회원코드"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd;
     
SELECT
       vm.loan_no as "대여번호"
     , vm.loan_date as "대여일자"
     , vm.mem_cd as "회원코드"  
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd
 WHERE vm.loan_no = vd.loan_no;   
    
SELECT
       *
  FROM hd_video_loan_mast_t 
     , hd_video_loan_detail_t 
     , hd_video_member_t;
     
-- 540가지의 경우의 수
-- 크로스조인이 걸려서

SELECT
       vm.loan_no as "대여번호"
     , vm.loan_date as "대여일자"
     , mem.mem_name as "회원명"
  FROM hd_video_loan_mast_t vm
     , hd_video_loan_detail_t vd 
     , hd_video_member_t mem
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd;
   
SELECT
       vm.loan_no as "대여번호"
      ,vm.loan_date as "대여일자"
      ,mem.mem_name as "회원명"
      ,mem.mem_tel as "전화번호"
  FROM hd_video_loan_mast_t vm
      ,hd_video_loan_detail_t vd
      ,hd_video_member_t mem
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd
 --영화제목 출력해보시오
;
   
SELECT
       vm.loan_no as "대여번호"
      ,vm.loan_date as "대여일자"
      ,mem.mem_name as "회원명"
      ,mem.mem_tel as "전화번호"
      ,mv.movie_name as "영화제목"
  FROM hd_video_loan_mast_t vm
      ,hd_video_loan_detail_t vd
      ,hd_video_member_t mem
      ,hd_movie_t mv
 WHERE vm.loan_no = vd.loan_no
   AND vm.mem_cd = mem.mem_cd;
   
SELECT
        vm.loan_no  as "대여번호"
      ,vm.loan_date as "대여일자"
      ,mem.mem_name as "회원명"
      ,mem.mem_tel  as "전화번호"
      ,m.movie_name as "영화제목"
      ,m.manager    as "영화감독"
  FROM hd_video_loan_mast_t   vm
     , hd_video_loan_detail_t vd
     , hd_video_member_t      mem
     , hd_video_t             v
     , hd_movie_t             m
 WHERE vm.loan_no  = vd.loan_no
   AND vm.mem_cd   = mem.mem_cd
   AND vd.video_cd = v.video_cd
   AND v.movie_cd  = m.movie_cd