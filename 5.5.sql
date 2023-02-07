--V$SPPARAMETER

show con_name

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';

alter system set open_cursors=310 container=all scope=memory;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$system_PARAMETER
where name='open_cursors';


/*
V$SPPARAMETER displays information about the contents of the server parameter file. 
If a server parameter file was not used to start the instance, 
then each row of the view will contain FALSE in the ISSPECIFIED column
*/

select * from V$SPPARAMETER
where name='open_cursors';



