show con_name

alter pluggable database orclpdb open;

alter session set container=orclpdb

show con_name

select 
oracle_username
os_user_name,
locked_mode,
object_name,
object_type
from 
v$locked_object a,dba_objects b
where 
a.object_id = b.object_id

select * from hr.employees;

update hr.employees
set salary=salary+1
where employee_id=100;

select 
oracle_username
os_user_name,
locked_mode,
object_name,
object_type
from 
v$locked_object a,dba_objects b
where 
a.object_id = b.object_id

rollback;

select 
oracle_username
os_user_name,
locked_mode,
object_name,
object_type
from 
v$locked_object a,dba_objects b
where 
a.object_id = b.object_id





