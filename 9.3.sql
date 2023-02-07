create user x1 identified by x1
default tablespace ts2;


grant create session to x1;

grant create table to x1;

grant UNLIMITED tablespace to x1;

create table  x1.test ( n number) ;

select * from dba_tables
where owner='X1'

DROP TABLESPACE TS2 INCLUDING CONTENTS;