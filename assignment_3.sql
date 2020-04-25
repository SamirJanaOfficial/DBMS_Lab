ASSIGNMENT-3

select systimestamp from DUAL:

select 2*2 from dual;

select abs(-15) from dual;

select sqrt(5) from dual;

select round(15.19,1) from dual;

select lower('IVAN BAYROSS') from dual;

select upper('ivan bayross') from dual;

select add_months(sysdate,5) from dual;

select months_between('02-Jun-01','02-Jan-01')"Months" from dual;

select to_char(sysdate,'DD-MM-YYYY') from dual;



Create EMP table:

create table EMP_tama(EMPNO Number(5) Primary Key,
check(EMPNO>=7000 and EMPNO<=8000),
ENAME Varchar2(10),
JOB Varchar2(10),
MGR Number(5) default NULL,
check(MGR>=7000 and MGR<=8000),
HIREDATE DATE,
SAL Number(6),
COMM Number(6) default 0,
check((COMM>0 and COMM<=1500 and JOB like 'Salesman')or(COMM=0 and JOB not like 'Salesman')),
DEPT_NAME Varchar2(10));


INSERTION:

insert into EMP_tama values(7001,'Avi','Manager',Null,'03-Jun-10',90000,0,'Database');

insert into EMP_tama values(7002,'Avik','Manager',Null,'03-Jan-11',80000,0,'HR');

insert into EMP_tama values(7003,'Avishek','Manager',Null,'09-Jul-11',90000,0,'CRM');

insert into EMP_tama values(7004,'Raj','Manager',Null,'28-Jun-10',50000,0,'ERP');

insert into EMP_tama values(7005,'Anki','DBA',7001,'03-Jun-12',70000,0,'Database');

insert into EMP_tama values(7006,'Sonal','Worker',7002,'30-Sep-13',10000,0,'HR');

insert into EMP_tama values(7007,'Anish','Salesman',7002,'20-Dec-14',50000,500,'HR');

insert into EMP_tama values(7008,'Anup','Salesman',7003,'03-Jun-15',9000,900,'CRM');

insert into EMP_tama values(7009,'Emily','Worker',7004,'30-Jun-14',8000,0,'ERP');

insert into EMP_tama values(7010,'Romi','Salesman',7004,'01-Jan-80',7000,700,'ERP');



QUERIES:

select ename from EMP_tama where ename like '_i%';

select ENAME from EMP_tama where JOB <> 'Manager';

select count(EMPNO) from EMP_tama where JOB like 'Manager';

select max(SAL) as "MAXIMUM",min(SAL) as "MINIMUM",sum(SAL) as "TOTAL",avg(SAL) as "AVERAGE" from EMP_tama;

select JOB,max(SAL) as "MAXIMUM",min(SAL) as "MINIMUM",sum(SAL) as "TOTAL",avg(SAL) as "AVERAGE" from EMP_tama group by JOB;

select count(EMPNO) as "Number of Managers" from EMP_tama where JOB like 'Manager';

select ename from EMP_tama where HIREDATE='01-Jan-1980';

 select ename from EMP_tama where SAL=(select max(SAL) from EMP_tama where JOB like 'Salesman';

 select ename from EMP_tama where SAL=(select min(SAL) from EMP_tama where JOB like 'Salesman';

select ename from EMP_tama where SAL>(select SAL from EMP_tama where ename like 'Turner');

select dept_name from EMP_tama where ENAME like 'FORD';

select dept_name from EMP_tama where SAL=(select max(SAL) from EMP_tama);



