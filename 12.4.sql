/*
SQL loader Discard file
Discard file:  
The discard file contains rows that were discarded because they were filtered out 
because of a statement in the SQL*Loader control file ( when clause )
*/

show user;
show con_name;

DROP TABLE EMP_LOAD;

CREATE TABLE EMP_LOAD
(EMPNO NUMBER ,
FNAME VARCHAR2(100),
LNAME VARCHAR2(100) 
);

SELECT * FROM EMP_LOAD;


--we have file  emp.csv   in  /u01/app/oracle
--we want to move the data from this file to the table EMP_LOAD
--we use SQL*Loader
--we need to do a file called conrol file .ctl ( example emp.ctl )
--note: we will not load empno='1008'
/*
Load Data
INFILE '/u01/app/oracle/emp.csv'
APPEND
INTO Table emp_load
WHEN empno <> '1008'
FIELDS TERMINATED BY ',' 
(empno,
fname,
lname
)
*/
  
--go to vm
--and do this sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log 
SELECT * FROM EMP_LOAD;

truncate table EMP_LOAD;

-- to generate the DISCARD u can do this : )
--sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log DISCARD=emp.dsc