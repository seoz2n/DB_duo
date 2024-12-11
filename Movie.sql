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
-----------------------------------------------------------------------------------------------------           
  
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
-----------------------------------------------------------------------------------------------------           
    
CREATE TABLE gassign(
    gano number(10) constraint gassign_gano primary key,
    gno number(10)
    );
    
    -- 추가
    ALTER TABLE gassign
    ADD constraint FK_gassign_gno FOREIGN key (gno) REFERENCES genre(gno);
-----------------------------------------------------------------------------------------------------           

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
-----------------------------------------------------------------------------------------------------           
 CREATE TABLE actassign(
    asno number(4) constraint pk_actassign_asno primary key,
    ano number(4) constraint fk_actassign_ano not null, foreign key(ano) references actor(ano),
    apay number(10) constraint actassign_apay not null,
    aroll varchar(100) constraint actassign_aroll not null);
    
-- 변경    
ALTER TABLE actassign
MODIFY ( asno number(10),
         ano number(10),
         aroll varchar2(20));
         
ALTER TABLE actassign
--ADD mno number(10) not null;
ADD constraint FK_actassign_mno FOREIGN key (mno) REFERENCES movie(mno);
-----------------------------------------------------------------------------------------------------           

CREATE TABLE staff(
    sno number(4) constraint staff_sno primary key,
    sname varchar(200) constraint staff_sname not null,
    srank varchar(20) constraint staff_srank not null,
    spos varchar(20) constraint staff_spos not null,
    scont number(20) constraint staff_scont not null
    );

    -- 삭제
    ALTER TABLE staff
    DROP COLUMN spos;
    
    -- 추가
    ALTER TABLE staff
    ADD sroll varchar2(20);
    
    -- 변경
    ALTER TABLE staff
    MODIFY( sroll constraint staff_sroll not null,
            sname varchar2(200),
            srank varchar2(20),
            scont varchar2(20),
            sroll varchar2(20));

-----------------------------------------------------------------------------------------------------           
     
CREATE TABLE sassign(
    sano number(10) constraint sassign primary key,
    mno number(10) constraint fk_sassign_mno not null, foreign key(mno) references movie(mno),
    sno number(10) constraint fk_sassign_sno not null, foreign key(sno) references staff(sno),
    spay number(10) constraint spay not null);
