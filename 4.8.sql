show con_name

alter pluggable database orclpdb open;

select tablespace_name,block_size,status,contents,con_id 
from cdb_tablespaces;

select *
from V$TABLESPACE

alter session set container=orclpdb 

select tablespace_name,block_size,status,contents,con_id 
from cdb_tablespaces;

select tablespace_name,block_size,status,contents,con_id 
from dba_tablespaces;

select *
from V$TABLESPACE