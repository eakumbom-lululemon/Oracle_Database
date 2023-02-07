/*
Managing Resumable Space Allocation
A resumable statement:
1- Enables you to suspend large operations instead of receiving an error
2- Gives you a chance to fix the problem while the operation is suspended, rather
than starting over
3-Is suspended for the following conditions:
>>Out of space
>>Maximum extents reached
>>Space quota exceeded
4-Can be suspended and resumed multiple times
*/


show user;
show con_name;

drop TABLESPACE tbsalert INCLUDING CONTENTS and DATAFILES;

CREATE TABLESPACE tbsalert
DATAFILE '/u01/app/oracle/oradata/ORCL/pdbts/tbsalert.dbf'
SIZE 10M  LOGGING EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

create table test100 ( emp_id number, name varchar2(100) )
 tablespace TBSALERT;
 
 begin
 for i in 1..400000
 loop
 insert into test100 values ( i, 'any dummy name' );
  commit;
 end loop;
end;
 
 select * from test100
 
 /*
 A statement executes in resumable mode only if its session has been enabled by
one of the following actions:
1- The RESUMABLE_TIMEOUT initialization parameter is set to a nonzero value.
2- An ALTER SESSION ENABLE RESUMABLE statement is issued
*/

ALTER SESSION ENABLE RESUMABLE     
 
 truncate table test100;
 
 begin
 for i in 1..400000
 loop
 insert into test100 values ( i, 'any dummy name' );
  commit;
 end loop;
end;
 
 --the script will be suspend 7,200 seconds=2 hours. ( this the default )
 --you can do ALTER SESSION ENABLE RESUMABLE TIMEOUT 3600
 --now oracle will not give us any message that this script has been suspend
 --but we can see it as DBA. open new session and do this
 /*
 select * from dba_resumable;

SELECT file_name, autoextensible FROM dba_data_files WHERE
tablespace_name='TBSALERT';

ALTER DATABASE DATAFILE
'/u01/app/oracle/oradata/ORCL/pdbts/tbsalert.dbf'
AUTOEXTEND ON MAXSIZE unlimited;

SELECT file_name, autoextensible FROM dba_data_files WHERE
tablespace_name='TBSALERT';

--WAIT until NO ROWS retrived by THIS QUERY
select * from dba_resumable;

select count(1) from test100;
*/


 