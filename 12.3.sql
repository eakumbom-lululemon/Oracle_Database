show user;
show con_name;

--external table using  ORACLE_DATAPUMP

--method 1
--create external table that create .dmp file from select statement  
cREATE TABLE EMP_pump
     (EMPLOYEE_NUMBER  ,
      FNAME ,
      LNAME 
      )
    ORGANIZATION EXTERNAL
      (TYPE ORACLE_DATAPUMP
      DEFAULT DIRECTORY EMP_DIR
      LOCATION ('EMP.dmp')
     )
     AS 
     SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
     from EMPLOYEES;
     
SELECT * FROM EMP_PUMP;


--drop table EMP_PUMP_READ;

--method 2
--create external table that read existing .dmp file 

CREATE TABLE EMP_PUMP_READ
     (EMPLOYEE_NUMBER NUMBER ,
      FNAME   VARCHAR2(100),
      LNAME  VARCHAR2(100) 
      )
    ORGANIZATION EXTERNAL
      (TYPE ORACLE_DATAPUMP
      DEFAULT DIRECTORY EMP_DIR
      LOCATION ('EMP.dmp')
     );