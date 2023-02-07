show con_name

--all roles in root are common
select * from dba_roles

--you can not create local role in the root

create role test_role ;

show parameter common_user_prefix

create role c##test_role container=all; 

grant create session to c##test_role container=all ;
grant create table to c##test_role container=all ;

create user c##dark identified by dark ;

grant c##test_role to c##dark container=all;

--now test the connection using sql developer 


create user c##kim identified by kim ;

alter session set container=orclpdb

grant c##test_role to c##kim
--now c##kim only can create session in orclpdb
