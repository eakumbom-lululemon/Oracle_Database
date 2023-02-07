--SQL*Loader express mode
/*
The main benefit of SQL*Loader express mode is the savings for time and effort that
results from not needing to write and test a SQL*Loader control file. Instead, you specify
a single SQL*Loader command with a few parameters and the load starts. 

Another benefit of express mode is that it will try to use the fastest mechanism for loading
data files: external tables using parallel inserts with the append hint. The append hint on
an insert statement tells the database to use direct path for loading table data. Executing
the insert in parallel means that multiple processes can load data from the data file at
once, reducing the elapsed time for the load. 

*/

show  user;
show con_name;


drop table emp_x;
drop table dept_x;

create table dept_x
(deptno number,
 dname varchar2(100),
 constraint dept_x primary key (deptno)
 );
 
insert into dept_x values (1, 'sales');
commit;

select * from dept_x;

create table emp_x
( empid number,
  name varchar2(10) not null,
  gender varchar(1),
  deptno number,
  address varchar2(100),
constraint emp_x_pk primary key (empid),
constraint emp_x_uk1 unique  (name),
constraint emp_x_fk1 foreign key (deptno) references dept_x(deptno),
constraint emp_x_chq1  check ( gender in ('M','F') )
);


select * from emp_x;

-- go to VM /u01/app/oracle
-- move this file emp_x.dat

--now do this command : sqlldr hr/hr@orclpdb TABLE=emp_x
--oracle will look to any file called emp_x.dat in same directory
/*
SQL*Loader first created a temporary external table, used the external table 
to load the content of the
external data file into the table, and finally dropped the temporary external table.
*/

select * from emp_x

delete from emp_x;
commit;

--test 1
--pk constraint, uk,fk,check, not null
--make all the test on id 280 --- follow with me 

select * from user_constraints
where table_name='EMP_X';


--test 2
--make the length for name more than 10char
--follow with me 

delete from emp_x;
commit;

--test 3
--sqlldr hr/hr@orclpdb TABLE=emp_x DIRECT=NO
--this will use the Conventional Load --not external table 
select * from emp_x
--now do this
--sqlldr hr/hr@orclpdb TABLE=emp_x DIRECT=YES
--this will use the DIRECT PATH LOAD 

SELECT * FROM emp_x
ORDER BY 1

select * from user_constraints
where table_name='EMP_X';



