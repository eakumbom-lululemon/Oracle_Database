show con_name

alter session set container=orclpdb

show con_name

select * from dba_PROFILES
where PROFILE='DEFAULT';

create profile orclpdbprofile
limit
SESSIONS_PER_USER UNLIMITED
IDLE_TIME UNLIMITED
FAILED_LOGIN_ATTEMPTS 10
PASSWORD_LIFE_TIME 180
INACTIVE_ACCOUNT_TIME 10

--go to vm and do this: ! oerr ora 2377

create profile orclpdbprofile
limit
SESSIONS_PER_USER UNLIMITED
IDLE_TIME UNLIMITED
FAILED_LOGIN_ATTEMPTS 10
PASSWORD_LIFE_TIME 180
INACTIVE_ACCOUNT_TIME 15



select * from DBA_PROFILES
where PROFILE= upper('orclpdbprofile');

create user sara identified by sara profile orclpdbprofile;


grant create session, create table, unlimited tablespace to sara

select * from DBA_users
where USERNAME= upper('sara');
