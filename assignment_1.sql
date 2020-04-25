Create employee table:
Create table EMP27(EMPNO Number(4),ENAME varchar2(20),JOB Varchar2(20),MGR Varchar2(10),HIREDATE Date,SAL Number(6),COMM Number(6),DEPTNO Number(2),PHONE Number(10));

Desc EMP27;

Insertion:
SQL> Insert into EMP27 values(1010,'Amit','Cleaner','Anki','01-May-81',10000,120,2,9745141451);

SQL> insert into EMP27 values(1012,'Anish','Sweeper','Ankit','01-Jun-80',12000,Null,2,9745141451);

SQL> insert into EMP27 values(7369,'Rudra','Singer','Tj','01-May-80',1000,Null,1,9745141451);

SQL> insert into EMP27 values(6369,'Rudranil','Typist','Tj','20-May-80',1200,150,3,9745141451);

SQL> insert into EMP27 values(2123,'Suvo','Dancer','Aman','10-May-80',10000,Null,1,9258741961);

SQL> insert into EMP27 values(4258,'Akash','Typist','Tj','25-May-85',12000,150,2,9789456121);

SQL> Insert into EMP27 values(1018,'Chandu','DBA','Anki','01-May-81',1000,1000,1,9874563210);
________________________________________________________________________________________



Display:
select * from EMP27;

Others:
select * from EMP27 where EMPNO=7369;
select * from EMP27 where HIREDATE='01-May-81';
select ENAME from EMP27 where SAL>1500;
select ENAME from EMP27 where COMM is NULL;
select * from EMP27 where ENAME like 'A%';
alter table EMP27 Modify JOB Char(20);
alter table EMP27 drop column PHONE;
