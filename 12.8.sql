CREATE TABLE sales_by_country
      (trans_id number, 
       trans_amount number,
       country varchar2(3))
   PARTITION BY LIST (country)
      (PARTITION c1 VALUES ('USA'),
       PARTITION c2 VALUES ('JOR')
      );
      
SELECT *
FROM   user_tab_partitions
WHERE TABLE_NAME='SALES_BY_COUNTRY'
ORDER BY table_name, partition_name;

insert into sales_by_country values (1,500,'USA');
insert into sales_by_country values (2,600,'USA');
insert into sales_by_country values (3,400,'USA');
insert into sales_by_country values (4,500,'JOR');
insert into sales_by_country values (5,600,'JOR');
insert into sales_by_country values (6,400,'JOR');
COMMIT;

--NOW DO THIS
insert into sales_by_country values (7,3500,'UAE');

SELECT COUNT(1) FROM sales_by_country
GROUP BY country;

--YOU CAN DO THIS
SELECT COUNT(1) FROM sales_by_country PARTITION  (c1);
SELECT COUNT(1) FROM sales_by_country PARTITION  (c2);

--LET US ADD NEW PARTITION

ALTER TABLE sales_by_country
ADD PARTITION C3 VALUES('UAE');

insert into sales_by_country values (7,3500,'UAE');
COMMIT;

SELECT COUNT(1) FROM sales_by_country PARTITION  (c3);

SELECT *
FROM   user_tab_partitions
WHERE TABLE_NAME='SALES_BY_COUNTRY'
ORDER BY table_name, partition_name;


SELECT * FROM sales_by_country;

--NOW LET US DO 3 FILES .DAT EACH FILE CONTAIN COUNTRY
--PUT THEM IN /u01/app/oracle

/* FILE 1: USA.dat
1,500,USA
2,600,USA
3,400,USA
*/

/* FILE 2: JOR.dat
4,500,JOR
5,600,JOR
6,400,JOR
*/

/* FILE 1: UAE.dat
7,3500,UAE
*/

--first thing make sure that  DIRECTORY EMP_DIR exists

SELECT * FROM ALL_DIRECTORIES
WHERE DIRECTORY_NAME='EMP_DIR'; 

CREATE TABLE  sales_by_country_ext
     (trans_id number, 
       trans_amount number,
       country varchar2(3)
      )
    ORGANIZATION EXTERNAL
      (TYPE ORACLE_LOADER
      DEFAULT DIRECTORY EMP_DIR
      ACCESS PARAMETERS
        (RECORDS DELIMITED BY NEWLINE
         FIELDS TERMINATED BY ','
        )
     )
     reject limit unlimited
   PARTITION BY LIST (country)
   (
   PARTITION c1 VALUES ('USA') LOCATION ('USA.dat'),
   PARTITION c2 VALUES ('JOR') LOCATION ('JOR.dat'),
   PARTITION c3 VALUES ('UAE') LOCATION ('UAE.dat')
   )

SELECT * FROM sales_by_country_ext;

SELECT table_name, partition_name, location, directory_name
FROM all_XTERNAL_LOC_PARTITIONS
where table_name='SALES_BY_COUNTRY_EXT';

