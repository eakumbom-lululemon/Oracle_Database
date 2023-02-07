show con_name;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

--i have one record, and the value of ispdb_modifiable=true
--this mean PDBs inherit initialization parameter values from the root
--let us see
alter system set open_cursors=400 container=current; --ALL also will be the same in this case

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

alter session set container=orclpdb;
show con_name

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

alter system set open_cursors=500 container=current; --you can use ALL here  

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

alter session set container=cdb$root;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors'

--now i will do this 
alter system set open_cursors=410 container=current; --now only the root will be effected 

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors'


--now i will do this 
alter system set open_cursors=410 container=all; --this will remove the setup for the pluggable

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors'