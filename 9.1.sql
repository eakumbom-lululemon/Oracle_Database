show user

show con_name


select * from database_properties
--see GLOBAL_DB_NAME,DEFAULT_PERMANENT_TABLESPACE,DEFAULT_TEMP_TABLESPACE

create user hrms identified by hrms


SELECT DBMS_METADATA.GET_DDL('USER','HRMS') FROM dual;
--SO WE CAN SEE THAT THE USER HRMS WILL HAVE
-- DEFAULT TABLESPACE "USERS" 
-- TEMPORARY TABLESPACE "TEMP"

CREATE TABLE HRMS.EMP ( EMP_ID NUMBER, ENAME VARCHAR2(100) );
INSERT INTO   HRMS.EMP VALUES (1,'ford');
INSERT INTO   HRMS.EMP VALUES (2,'sami');
commit;


select * from dba_tables
where owner='HRMS'; --SO THE TABLE WILL BE USERS TABLESPACE



--tablespaces info
desc dba_tablespaces

select TABLESPACE_NAME,BLOCK_SIZE,STATUS,CONTENTS,LOGGING,SEGMENT_SPACE_MANAGEMENt,COMPRESS_FOR
from dba_tablespaces;

select * from v$tablespace

--data_files info
select * from dba_data_files
--BYTES Size of the file in bytes
--BLOCKS Size of the file in Oracle blocks
--MAXBYTES Maximum file size in bytes
--MAXBLOCKS Maximum file size in blocks
--INCREMENT_BY Number of tablespace blocks used as autoextension increment
--USER_BYTES The size of the file available for user data.
--USER_BLOCKS Number of blocks which can be used by the data
--https://docs.oracle.com/database/121/REFRN/GUID-0FA17297-73ED-4B5D-B511-103993C003D3.htm#REFRN23049

select * from v$datafile

--temp_files info
select * from dba_temp_files

select * from v$tempfile