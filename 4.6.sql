--V$CONTAINERS 
--displays information about PDBs and the root associated with the current instance

show con_name

select con_id,name,open_mode from V$CONTAINERS

alter session set container=orclpdb

select con_id,name,open_mode from V$CONTAINERS

alter session set container=cdb$root

show con_name

select pdb_id,pdb_name, status 
from cdb_PDBS

--the status column 
/* 
some imprtant status
NEW - The PDB has never been opened since it was created
NORMAL - The PDB is ready to be used.
UNPLUGGED - The PDB has been unplugged. The only operation that can be performed on it is DROP PLUGGABLE DATABASE.
RELOCATING: The PDB is in the process of being relocated to a different CDB.
RELOCATED: The PDB has been relocated to a different CDB.
*/

alter session set container=orclpdb

show con_name

select pdb_id,pdb_name, status 
from cdb_PDBS
