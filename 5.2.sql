show con_name

select name, open_mode from v$pdbs;

alter pluggable database all open;


--V$PARAMETER show info about the PARAMETERs that are currently in effect for the session
select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$PARAMETER
order by name

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$PARAMETER
where name ='control_files'

--note: when the issys_modifiable=FALSE, this mean it is static parameter
--this mean it could be changed, but in Spfile only and need restart the DB using Spfile
--when you see issys_modifiable=IMMEDIATE , changes can take effect IMMEDIATE
--when you see issys_modifiable=DEFERRED , changes can take effect for future sessions


--V$PARAMETER2 show info about the PARAMETERs that are currently in effect for the session
--but it is more readable in case the value has many lines
select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$PARAMETER2
where name ='control_files'

/*
V$SYSTEM_PARAMETER is the view which shows instance level parameters 
(and these are what all new sessions inherit)
ISDEFAULT Indicates whether the parameter is set to the default value (TRUE) 
or the parameter value was specified in the parameter file (spfile or pfile) (FALSE) 
*/

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$SYSTEM_PARAMETER
order by name

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$SYSTEM_PARAMETER
where ISDEFAULT='FALSE' 
AND CON_ID=0
order by name


select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,ISDEFAULT,con_id
from V$SYSTEM_PARAMETER
where name='nls_date_format'

alter session set nls_date_format='dd-mm-yyyy'

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$SYSTEM_PARAMETER
where name='nls_date_format'

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$PARAMETER
where name='nls_date_format'

/*
V$SYSTEM_PARAMETER2 is the view which shows instance level parameters 
(and these are what all new sessions inherit)
--but it is more readable in case the value has many lines
*/

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable ,con_id
from V$SYSTEM_PARAMETER2
where name ='control_files'


