--now we will learn how to create external tables
--external table is read only table whose metadata is stored in the Db, 
--but whose data is stored outside the db.
--no DML allowed, no indexes can be created on external tables
--you can access the data with 2 methods (oracle_loader or oracle_datapump )
--to read external data, first you need to create directory in the database
/*to create DIRECTORY you need "create any DIRECTORY " priv, the dba should give you this
conn sqlplus sys as sysdba
alter session set container=orclpdb;
grant create any DIRECTORY to hr;
*/

--now go to server /u01/app/oracle  and create old_emp_data.csv
--put these values
/*
1,khaled,ali
2,lana,diaz
3,lord, king
4,meme, moon
*/


CREATE OR REPLACE DIRECTORY EMP_DIR
AS '/u01/app/oracle';

SELECT * FROM ALL_DIRECTORIES
WHERE DIRECTORY_NAME='EMP_DIR';



CREATE TABLE EMP_LOAD_ext
     (EMPLOYEE_NUMBER      NUMBER,
      FNAME   VARCHAR2(100),
      LNAME   VARCHAR2(100)
      )
    ORGANIZATION EXTERNAL
      (TYPE ORACLE_LOADER
      DEFAULT DIRECTORY EMP_DIR
      ACCESS PARAMETERS
        (RECORDS DELIMITED BY NEWLINE
         FIELDS TERMINATED BY ','
        )
      LOCATION ('old_emp_data.csv')
     )
     reject limit unlimited;

SELECT * FROM EMP_LOAD_EXT;

DELETE EMP_LOAD_EXT; --dml operation not supported on external organized table

--go to the file old_emp_data.csv and add this
--200, dana,ford
--then

SELECT * FROM EMP_LOAD_EXT;

--go to the file old_emp_data.csv and add this
--change the id 1 to be xx

SELECT * FROM EMP_LOAD_EXT;