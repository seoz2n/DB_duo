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
    
CREATE TABLE genre(
    gno number(4) constraint genre_gno primary key,
    gtype varchar(50) constraint genre_Gtype not null
    );

    -- 삭제
    ALTER TABLE genre
    DROP COLUMN gtype
    ;
    -- 추가
    ALTER TABLE genre
    ADD (gname varchar2(100) constraint genre_Gname not null);
    
    -- 변경
    ALTER TABLE genre
    MODIFY(gno number(10)
    );

    
CREATE TABLE gassign(
    gano number(10) constraint gassign_gano primary key,
    gno number(10)
    );
    
    -- 추가
    ALTER TABLE gassign
    ADD constraint FK_gassign_gno FOREIGN key (gno) REFERENCES genre(gno);
    
CREATE TABLE actor(
    ano number(4) constraint actor_ano PRIMARY key, 
    aname varchar(200) constraint actor_aname not null,
    agency varchar(200),
    acont number(20) constraint actor_acont not null
    );
    
    -- 변경
    ALTER TABLE actor
    MODIFY (ano number(10),
           aname varchar2(200),
           agency varchar2(200));