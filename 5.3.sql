/*OPEN_CURSORS specifies the maximum number of open cursors 
a session can have at once. 
You can use this parameter to prevent a session from opening an excessive number of cursors.
*/

show con_name;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$PARAMETER
where name='open_cursors'

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

show parameter spfile

alter system set open_cursors=301;  --same alter system set open_cursors=301 scope=both;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors'

--now go to vm, open sqlplus  
--shutdown immediate
--startup pfile=any pfile you have
--then try to: alter system set open_cursors=301 scope=spfile;
--ORA-32001: write to SPFILE requested but no SPFILE is in use
--only memory can be used or alter system set open_cursors=301 
--which equal to   alter system set open_cursors=301 scope=memory;

