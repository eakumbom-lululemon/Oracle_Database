show con_name

select con_id,name,open_mode from v$pdbs;

--make sure that the pluggable database is open
alter pluggable database ORCLPDB open;

--this will show all the tables in the CDB and PDBS
select owner,table_name,con_id from cdb_tables
order by 1,2

--count of tables per container
SELECT con_id, COUNT(table_name)
FROM cdb_tables
GROUP BY con_id


SELECT  COUNT(table_name)
FROM DBA_tables

ALTER session set container=ORCLPDB

show con_name

SELECT  COUNT(table_name)
FROM DBA_tables

alter session set container=cdb$root

show con_name