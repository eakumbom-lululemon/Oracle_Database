show con_name

select name,open_mode,con_id from v$pdbs;

--make sure pluggable is open
alter pluggable database orclpdb open

select file_name,file_id,tablespace_name,con_id 
from cdb_data_files

select file#,name, ts#,con_id 
from V$DATAFILE
order by con_id
--Some V$ views are available even when the database is not fully open and running.

alter pluggable database orclpdb close

select file#,name, ts#,con_id 
from V$DATAFILE
order by con_id

select file_name,file_id,tablespace_name,con_id 
from cdb_data_files


alter session set container=orclpdb


select file#,name, ts#,con_id 
from V$DATAFILE
order by con_id

select file_name,file_id,tablespace_name
from dba_data_files




