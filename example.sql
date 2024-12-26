-- 영화 정보

INSERT INTO movie (mno, title, pdate, producer) VALUES (1, '기생충', TO_DATE('2019-05-30', 'YYYY-MM-DD'), '봉준호');
INSERT INTO movie (mno, title, pdate, producer) VALUES (2, '올드보이', TO_DATE('2003-11-21', 'YYYY-MM-DD'), '박찬욱');
INSERT INTO movie (mno, title, pdate, producer) VALUES (3, '암살', TO_DATE('2015-07-22', 'YYYY-MM-DD'), '최동훈');
INSERT INTO movie (mno, title, pdate, producer) VALUES (4, '명량', TO_DATE('2014-07-30', 'YYYY-MM-DD'), '김한민');
INSERT INTO movie (mno, title, pdate, producer) VALUES (5, '극한직업', TO_DATE('2019-01-23', 'YYYY-MM-DD'), '이병헌');
INSERT INTO movie (mno, title, pdate, producer) VALUES (6, '택시운전사', TO_DATE('2017-08-02', 'YYYY-MM-DD'), '장훈');
INSERT INTO movie (mno, title, pdate, producer) VALUES (7, '국제시장', TO_DATE('2014-12-17', 'YYYY-MM-DD'), '윤제균');
INSERT INTO movie (mno, title, pdate, producer) VALUES (8, '왕의 남자', TO_DATE('2005-12-29', 'YYYY-MM-DD'), '이준익');
INSERT INTO movie (mno, title, pdate, producer) VALUES (9, '도둑들', TO_DATE('2012-07-25', 'YYYY-MM-DD'), '최동훈');
INSERT INTO movie (mno, title, pdate, producer) VALUES (10, '신과 함께-죄와 벌', TO_DATE('2017-12-20', 'YYYY-MM-DD'), '김용화');

select * from movie;

-- 배우 정보(번호, 이름, 소속사, 연락처)
INSERT INTO actor (ano, aname, agency, acont) VALUES (1, '송강호', '호랑이엔터테인먼트', '01012345678');
INSERT INTO actor (ano, aname, agency, acont) VALUES (2, '이병헌', 'BH엔터테인먼트', '01023456789');
INSERT INTO actor (ano, aname, agency, acont) VALUES (3, '전도연', '매니지먼트 숲', '01034567890');
INSERT INTO actor (ano, aname, agency, acont) VALUES (4, '하정우', '워크하우스컴퍼니', '01045678901');
INSERT INTO actor (ano, aname, agency, acont) VALUES (5, '김혜수', '호두앤유엔터테인먼트', '01056789012');
INSERT INTO actor (ano, aname, agency, acont) VALUES (6, '마동석', '빅펀치엔터테인먼트', '01067890123');
INSERT INTO actor (ano, aname, agency, acont) VALUES (7, '배두나', '샛별당엔터테인먼트', '01078901234');
INSERT INTO actor (ano, aname, agency, acont) VALUES (8, '유아인', 'UAA', '01089012345');
INSERT INTO actor (ano, aname, agency, acont) VALUES (9, '한지민', 'BH엔터테인먼트', '01090123456');
INSERT INTO actor (ano, aname, agency, acont) VALUES (10, '이정재', '아티스트컴퍼니', '01091234567');

select * from actor;

