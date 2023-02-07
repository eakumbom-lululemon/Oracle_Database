
select name,value from V$PARAMETER
order by name;

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable 
from V$PARAMETER
where name ='nls_date_format'


select sysdate from dual;

alter session set nls_date_format='dd-mm-yyyy';

select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable 
from V$PARAMETER
where name ='nls_date_format'

select sysdate from dual;

--can you query all the para that we can change it on session level
Select name,value,isses_modifiable , issys_modifiable , ispdb_modifiable 
from V$PARAMETER
where isses_modifiable='TRUE'


