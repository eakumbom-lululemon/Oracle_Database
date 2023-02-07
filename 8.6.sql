show con_name

show user

alter session set container=orclpdb;

show con_name;
show con_id;

select * from V$TABLESPACE


create user orclpdb_admin identified by orclpdb_admin
default tablespace users temporary tablespace temp account unlock;

grant create session, dba to orclpdb_admin

select * from dba_users
where username=upper('orclpdb_admin');

/*
go to vm
login by the new user
show the user, show the container, session_privs, try to login in the root)

*/


