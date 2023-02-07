SHOW con_name

alter pluggable database all open;

select con_id,name,open_mode from v$containers;

/*
redo log files store all changes made to the database as they occur.
The database maintains online redo log files to protect against data loss. 
Specifically,after an instance failure.
the online redo log files enable Oracle Database to recover
committed data that it has not yet written to the data files.
--we need minimum 2 redo log files
--one is always available for wrtiting , while the other is being archived  
very imprtant note: redo log files exists in the whole instance, not for particular container 
*/

select * from v$logfile

/*
Control files
Stores metadata about the datafiles and online redo log files ( like names ,locations  and statuses ) 
and this info is required by the database instance to open the database.
very imprtant note: Control files exists in the whole instance, not for particular container 
*/

select * from V$CONTROLFILE


