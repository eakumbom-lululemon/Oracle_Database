
-- query the temps files
/*
A tempfile is a file that is part of an Oracle database. 
Tempfiles are used with TEMPORARY TABLESPACES

Temporary tablespaces are used for special operations, particularly for sorting data results on disk and for 
hash joins in SQL. For SQL with millions of rows returned, the sort operation is too large for the RAM 
area and must occur on disk.  
The temporary tablespace is where this takes place
*/

show con_name

select name,open_mode,con_id from v$pdbs;

--make sure pluggable is open
alter pluggable database orclpdb open

select file_name,file_id,tablespace_name,con_id 
from cdb_temp_files

--same query but using dba , but here we dont have  con_id

select file_name,file_id,tablespace_name
from dba_temp_files

--now let do
alter session set container=orclpdb

show con_name

select file_name,file_id,tablespace_name
from dba_temp_files

