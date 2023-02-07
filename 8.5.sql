show con_name

show user

select * from session_privs; --and see the count

show con_id;

select * from V$TABLESPACE
where con_id=1

create user c##copysis identified by copysis
default tablespace users temporary tablespace temp account unlock;

grant create session, dba,sysdba to c##copysis container=all; 

select * from dba_users
where username=upper('c##copysis');

/*
go to vm
login by the new user
1- try to login first as sysdba ( show the user, show the container, session_privs)
2- try to login without sysdba ( show the user, show the container, session_privs)
*/

SELECT * FROM SESSION_PRIVS;

select * from role_sys_privs
where role='DBA'

SELECT * FROM SESSION_PRIVS
WHERE PRIVILEGE NOT IN (select PRIVILEGE from role_sys_privs where role='DBA' )
