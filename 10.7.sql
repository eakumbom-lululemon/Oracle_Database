show user;
show con_name;

CREATE TABLESPACE tbsalert
DATAFILE '/u01/app/oracle/oradata/ORCL/pdbts/tbsalert.dbf'
SIZE 50M  LOGGING EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

select * from dba_data_files
where TABLESPACE_NAME='TBSALERT'; --52428800

select * from dba_free_space
where TABLESPACE_NAME='TBSALERT';--51380224


SELECT df.tablespace_name tablespace, fs.bytes free, df.bytes, 
fs.bytes*100/ df.bytes PCT_FREE
FROM dba_data_files df ,dba_free_space fs
WHERE df.tablespace_name = fs.tablespace_name
AND df.tablespace_name = 'TBSALERT';

begin
DBMS_SERVER_ALERT.SET_THRESHOLD( 
metrics_id => dbms_server_alert.tablespace_pct_full,    
warning_operator =>DBMS_SERVER_ALERT.OPERATOR_GE, 
warning_value => '55', 
critical_operator =>DBMS_SERVER_ALERT.OPERATOR_GE, 
critical_value => '70', 
observation_period => 1,
consecutive_occurrences => 1, 
instance_name => 'orcl', 
object_type =>DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE, 
object_name => 'TBSALERT');
end;

SELECT warning_value, critical_value
FROM dba_thresholds 
WHERE object_name='TBSALERT';

SELECT * FROM dba_outstanding_alerts
 WHERE object_name='TBSALERT';

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

--Wait a few minutes. 10-15
SELECT reason, message_type , message_level
FROM dba_outstanding_alerts
WHERE object_name='TBSALERT';


