show con_name
show user

alter session set container=orclpdb

show con_name

create role master_role;

grant create session to master_role;

grant create table to master_role;

SELECT * FROM ROLE_SYS_PRIVS
where role= upper('master_role');

create role sub_master_role;
grant create view to sub_master_role;

grant sub_master_role to master_role

SELECT * FROM ROLE_SYS_PRIVS
where role= upper('master_role');

select * from DBA_role_PRIVS
where GRANTEE=upper('master_role');


SELECT * FROM ROLE_SYS_PRIVS
where role= upper('SUB_MASTER_ROLE');

create user kh111 identified by kh111;

grant master_role to kh111;

--now go to vm
--connect the new user
--do this: select * from session_privs;

