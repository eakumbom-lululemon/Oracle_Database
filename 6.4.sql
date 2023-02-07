show con_name

alter pluggable database all open;

select con_id, name, open_mode 
from v$pdbs;

alter session set container=pdbtest;

select * from hr.employees;

alter session set container=cdb$root;

--we need to unplug pdbtest
--step 1
alter pluggable database pdbtest close immediate;

select con_id, name, open_mode 
from v$pdbs;
--step 2
alter pluggable database pdbtest  unplug into '/u01/app/oracle/oradata/pdbtest.xml'

select con_id, name, open_mode 
from v$pdbs;

--step3
drop pluggable database pdbtest keep datafiles; --you should keep it.

select con_id, name, open_mode 
from v$pdbs;

--step 4 -- but this not work in 18c
/*
DECLARE
  l_result BOOLEAN;
BEGIN
  l_result := DBMS_PDB.check_plug_compatibility(
                pdb_descr_file => '/u01/app/oracle/oradata/pdbtest.xml',
                pdb_name => 'pdbtest');

  IF l_result THEN
    DBMS_OUTPUT.PUT_LINE('compatible');
  ELSE
    DBMS_OUTPUT.PUT_LINE('incompatible');
  END IF;
END;

*/

--step 5
create pluggable database pdbtest1
using '/u01/app/oracle/oradata/pdbtest.xml'
NOCOPY TEMPFILE REUSE;
--FILE_NAME_CONVERT=('/u01/app/oracle/oradata/ORCL/pdb5/',
  --                '/u01/app/oracle/oradata/ORCL/pdbtest/')




select con_id, name, open_mode 
from v$pdbs;


alter session set container=pdbtest1;

alter pluggable database open;

select * from hr.employees;

select con_id,file#, name from V$DATAFILE

