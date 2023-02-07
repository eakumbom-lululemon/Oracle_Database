show con_name

select con_id,name,open_mode 
from v$containers;

alter session set container=PDB$SEED;

select con_id, username,DEFAULT_TABLESPACE,common 
from cdb_users;

select  username,DEFAULT_TABLESPACE,common 
from dba_users;

select con_id,file#, name from V$DATAFILE

select  * from V$TABLESPACE

alter session set container=cdb$root;

--go to vbox
--  mkdir /u01/app/oracle/oradata/ORCL/pdb1

CREATE PLUGGABLE DATABASE pdb1
  ADMIN USER pdb1admin IDENTIFIED BY welcome
  ROLES = (dba)
  DEFAULT TABLESPACE users
    DATAFILE '/u01/app/oracle/oradata/ORCL/pdb1/users01.dbf' SIZE 250M AUTOEXTEND ON
  FILE_NAME_CONVERT = ('/u01/app/oracle/oradata/ORCL/pdbseed/',
                       '/u01/app/oracle/oradata/ORCL/pdb1/')
 /*
 file_name_convert

Use this clause to determine how the database generates the names of files 
(such as data files and wallet files) for the PDB.

*/

select con_id,name,open_mode 
from v$containers;

alter session set container=pdb1; 

alter pluggable database open;


select con_id, username,DEFAULT_TABLESPACE,common 
from cdb_users;

select  username,DEFAULT_TABLESPACE,common 
from dba_users;

select con_id,file#, name from V$DATAFILE

select  * from V$TABLESPACE