show user ;
show con_name;

show parameter undo

select * from DBA_TABLESPACES

SELECT DBMS_METADATA.GET_DDL('TABLESPACE','UNDOTBS1') FROM dual;
-- so it is   AUTOEXTEND
--so oracle will will adjust the undo_retention automaticlly ( for active query )
--but  flashback operations ( maybe or maybe not work )

alter system set undo_retention=1;

create table xyz
(id number primary key, val number );

begin
for i in 1..500000
loop
insert into xyz values (i,500 );
end loop;
commit;
end;

select * from xyz
order by 1;

--now do this without comment

update xyz
set val=0
where id =500000;

--so this record will be in undo
--take the code now and open new session
/*

create table xyz_copy
(id number primary key, val number );


--this wil insert the data from xyz to xyz_copy 
--note that the value of id 500000 still 500 because the user did not commit
-- exec the code and while it execute back to first session and commit
begin
for i in (select * from xyz)
loop
insert into xyz_copy values (i.id, i.val );
end loop;
commit;
end;

select * from xyz_copy
where id=500000;

-- so oracle will  adjust the undo_retention automaticlly to be more than 1s

--but flashback maybe or maybe not work

select versions_starttime,versions_endtime, val from 
 xyz
versions between scn minvalue and maxvalue
where id=500000;
*/

commit;

