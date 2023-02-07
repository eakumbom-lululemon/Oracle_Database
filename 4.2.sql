show con_name

--make sure that all pluggable is opned
select con_id,name,open_mode from v$pdbs

alter pluggable database all open;



select username,common,con_id from cdb_users
order by username;

select distinct(username) from cdb_users
where common='YES'


select username,common,con_id from cdb_users
where common='NO'
order by username


SHOW PARAMETER common_user_prefix

CREATE USER t1 IDentified by t1;

CREATE USER C##t1 IDentified by welcome;

select distinct(username) from cdb_users
where common='YES'

alter session set container=orclpdb

show con_name

create user khaled identified by khaled ;

select username,common,con_id from cdb_users
where common='NO'
order by username