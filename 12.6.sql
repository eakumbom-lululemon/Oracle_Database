--SQL*Loader Loading Methods
/*
1-Conventional Load
2-Direct Path Load (faster  )
*/

/* Direct Path Load (DIRECT=TRUE)
Uses data saves (faster operation)
Generates redo only under specific conditions
Enforces only PRIMARY KEY, UNIQUE, and NOT NULL
Does not fire INSERT triggers
Does not load into clusters
Prevents other users from making changes to tables during load operation
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
--sqlldr control=/u01/app/oracle/EMPLOYEES.ctl log=/u01/app/oracle/EMPLOYEES.log DIRECT=TRUE
select * from emp_x

select * from user_constraints
where table_name='EMP_X';

ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_CHQ1;
ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_FK1;

select * from user_constraints
where table_name='EMP_X';

select * from user_indexes
where table_name='EMP_X'


truncate table emp_x

--TEST 2  FK AND check CONSTRAINTS

/*
287,KH287,x,1,NA
288,KH288,M,2,NA
*/
--sqlldr control=/u01/app/oracle/EMPLOYEES.ctl log=/u01/app/oracle/EMPLOYEES.log DIRECT=TRUE

select * from user_constraints
where table_name='EMP_X';

ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_CHQ1;
ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_FK1;

truncate table emp_x

ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_CHQ1;
ALTER TABLE emp_x ENABLE CONSTRAINT EMP_X_FK1;


--TEST 3
--PK, NOT NULL ,uk
--MAKE THE ID 289=1
--290,,M,1,NA
--291,KH1,M,1,NA

SELECT * FROM emp_x
ORDER BY  1;

SELECT * FROM emp_x
ORDER BY  2;







