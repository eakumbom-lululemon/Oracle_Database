/*
create new pluggable PDB10 from the seed using DBCA
make sure to make the admin user PDB10_ADMIN in the DBCA
*/

show con_name

show user

SELECT * FROM CDB_USERS
WHERE USERNAME='PDB10_ADMIN'

--NO SYS PRIVS dirict to PDB10_ADMIN
select * from CDB_SYS_PRIVS
where GRANTEE='PDB10_ADMIN'

select * from CDB_role_PRIVS
where GRANTEE='PDB10_ADMIN'; -- so he has role called PDB_DBA

ALTER SESSION SET CONTAINER=PDB10;

SHOW CON_NAME

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='PDB_DBA' ;--This contains sys priv granted to role  ( direct or using another role )

select * from DBA_role_PRIVS
where GRANTEE='PDB_DBA'; 

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='CONNECT'

--connect using PDB10_ADMIN
--select * from session_privs;