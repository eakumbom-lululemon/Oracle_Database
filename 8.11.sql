SHOW CON_NAME

select * from dba_objects
where object_name like '%VERIFY%'
AND OBJECT_TYPE='FUNCTION'

ALTER SESSION SET CONTAINER=ORCLPDB

select * from dba_objects
where object_name like '%VERIFY%'
AND OBJECT_TYPE='FUNCTION'


CREATE PROFILE TEST_PASS
LIMIT
PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION 

SELECT * FROM DBA_PROFILES
WHERE PROFILE='TEST_PASS';

--NOTE: WHEN U SEE DEFAULT, THIS MEAN IT WILL READ FROM THE DEFAULT PROFILE

create user test100 identified by welcome  profile TEST_PASS 

create user test100 identified by welcome1234  profile TEST_PASS 

create user test100 identified by welcome1234#  profile TEST_PASS 

grant create session to test100


/*
go to vm
connect using test100/welcome1234#@orclpdb
try to do this
alter user test100 identified by welcome678#
Cause : ORA-28221 error occurs when an user tries to reset his own password 
without specifying the REPLACE keyword, provided the user does not have ALTER USER privilege 
and the user is having a profile with password verify function.
so
it should be
alter user test100 identified by welcome678# replace welcome1234#




