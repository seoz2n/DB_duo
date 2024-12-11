CREATE TABLE movie(
    mno number(4) constraint movie_mno primary key,
    title varchar(200) constraint movie_title not null,
    pdate date constraint movie_pdate not null
    );
    
    -- 추가
    
    ALTER TABLE movie 
    ADD (producer varchar2(20) constraint movie_producer not null);
    
    -- 변경
    ALTER TABLE movie
    MODIFY(
    mno number(10),
    title varchar2(100)
    );