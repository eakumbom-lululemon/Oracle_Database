--Moving and Renaming Online Data Files
show user
show con_name

create tablespace t4
DATAFILE '/u01/app/oracle/oradata/ORCL/pdbts/t4_01.dbf' size 5m;


SELECT DBMS_METADATA.GET_DDL('TABLESPACE','T4') FROM dual;

--NOW LET US RENAME THE  FIE t4_01.dbf TO t4_001.dbf

ALTER DATABASE MOVE DATAFILE
'/u01/app/oracle/oradata/ORCL/pdbts/t4_01.dbf'
TO
'/u01/app/oracle/oradata/ORCL/pdbts/t4_001.dbf'

--NOW LET MOVE t4_001.dbf TO ANOTHER LOCATION
--CREATE FOLDER TEST IN /u01/app/oracle/oradata/ORCL/pdbts/

ALTER DATABASE MOVE DATAFILE
'/u01/app/oracle/oradata/ORCL/pdbts/t4_001.dbf'
TO
'/u01/app/oracle/oradata/ORCL/pdbts/test/t4_001.dbf'


/*
please read this

Queries and DML and DDL operations can be performed while the data file is being moved, for example:
1-SELECT statements against tables and partitions
2-Creation of tables and indexes
3- Rebuilding of indexes
Other notes:
1- If objects are compressed while the data file is moved, the compression remains the same.
2- You do not have to shut down the database or take the data file offline while you move a data file to another
location, disk, or storage system.
3- You can omit the TO clause only when an Oracle-managed file is used. In this case, the
DB_CREATE_FILE_DEST initialization parameter should be set to indicate the new location.
4-If the REUSE option is specified, the existing file is overwritten.
note:  The REUSE keyword indicates the new file should be created even if it already exists.
5-If the KEEP clause is specified, the old file will be kept after the move operation. The KEEP clause is not allowed
if the source file is an Oracle-managed file.

*/