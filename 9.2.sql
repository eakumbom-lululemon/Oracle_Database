SHOW USER

SHOW CON_NAME

create tablespace t1


/*
Oracle Managed Files
When creating a tablespace, either a permanent tablespace or an undo tablespace,
the DATAFILE clause is optional. 
When you include the DATAFILE clause, the file name is optional. 
If the DATAFILE clause or file name is not provided, then the following rules
apply:
• If the DB_CREATE_FILE_DEST initialization parameter is specified, then an Oracle
managed data file is created in the location specified by the parameter.
• If the DB_CREATE_FILE_DEST initialization parameter is not specified, then the
statement creating the data file fails
*/

show parameter DB_CREATE_FILE_DEST

alter system set DB_CREATE_FILE_DEST='/u01/app/oracle/oradata/ORCL/pdbts'; 

show parameter DB_CREATE_FILE_DEST

create tablespace t1

SELECT DBMS_METADATA.GET_DDL('TABLESPACE','T1') FROM dual;

select TABLESPACE_NAME,BLOCK_SIZE,STATUS,CONTENTS,LOGGING,SEGMENT_SPACE_MANAGEMENt,COMPRESS_FOR
from dba_tablespaces;

select * from v$tablespace

select * from dba_data_files

create user hrms2 identified by hrms2 
default tablespace t1;

SELECT DBMS_METADATA.GET_DDL('USER','HRMS2') FROM dual;

CREATE TABLE HRMS2.TEST123 ( N NUMBER );

select * from dba_tables
where owner='HRMS2'; --