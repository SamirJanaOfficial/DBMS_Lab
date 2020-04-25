create table EMP_15(EMPNO number,
					ENAME varchar2(10),
					JOB char(15),
					MGR number,
					HIREDATE date,
					SAL number,
					COMM number,
					DEPT_NAME number);
insert into EMP_15 values(&EMPNO,'&ENAME','&JOB',&MGR,'&HIREDATE',&SAL,&COMM,&DEPTNO);

#1
select ENAME from EMP_15 where SAL = (select max(SAL) from EMP_15);
#2
select ENAME from EMP_15 where SAL = (select max(SAL) from EMP_15 where JOB = 'Salesman');
#3
select ENAME from EMP_15 where SAL = (select min(SAL) from EMP_15 where JOB = 'Clerk');
#4
select DEPT_NAME from EMP_15 having avg(SAL) = (
	select max(AVG) from (
	select DEPT_NAME ,avg(SAL) as "AVG" from EMP_15 group by DEPT_NAME)) group by DEPT_NAME;
#5
select ENAME from EMP_15 where SAL > (select SAL from EMP_15 where ENAME = 'Turner');
#6
select ENAME from EMP_15 where HIREDATE > (select HIREDATE from EMP_15 where ENAME = 'Allen');
#7
select DEPT_NAME from EMP_15 where ENAME = 'Ford';
#8
select DEPT_NAME from EMP_15 where SAL = (select max(SAL) from EMP_15);
#9
select LOC from DEPT_15 where DEPTNO = (select DEPT_NAME from EMP_15 where ENAME = 'Smith');
#10
select LOC from DEPT_15 where DEPTNO in (select DEPT_NAME from EMP_15 where JOB = 'Manager');
#11
select SAL from EMP_15 where ENAME='Martin';
#12
select ENAME from EMP_15 where SAL > (
	select max(SAL) from EMP_15 where DEPT_NAME in (
	select DEPTNO from DEPT_15 where LOC = 'Dallas'));
#13
select DEPT_NAME from EMP_15 having count(*) = 0 group by DEPT_NAME;
#14
select ENAME from EMP_15 where HIREDATE = (select HIREDATE from EMP_15 where ENAME = 'Adams');
#15
select distinct DEPT_NAME from EMP_15 where COMM <> 0;
#16
select ENAME, SAL from EMP_15 where SAL in (select min(SAL) from EMP_15 group by DEPT_NAME);