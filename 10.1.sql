show user

show con_name

create tablespace ts1;


SELECT DBMS_METADATA.GET_DDL('TABLESPACE','TS1') FROM dual;
/*
  CREATE TABLESPACE "TS1" DATAFILE 
  SIZE 104857600
  AUTOEXTEND ON NEXT 104857600 MAXSIZE 32767M
  LOGGING ONLINE PERMANENT BLOCKSIZE 8192
  EXTENT MANAGEMENT LOCAL AUTOALLOCATE DEFAULT 
 NOCOMPRESS  SEGMENT SPACE MANAGEMENT AUTO
 */
 

select * from dba_tablespaces
where tablespace_name='TS1' ;

--REMEMBER THE RELATION 
--TABLESPACE-SEGMENT-EXTENT-BLOCK

CREATE USER alex identified by alex
default tablespace ts1

grant create session, create table, unlimited tablespace to alex;

select * from dba_users
where username='ALEX';

CREATE TABLE ALEX.EMP ( EMP_ID NUMBER, NAME VARCHAR2(100), NOTE VARCHAR2(1000) );

SELECT * FROM DBA_TABLES
WHERE TABLE_NAME='EMP'
AND OWNER='ALEX';

SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; --SO ORACLE DID NOT CREATE SEGMENT, NO ROWS IN THE TABLE

INSERT INTO ALEX.EMP VALUES (1,'KHALED','the best teacher ever : )')
commit;

SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; 


select * from dba_extents
where owner='ALEX'
and  SEGMENT_NAME='EMP'; 

--now let us insert 1000 rows

begin
 for i in 1..1000
 loop
 insert into ALEX.EMP values (i,'just test name', 'just test comments');
 end loop;
 commit;
end;

SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; 


select * from dba_extents
where owner='ALEX'
and  SEGMENT_NAME='EMP'; 

--now let us insert 1000000 rows

begin
 for i in 1..1000000
 loop
 insert into ALEX.EMP values (i,'just test name', 'just test comments');
 end loop;
 commit;
end;


SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; 


select * from dba_extents
where owner='ALEX'
and  SEGMENT_NAME='EMP'; 

select rowid,emp_id,name,note 
from ALEX.emp
where emp_id=1000000
--example
--rowid OOOOOOFFFBBBBBBRRR
--OOOOOO object number
--FFF Relative File Number
--BBBBBB The data block number
--RRR The row number


delete from ALEX.EMP;
commit;

SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; 


select * from dba_extents
where owner='ALEX'
and  SEGMENT_NAME='EMP'; 


truncate table ALEX.EMP;


SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP'; 


select * from dba_extents
where owner='ALEX'
and  SEGMENT_NAME='EMP'; 

