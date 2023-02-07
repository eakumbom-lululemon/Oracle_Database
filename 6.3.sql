show con_name

alter pluggable database all open;

select con_id, name, open_mode 
from v$pdbs;

alter session set container=pdb5;

select * from hr.employees;

alter session set container=cdb$root;

--we need to unplug pdb5
--step 1
alter pluggable database pdb5 close immediate;

select con_id, name, open_mode 
from v$pdbs;
--step 2
alter pluggable database pdb5 unplug into '/u01/app/oracle/oradata/pdb5.xml'

select con_id, name, open_mode 
from v$pdbs;

--step3
drop pluggable database pdb5 keep datafiles; --you should keep it.

select con_id, name, open_mode 
from v$pdbs;

--step 4 -- but this not work in 18c
/*
DECLARE
  l_result BOOLEAN;
BEGIN
  l_result := DBMS_PDB.check_plug_compatibility(
                pdb_descr_file => '/u01/app/oracle/oradata/pdb5.xml',
                pdb_name => 'PDB5');

  IF l_result THEN
    DBMS_OUTPUT.PUT_LINE('compatible');
  ELSE
    DBMS_OUTPUT.PUT_LINE('incompatible');
  END IF;
END;

*/


create pluggable database pdbtest
using '/u01/app/oracle/oradata/pdb5.xml'
FILE_NAME_CONVERT=('/u01/app/oracle/oradata/ORCL/pdb5/',
                  '/u01/app/oracle/oradata/ORCL/pdbtest/')




select con_id, name, open_mode 
from v$pdbs;


alter session set container=pdbtest;

alter pluggable database open;

select * from hr.employees;



