show con_name


select * from dba_PROFILES
where PROFILE='DEFAULT';

create profile C##GENERAL
limit
SESSIONS_PER_USER 4
IDLE_TIME 15
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LIFE_TIME 180
container=all


select * from DBA_PROFILES
where PROFILE= upper('C##GENERAL');

create user c##lord identified by lord container=all

grant create session, create table, unlimited tablespace to c##lord container=all;

select * from DBA_users
where USERNAME= upper('c##lord');

alter user c##lord profile C##GENERAL container=all;


select * from DBA_users
where USERNAME= upper('c##lord');

--go to vm and test SESSIONS_PER_USER ,FAILED_LOGIN_ATTEMPTS