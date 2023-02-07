
-- query the data files
/*
contains the actual users data, applications data, metadata. 
( Tables, Rows, indexes ,procedures, views…) 
If you lose Datafiles, you lose your database.
*/

show con_name

select name,open_mode,con_id from v$pdbs;

--make sure pluggable is open
alter pluggable database orclpdb open

select file_name,file_id,tablespace_name,con_id 
from cdb_data_files

--same query but using dba , but here we dont have  con_id

select file_name,file_id,tablespace_name
from dba_data_files

--now let do
alter session set container=orclpdb

show con_name

select file_name,file_id,tablespace_name
from dba_data_files