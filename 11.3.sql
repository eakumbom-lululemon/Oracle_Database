select * from employees;


create table emp_copy3
as
select * from employees;

select * from emp_copy3;

drop table emp_copy3;

select * from emp_copy3;


select * from recyclebin;
/*
The SCN is an internal number maintained by the database management system 
to log changes made to a database
Whenever an application commits a transaction, the log writer process (LGWR)
writes records from the redo log buffers in the (SGA) to the online redo logs on disk. 
LGWR also writes the transaction’s SCN to the online redo log file. 
*/

 
flashback  table emp_copy3 to before drop;

select * from emp_copy3;

select * from recyclebin;
--you can do this command( purge recyclebin) to make the recyclebin empty;
---------------------------------------------------------------------------------------------------------------
/*Using Oracle Flashback Version Query
Use Oracle Flashback Version Query to retrieve the different versions of specific rows 
that existed during a given time interval. 
A row version is created whenever a COMMIT statement is executed.
*/

select salary from 
employees
where employee_id=107;

update
employees
set salary=salary+100
where employee_id=107;

commit; -- thi will make new scn

select salary from 
employees
where employee_id=107;




select versions_starttime,versions_endtime, salary from 
employees
versions between scn minvalue and maxvalue
where employee_id=107;

update
employees
set salary=salary+100
where employee_id=107;
commit;

select versions_starttime,versions_endtime, salary from 
employees
versions between scn minvalue and maxvalue
where employee_id=107;

--q: until when i can see these records ???
--This depend on many factors
--1-	Tablespace type (fixed or auto extend )
--2-	The retention period  UNDO_RETENTION
--3-	Retention Guarantee