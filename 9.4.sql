show user;

show con_name;

create tablespace t3;

SELECT DBMS_METADATA.GET_DDL('TABLESPACE','T3') FROM dual;

select TABLESPACE_NAME,BLOCK_SIZE,STATUS,CONTENTS,LOGGING,SEGMENT_SPACE_MANAGEMENt,COMPRESS_FOR
from dba_tablespaces;

select * from v$tablespace


select * from v$datafile

CREATE USER khaled identified by khaled
default tablespace t3;

grant create session,create table, unlimited tablespace to khaled;

create table khaled.emp( id number, name varchar2(200));

insert into khaled.emp values (1,'ford');
insert into khaled.emp values (2,'sara');
insert into khaled.emp values (3,'ali');
commit;

ALTER TABLESPACE T3 READ ONLY;

insert into khaled.emp values (4,'DAVE');

ALTER TABLESPACE T3 READ WRITE;

insert into khaled.emp values (4,'DAVE');
COMMIT;

--LET US REZIE THE DATAFIE
select * from v$datafile

ALTER DATABASE DATAFILE 
'XXXXXXXX.dbf'
   RESIZE 200M;


ALTER TABLESPACE T3
    ADD DATAFILE '/u01/app/oracle/oradata/ORCL/pdbts/ORCL/T3_02.dbf' SIZE 10M

select * from v$datafile