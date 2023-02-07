show con_name

select con_id,name,open_mode
from v$pdbs;


alter session set container=ORCLPDB;

show con_name

select username,DEFAULT_TABLESPACE,common 
from dba_users;

select  *
from dba_tables
where OWNER='HR';

select con_id,file#, name from V$DATAFILE

select  * from V$TABLESPACE


--NOW LET US CLONE ORCLPDB TO pdb5
--go to vbox
--login as oracle user
--  mkdir /u01/app/oracle/oradata/ORCL/pdb5
--login to orclpdb and do some uncommited tans.
--update hr.employees set salary=salary +1 where employee_id=100;
--select salary from hr.employees where employee_id=100; 

alter session set container=cdb$root;

show con_name

CREATE PLUGGABLE DATABASE pdb5 from orclpdb
FILE_NAME_CONVERT = ('/u01/app/oracle/oradata/ORCL/orclpdb/',
                       '/u01/app/oracle/oradata/ORCL/pdb5/')
/*
you can do this if you need oracle managed files to names the files
CREATE PLUGGABLE DATABASE pdb5 from orclpdb
create_file_dest '/u01/app/oracle/oradata/ORCL/pdb5'
*/

select con_id,name,open_mode 
from v$pdbs;

alter session set container=PDB5; 

alter pluggable database open;

select salary from hr.employees where employee_id=100; 



select  username,DEFAULT_TABLESPACE,common 
from dba_users;

select  *
from dba_tables
where OWNER='HR';

select con_id,file#, name from V$DATAFILE

select  * from V$TABLESPACE

