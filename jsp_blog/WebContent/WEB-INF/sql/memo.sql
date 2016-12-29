CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
); z
 

CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 


INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate); 


select * from memo 


INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextva, '오늘의 메모2', '이전주 토익 시험 준비2', sysdate);


update memono set 
viewcnt = viewcnt +1
where no = 2;



update memo set 
viewcnt = 4
where memono = 3

delete from memo







select memono, title, wdate, viewcnt, r
from (
	select memono, title, wdate, viewcnt, rownum as r 
	from(
	select memono, title, wdate, viewcnt  
	from memo
	where title like '%두시회의%'
	order by memono desc
	)
)where r >=1 and r <=5







select  memono, title, content, viewcnt,  r from(  
	select memono, title, content, viewcnt, rownum from(
		select memono, title, content, viewcnt  from memo
		order by memono desc
	)
where rownum>2 and rownum<6





select count(*) from memo
where title like '%두시%'
 
