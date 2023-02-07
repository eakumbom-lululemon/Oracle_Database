
--con as sysdba
show con_name

alter session set container=orclpdb;

show con_name

create role manager;

grant create table, create view, create sequence
to manager;

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='MANAGER';

---------------------------
CREATE USER ahmed identified by ahmed123;

grant create session to ahmed;

grant unlimited tablespace to ahmed;


grant manager to ahmed;
------------------------------

CREATE ROLE QONLY;

GRANT SELECT ANY TABLE TO QONLY;

GRANT QONLY TO AHMED;

CREATE ROLE IUD_EMP;

GRANT INSERT,UPDATE, DELETE
ON
HR.EMPLOYEES
TO IUD_EMP;


GRANT IUD_EMP TO AHMED;


SELECT * FROM ROLE_TAB_PRIVS
WHERE ROLE='IUD_EMP'

/*

--USER AHMED CONNECTION

select * from session_privs;     

select * from user_sys_privs;

select * from user_role_privs;

select * from role_sys_privs;

SELECT * FROM ROLE_TAB_PRIVS
WHERE ROLE='IUD_EMP'

create table studnet
( student_id number,
  studnet_name varchar2(100)
);

grant select on
studnet to public; 

select * from hr.locations

select * from demo.emp

update hr.employees
set salary=salary+10
where employee_id=100;
 
*/


