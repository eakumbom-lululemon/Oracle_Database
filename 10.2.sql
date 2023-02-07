show user
show con_name

create table dept
(deptno NUMBER(2),
 dept_name varchar2(100 )
 );
 
select * from dba_tables
where table_name='DEPT';

SELECT * FROM USER_SEGMENTS
WHERE SEGMENT_NAME='DEPT';

INSERT into dept values ( 1, 'IT Dept' );
INSERT into dept values ( 2, 'FINANCE' );
commit;

SELECT * FROM USER_SEGMENTS
WHERE SEGMENT_NAME='DEPT';

create unique index dept_inx on DEPT(deptno);

SELECT * FROM USER_SEGMENTS

update dept
set dept_name='XXXX'


SELECT * FROM dba_SEGMENTS
where owner='PDBTS_ADMIN'

select a.sid, a.serial#, a.username, b.used_urec, b.used_ublk
from   v$session a,
       v$transaction b
where  a.saddr = b.ses_addr
order by b.used_ublk desc;
--USED_UBLK = Number of undo blocks used 
--USED_UREC = Number of undo records used

ROLLBACK;

select a.sid, a.serial#, a.username, b.used_urec, b.used_ublk
from   v$session a,
       v$transaction b
where  a.saddr = b.ses_addr
order by b.used_ublk desc;




