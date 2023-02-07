show con_name

--all users in root are common
select * from dba_users

--you can not create local user in the root

create user jane identified by jane;

show parameter common_user_prefix

create user c##jane identified by jane container=all; --note container=all is optional

--now let us give create session local only in the root

grant create session to c##jane ;
--test the connection using sql developer
--it will work only for the root

--now let us give create session common 

grant create session to c##jane container=all ;
--test the connection using sql developer
--it will work only for the root
