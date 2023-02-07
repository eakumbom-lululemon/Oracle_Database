--SQL*Loader Loading Methods
/*
1-Conventional Load
2-Direct Path Load (faster  )
*/

/*Conventional Load
Uses COMMIT
Always generates redo entries
Enforces all constraints
Fires INSERT triggers
Can load into clustered tables
Allows other users to modify tables during load operation
The insertion of an array ofrecords is followed by a COMMIT operation. 
Each data load may involve several transactions.
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

select * from dept_x

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
--MOVE THE FILE EMPLOYEES.csv TO /u01/app/oracle
--we need to do a file called conrol file .ctl ( example EMPLOYEES.ctl )
/*
Load Data
INFILE '/u01/app/oracle/EMPLOYEES.csv'
APPEND
INTO Table emp_x
FIELDS TERMINATED BY ',' 
(empid,
name,
gender,
deptno,
address
)
*/

--TEST 1 ( NO wrong data ( length or invalid constraints )
--sqlldr control=/u01/app/oracle/EMPLOYEES.ctl log=/u01/app/oracle/EMPLOYEES.log 
select * from emp_x

truncate table emp_x

--TEST 2  updae some values and run sqlldr control=/u01/app/oracle/EMPLOYEES.ctl log=/u01/app/oracle/EMPLOYEES.log
/*
257,khaledalkhudari,M,1,NA
258,KH258,x,1,NA
259,KH259,M,2,NA
*/
truncate table emp_x

--test 3 updae some values
--260,,M,1,NA

truncate table emp_x

--test 4
--make the id 280 = 1

truncate table emp_x

--test 5
--sqlldr control=/u01/app/oracle/EMPLOYEES.ctl log=/u01/app/oracle/EMPLOYEES.log ROWS=50



select * from user_constraints
where table_name='EMP_X';



