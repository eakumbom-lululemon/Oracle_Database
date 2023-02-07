--V$DATABASE displays information about the database from the control file


show con_name

select name,cdb,con_id ,OPEN_MODE
from V$DATABASE

show parameter db_name

--------------

--query the oracle db  version
select banner from v$version

--query the instance name

select * from v$instance

show parameter instance_name