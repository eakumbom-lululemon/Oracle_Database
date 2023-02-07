--Advanced row compression
/*
Rows inserted with or without using direct-path insert and updated rows 
are compressed using advanced row compression.

Is enabled with CREATE TABLE … ROW STORE COMPRESS ADVANCED
Is recommended for active OLTP environments

With advanced row compression, duplicate values in the rows and columns in a data block are stored once 
at the beginning of the block

note 1:
ROW STORE COMPRESS ADVANCED and COMPRESS BASIC are not supported for tables with more than 255
note 2: You cannot drop a column from a table that is compressed for direct-load operations, 
although you can set such a column as unused.
*/

create table test_06
as
select * from dba_objects where rownum <= 20000;

ANALYZE TABLE test_06 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_06';

-------------------------------------

create table test_07 ROW STORE COMPRESS ADVANCED
as
select * from dba_objects where rownum <= 20000;

ANALYZE TABLE test_07 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_07';

------------------------------------------

--not let us try normal insert

create table test_08 ROW STORE COMPRESS ADVANCED
as
select * from dba_objects where rownum = 0;

select * from test_08

insert into test_08
select * from dba_objects where rownum <= 20000;
commit;


ANALYZE TABLE test_08 COMPUTE statistics

select  blocks, pct_free , compression, compress_for
from    user_tables
where   table_name = 'TEST_08';