--basic compression 
--With basic compression, the Oracle Database server compresses data at the time of performing bulk load using
--operations such as direct loads or CREATE TABLE AS SELECT
--Is recommended for bulk loading data warehouses

show user;
show con_name;

select * from dba_objects
where rownum<10000;

--case 1
--no compression
create table test_01
as
select * from dba_objects where rownum <= 10000;

SELECT DBMS_METADATA.GET_DDL('TABLE','TEST_01') FROM dual;

ANALYZE TABLE TEST_01 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_01';


--CASE 2
--with basic compression enabled
create table test_02 compress basic
as
select * from dba_objects where rownum <= 10000;

ANALYZE TABLE TEST_02 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_02';

--CASE 3
--Normal insert into empty table defined as compress basic ( no effects )

create table test_03 compress basic
as
select * from dba_objects where 1=2

select * from test_03

insert into test_03
select * from dba_objects where rownum <= 10000;
commit;

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_03';

ANALYZE TABLE TEST_03 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_03';


--4. Direct path insert into empty table defined as compressed
create table TEST_04 compress basic
as
select * from dba_objects where rownum = 0;

select * from TEST_04

insert /*+ append */ into TEST_04 select * from dba_objects where rownum <= 10000
/*
The APPEND hint tells the optimizer to perform a direct-path insert, which improves the 
performance of INSERT .. SELECT operations for a number of reasons:

Data is appended to the end of the table, rather than attempting to use existing free space within the table.
Data is written directly to the data files, by-passing the buffer cache.

*/

ANALYZE TABLE TEST_04 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_04';


--case 5
--without compression, then change to compressed

create table test_05
as
select * from dba_objects where rownum <= 10000;

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_05';

alter table test_05 compress basic; 


select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_05';


alter table test_05 move

ANALYZE TABLE TEST_05 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_05';


