--1 you have to connect sys as sysdba
--2 when the DBA connect, it will be on root container db


show con_name

alter session set container=orclpdb

show con_name


select username,account_status,common 
from dba_users;

--to see the priv map
select * from SYSTEM_PRIVILEGE_MAP

--now lets create new user called demo

--this will create user demo with password demo1234
create user demo identified by demo1234; -- he can not login yet

--now these some sys priv
grant create session to demo;

grant create table to demo;
-- you can do this also : grant create session,create table to demo

GRANT UNLIMITED TABLESPACE TO DEMO;

grant create sequence to DEMO;

grant create view to demo;

grant create synonym to demo;
---------------------------------------------------------------------------
--now these some object priv
grant select on hr.employees to demo;

grant delete on hr.employees to demo;

grant update (salary)  on hr.employees to demo;

grant all on hr.locations to demo;

grant select, insert 
on hr.jobs to demo;

grant select 
on hr.countries
to public;

/*
now connect to demo and do all the next

--the user demo can know his privileges by using this query
select * from session_privs;

--now if he have create table privileges then he can insert,update,delete, 
--select, alter, index on any table he create

create table emp
( empid number constraint emp_pk primary key,
  ename varchar2(100)
);

insert into emp values (1,'khaled');

select * from emp;

alter table emp
add (salary number);

select * from emp;


create sequence emp_s;

--he can create index for the table he create 
create index ename_ind on emp (ename);


create or replace view emp_v
as
select empid, ename
from emp;

--now the user demo he want to change his password , because the dba create for 
--his default password demo1234

alter user demo identified by demo_green;


select * from hr.employees;

--the demo user can make select * from employees without hr. only if there is public syonym for hr.employees

select * from all_synonyms
where table_name='EMPLOYEES'


update hr.employees
set department_id =null
where employee_id=1;

update hr.employees
set salary =500
where employee_id=1;



select * from session_privs;

select * from user_sys_privs;


select * from user_tab_privs_recd
order by 2;

select * from user_col_privs_recd;

grant select on emp to hr;

select * from user_tab_privs_made;

grant update (ename) on emp to hr;

select * from user_col_privs_made;
*/