-- ACTASSIGN(영화-배우 관계 : 관계 번호, 배우 번호, 영화 번호, 출연료, 배우 역할{주/조연})
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (1, 1, 1, 50000000, '주연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (2, 2, 1, 30000000, '조연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (3, 3, 2, 40000000, '주연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (4, 4, 3, 45000000, '주연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (5, 5, 3, 25000000, '조연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (6, 6, 4, 35000000, '조연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (7, 7, 5, 60000000, '주연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (8, 8, 6, 32000000, '조연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (9, 9, 7, 30000000, '조연');
INSERT INTO ACTASSIGN (asno, ano, mno, apay, aroll) VALUES (10, 10, 8, 70000000, '주연');



-- 예시 찾기 SQL문(기생충 영화에 출연한 배우)
SELECT a.aname AS 배우이름
FROM movie m
JOIN actassign aa ON m.mno = aa.mno
JOIN actor a ON aa.ano = a.ano
WHERE m.title = '기생충' AND aa.aroll = '주연';

-- 예시 찾기 SQL문(기생충 영화에 출연한 배우와 출연료)
SELECT a.aname AS 배우이름, aa.apay AS 출연료
FROM movie m
JOIN actassign aa ON m.mno = aa.mno
JOIN actor a ON aa.ano = a.ano
WHERE m.title = '기생충' AND aa.aroll = '주연';


-- GENRE 테이블 데이터 삽입 예시
INSERT INTO genre (gno, gname) VALUES (1, '드라마');
INSERT INTO genre (gno, gname) VALUES (2, '액션');
INSERT INTO genre (gno, gname) VALUES (3, '스릴러');
INSERT INTO genre (gno, gname) VALUES (4, '로맨스');
INSERT INTO genre (gno, gname) VALUES (5, '코미디');
INSERT INTO genre (gno, gname) VALUES (6, '공상과학');
INSERT INTO genre (gno, gname) VALUES (7, '판타지');
INSERT INTO genre (gno, gname) VALUES (8, '모험');
INSERT INTO genre (gno, gname) VALUES (9, '범죄');
INSERT INTO genre (gno, gname) VALUES (10, '다큐멘터리');

SELECT * FROM genre;


-- gassign 테이블에 mno 컬럼 추가
ALTER TABLE gassign
ADD mno NUMBER(10);

-- mno 컬럼을 movie 테이블의 mno와 연결
ALTER TABLE gassign
ADD CONSTRAINT fk_gassign_mno FOREIGN KEY (mno) REFERENCES movie(mno);



-- gassign 테이블 데이터 삽입 예시
INSERT INTO gassign (gano, gno, mno) VALUES (1, 1, 1); -- 기생충: 드라마
INSERT INTO gassign (gano, gno, mno) VALUES (2, 2, 2); -- 올드보이: 액션
INSERT INTO gassign (gano, gno, mno) VALUES (3, 3, 3); -- 암살: 스릴러
INSERT INTO gassign (gano, gno, mno) VALUES (4, 4, 4); -- 명량: 로맨스
INSERT INTO gassign (gano, gno, mno) VALUES (5, 5, 5); -- 극한직업: 코미디
INSERT INTO gassign (gano, gno, mno) VALUES (6, 6, 6); -- 택시운전사: 공상과학
INSERT INTO gassign (gano, gno, mno) VALUES (7, 7, 7); -- 국제시장: 판타지
INSERT INTO gassign (gano, gno, mno) VALUES (8, 8, 8); -- 왕의 남자: 모험
INSERT INTO gassign (gano, gno, mno) VALUES (9, 9, 9); -- 도둑들: 범죄
INSERT INTO gassign (gano, gno, mno) VALUES (10, 10, 10); -- 신과 함께: 다큐멘터리

-- 스태프 데이터 삽입 얘시

-- staff 테이블 데이터 삽입 예시
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (1, '홍길동', '감독', '01012345678', '연출');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (2, '김철수', '작가', '01023456789', '대본 작성');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (3, '이영희', '촬영 감독', '01034567890', '촬영');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (4, '박민수', '음악 감독', '01045678901', '음악 제작');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (5, '최수정', '조명 감독', '01056789012', '조명');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (6, '장영호', '편집 감독', '01067890123', '영상 편집');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (7, '윤미라', '의상 디자이너', '01078901234', '의상 제작');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (8, '정해성', '미술 감독', '01089012345', '세트 디자인');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (9, '강은희', '프로듀서', '01090123456', '제작 관리');
INSERT INTO staff (sno, sname, srank, scont, sroll) VALUES (10, '이도훈', '촬영 보조', '01091234567', '촬영 지원');

SELECT * FROM staff;


-- sassign 테이블 데이터 삽입 예시
INSERT INTO sassign (sano, mno, sno, spay) VALUES (1, 1, 1, 100000000); -- 기생충, 홍길동(감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (2, 1, 2, 50000000);  -- 기생충, 김철수(작가)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (3, 1, 3, 70000000);  -- 기생충, 이영희(촬영 감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (4, 2, 4, 60000000);  -- 올드보이, 박민수(음악 감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (5, 3, 5, 40000000);  -- 암살, 최수정(조명 감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (6, 4, 6, 45000000);  -- 명량, 장영호(편집 감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (7, 5, 7, 30000000);  -- 극한직업, 윤미라(의상 디자이너)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (8, 6, 8, 35000000);  -- 택시운전사, 정해성(미술 감독)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (9, 7, 9, 80000000);  -- 국제시장, 강은희(프로듀서)
INSERT INTO sassign (sano, mno, sno, spay) VALUES (10, 8, 10, 20000000); -- 왕의 남자, 이도훈(촬영 보조)

SELECT * FROM SASSIGN;

-- 협찬사

-- sponsor 테이블 데이터 삽입 예시
INSERT INTO sponsor (spno, company, spcont) VALUES (1, 'CJ 엔터테인먼트', '01012345678');
INSERT INTO sponsor (spno, company, spcont) VALUES (2, '롯데 컬처웍스', '01023456789');
INSERT INTO sponsor (spno, company, spcont) VALUES (3, 'NEW (Next Entertainment World)', '01034567890');
INSERT INTO sponsor (spno, company, spcont) VALUES (4, '쇼박스', '01045678901');
INSERT INTO sponsor (spno, company, spcont) VALUES (5, '메가박스중앙플러스엠', '01056789012');
INSERT INTO sponsor (spno, company, spcont) VALUES (6, '판씨네마', '01067890123');
INSERT INTO sponsor (spno, company, spcont) VALUES (7, '워너브라더스 코리아', '01078901234');
INSERT INTO sponsor (spno, company, spcont) VALUES (8, '20세기 스튜디오', '01089012345');
INSERT INTO sponsor (spno, company, spcont) VALUES (9, '디즈니 코리아', '01090123456');
INSERT INTO sponsor (spno, company, spcont) VALUES (10, '넷플릭스 코리아', '01091234567');

SELECT * FROM sponsor;

-- 협찬 - 영화 관계
-- spassign 테이블 데이터 삽입 예시
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (1, '카메라', TO_DATE('2019-05-01', 'YYYY-MM-DD'), 1, 1, TO_DATE('2019-05-30', 'YYYY-MM-DD')); -- 기생충 - CJ 엔터테인먼트
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (2, '의상', TO_DATE('2019-04-15', 'YYYY-MM-DD'), 1, 7, TO_DATE('2019-05-25', 'YYYY-MM-DD')); -- 기생충 - 워너브라더스 코리아
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (3, '프로모션', TO_DATE('2003-10-01', 'YYYY-MM-DD'), 2, 2, TO_DATE('2003-12-01', 'YYYY-MM-DD')); -- 올드보이 - 롯데 컬처웍스
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (4, '소품', TO_DATE('2015-06-01', 'YYYY-MM-DD'), 3, 3, TO_DATE('2015-07-20', 'YYYY-MM-DD')); -- 암살 - NEW
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (5, '조명 장비', TO_DATE('2014-06-01', 'YYYY-MM-DD'), 4, 4, TO_DATE('2014-07-10', 'YYYY-MM-DD')); -- 명량 - 쇼박스
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (6, '촬영 장비', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 5, 5, TO_DATE('2019-02-15', 'YYYY-MM-DD')); -- 극한직업 - 메가박스중앙플러스엠
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (7, 'VFX 소프트웨어', TO_DATE('2017-07-01', 'YYYY-MM-DD'), 6, 6, TO_DATE('2017-08-01', 'YYYY-MM-DD')); -- 택시운전사 - 판씨네마
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (8, '광고', TO_DATE('2014-10-01', 'YYYY-MM-DD'), 7, 8, TO_DATE('2014-11-01', 'YYYY-MM-DD')); -- 국제시장 - 20세기 스튜디오
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (9, '음향 장비', TO_DATE('2005-11-01', 'YYYY-MM-DD'), 8, 9, TO_DATE('2005-12-15', 'YYYY-MM-DD')); -- 왕의 남자 - 디즈니 코리아
INSERT INTO spassign (spano, product, rdate, mno, spno, rtdate) 
VALUES (10, '영상 편집 소프트웨어', TO_DATE('2017-11-01', 'YYYY-MM-DD'), 10, 10, TO_DATE('2017-12-01', 'YYYY-MM-DD')); -- 신과 함께 - 넷플릭스 코리아


SELECT * FROM spassign;



r
