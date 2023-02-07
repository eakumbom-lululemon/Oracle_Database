--we will learn the sql loader
--SQL*Loader is a bulk loader utility used for moving data from external files into the Oracle database
-- move the file emp.csv to server /u01/app/oracle

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
/*
Load Data
INFILE '/u01/app/oracle/emp.csv'
APPEND
INTO Table emp_load
FIELDS TERMINATED BY ',' 
(empno,
fname,
lname
)
*/
-- then after this  we execute this commnad sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log  
--go to vm
--and do this sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log 
SELECT * FROM EMP_LOAD;


truncate table  EMP_LOAD;

--now update the file emp.csv, make some ids to be characters
--we want to know the bad file, the records that not inserted 
--sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log 