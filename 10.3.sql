--DEFERRED_SEGMENT_CREATION

show user;
show con_name;

show parameter DEFERRED_SEGMENT_CREATION

--this mean the segment will created for the table
--1 after you crate the table using DDL statement ( create table )
--2 after you insert one record ( DML )

create table country (id number, name varchar2(100) );

select * from user_segments
where segment_name= upper('country');

insert into country values (1,'Jordan');

select * from user_segments
where segment_name= upper('country');

--now let change DEFERRED_SEGMENT_CREATION to be false
--you can do this by alter session / alter system
--this will create the segment immidiate

alter session set DEFERRED_SEGMENT_CREATION=false;

show parameter DEFERRED_SEGMENT_CREATION

create table jobs (id number, title varchar2(100) );

select * from user_segments
where segment_name= upper('jobs');

--note
--Deferred segment is the default for tables, indexes, and partitions

--let do this now
alter session set DEFERRED_SEGMENT_CREATION=true;

--but we can do this also

create table test ( n number )
SEGMENT CREATION IMMEDIATE;

select * from user_segments
where segment_name= upper('test');



create table test10 ( n number )
SEGMENT CREATION DEFERRED;

select * from user_segments
where segment_name= upper('test10');