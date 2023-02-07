create table emp( n number, sal number );

insert into emp values (1,500);
insert into emp values (2,400 );

select a.sid, a.serial#, a.username, b.used_urec, b.used_ublk
from   v$session a,
       v$transaction b
where  a.saddr = b.ses_addr
order by b.used_ublk desc;
--USED_UBLK = Number of undo blocks used 
--USED_UREC = Number of undo records used

insert into emp values (3,700 );

select a.sid, a.serial#, a.username, b.used_urec, b.used_ublk
from   v$session a,
       v$transaction b
where  a.saddr = b.ses_addr
order by b.used_ublk desc;

commit; --this mean end of transaction

select a.sid, a.serial#, a.username, b.used_urec, b.used_ublk
from   v$session a,
       v$transaction b
where  a.saddr = b.ses_addr
order by b.used_ublk desc;
