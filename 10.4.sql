--Space-Saving Features (UNUSABLE index)
show user;
show con_name;

show parameter DEFERRED_SEGMENT_CREATION

create table employees
( emp_id number,
  fname varchar2(100),
  lname varchar2(100),
 constraint employees_pk primary key (emp_id)
 );
 
select * from user_tables
where table_name='EMPLOYEES';

SELECT * FROM USER_INDEXES

select * from user_segments
where segment_name IN ( 'EMPLOYEES','EMPLOYEES_PK' );

insert into employees values (1,'khaled','alkhudari');
commit;

select * from employees


select * from user_segments
where segment_name IN ( 'EMPLOYEES','EMPLOYEES_PK' );

create index fname_index on EMPLOYEES(fname) ;


select * from user_segments
where segment_name IN ( 'EMPLOYEES','EMPLOYEES_PK' ,'FNAME_INDEX');

create index lname_index on EMPLOYEES(lname) UNUSABLE ;


select * from user_segments
where segment_name IN ( 'EMPLOYEES','EMPLOYEES_PK' ,'FNAME_INDEX','LNAME_INDEX');

alter index LNAME_INDEX REBUILD


select * from user_segments
where segment_name IN ( 'EMPLOYEES','EMPLOYEES_PK' ,'FNAME_INDEX','LNAME_INDEX');


