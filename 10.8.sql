show user;
show con_name;

drop TABLESPACE tbsalert INCLUDING CONTENTS and DATAFILES;

CREATE TABLESPACE tbsalert
DATAFILE '/u01/app/oracle/oradata/ORCL/pdbts/tbsalert.dbf'
SIZE 50M  LOGGING EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;


SELECT df.tablespace_name tablespace, fs.bytes free, df.bytes, 
fs.bytes*100/ df.bytes PCT_FREE
FROM dba_data_files df ,dba_free_space fs
WHERE df.tablespace_name = fs.tablespace_name
AND df.tablespace_name = 'TBSALERT';


create table test100 ( emp_id number, name varchar2(100) )
 tablespace TBSALERT;
 
 begin
 for i in 1..1000000
 loop
 insert into test100 values ( i, 'any dummy name' );
 end loop;
 commit;
 end;
 
SELECT df.tablespace_name tablespace, fs.bytes free, df.bytes, 
fs.bytes*100/ df.bytes PCT_FREE
FROM dba_data_files df ,dba_free_space fs
WHERE df.tablespace_name = fs.tablespace_name
AND df.tablespace_name = 'TBSALERT';

delete from test100;
commit;

SELECT df.tablespace_name tablespace, fs.bytes free, df.bytes, 
fs.bytes*100/ df.bytes PCT_FREE
FROM dba_data_files df ,dba_free_space fs
WHERE df.tablespace_name = fs.tablespace_name
AND df.tablespace_name = 'TBSALERT';


--Create a Segment Advisor Task
 DECLARE
 tname VARCHAR2(128) := 'my_seg_task3';
 tname_desc VARCHAR2(128) := 'Get shrink advice for segments in TBSALERT';
 task_id NUMBER;
 object_id NUMBER;
 objectname VARCHAR2(100);
 objecttype VARCHAR2(100);
 BEGIN
 dbms_advisor.create_task('Segment Advisor', task_id,tname,tname_desc,NULL);---select * from DBA_ADVISOR_DEFINITIONS
 dbms_advisor.create_object(tname,'TABLESPACE','TBSALERT',' ',' ',NULL, ' ',object_id) ;
 dbms_advisor.set_task_parameter(tname,'RECOMMEND_ALL','TRUE');
 END;

--Execute the task.
DECLARE
tname VARCHAR2(128) := 'my_seg_task3';
BEGIN
dbms_advisor.EXECUTE_TASK(tname);
END;

SELECT DESCRIPTION FROM dba_advisor_tasks WHERE TASK_NAME='my_seg_task3';


SELECT attr1, attr2, message
FROM dba_advisor_findings f, dba_advisor_objects o
 WHERE f.task_name = o.task_name 
 AND f.object_id = o.object_id 
 AND f.task_name = 'my_seg_task3';


alter table test100 enable row movement;

ALTER TABLE test100 SHRINK SPACE;

SELECT df.tablespace_name tablespace, fs.bytes free, df.bytes, 
fs.bytes*100/ df.bytes PCT_FREE
FROM dba_data_files df ,dba_free_space fs
WHERE df.tablespace_name = fs.tablespace_name
AND df.tablespace_name = 'TBSALERT';


