CREATE TABLE movie (
    mno number(4) constraint pk_movie_mno primary key,
    title varchar2(200) constraint nn_movie_title not null,
    producer varchar2(100) constraint nn_movie_prod not null);
