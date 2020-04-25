ASSIGNMENT-4

CREATION OF TABLES:
SAILORS TABLE:-

create table SAILORS_40(S_id Number(5) Primary Key,
S_name Varchar2(20),
Rating Number(3),
Age Number(3));

BOATS TABLE:-

create table BOATS(B_id Number(5) Primary Key,
B_name Varchar2(20),
Color Varchar2(10));

RESERVES TABLE:-

create table RESERVES(S_id Number(5),
B_id Number(5) references BOATS(B_id),
Day Varchar2(10),
constraint c8 Primary Key(S_id,B_id),
constraint c6 Foreign Key (S_id) references SAILORS(S_id) on delete cascade);

TEACHER TABLE:-

create table TEACHER(T_id Number(2) Primary Key,
Name Varchar2(30),
Dept Varchar2(20));

SUBJECT TABLE:-

create table SUBJECT(Subno Number(3) Primary Key,
Subtitle Varchar2(40));

TAUGHTBY TABLE:-

create table TAUGHTBY(T_id Number(2) references TEACHER(T_id),
Subno Number(3) references SUBJECT(Subno),
Constraint c9 Primary Key(T_id,Subno));

STUDENT TABLE:-

create table STUDENT(Rollno Number(2) Primary Key,
Sname Varchar2(40),
City Varchar2(25));


INSERTION OF VALUES:
SAILORS TABLE:-

insert into SAILORS_40 values(10,'Tarun',10,25);
insert into SAILORS_40 values(20,'Anex',9,27);
insert into SAILORS_40 values(30,'Apple',7,65);
BOATS TABLE:-

insert into BOATS values(101,'Vina','Red');
insert into BOATS values(102,'Pix','Green');
insert into BOATS values(103,'Xer','Blue');

RESERVES TABLE:-

insert into RESERVES values(10,101,'Monday');
insert into RESERVES values(20,103,'Tuesday');
insert into RESERVES values(30,102,'Wednesday');
insert into RESERVES values(20,102,'Monday');

TEACHER TABLE:-

insert into TEACHER values(001,'DC','CSE');
insert into TEACHER values(002,'SoM','Physics');
insert into TEACHER values(003,'AT','Physics');

SUBJECT TABLE:-

insert into SUBJECT values(101,'DBMS');
insert into SUBJECT values(102,'Thermodynamics');

TAUGHTBY TABLE:-

insert into TAUGHTBY values(001,101);
insert into TAUGHTBY values(002,102);

STUDENT TABLE:-

insert into STUDENT values(21,'Vish','Kolkata');
insert into STUDENT values(23,'Siso','Kolkata');
insert into STUDENT values(30,'Pihu','Spain ');
insert into STUDENT values(32,'Anki','Kolkata');


QUERIES:


select color from BOATS,SAILORS,RESERVES where S_name like 'Tarun' and SAILORS.S_id=RESERVES.S_id and BOATS.B_id=RESERVES.B_id;

select S_id,S_name from SAILORS where 'Monday' IN(select day from RESERVES where SAILORS.S_id=RESERVES.S_id);

select B_id,B_name from BOATS where Color IN('Red','Green');

delete from SAILORS where AGE>60;

select Name from Teacher,Subject,Taughtby 
where Teacher.Dept like 'Physics' and 
Subject.Subtitle like 'Thermodynamics' and
Teacher.T_id=Taughtby.T_id and
Subject.Subno=Taughtby.Subno;

update Subject set Subtitle='RDBMS' where Subtitle='DBMS';

select * from Student where City like 'Kolkata' and Rollno>19 and Rollno<26;

select * from Student where City like 'Kolkata' order by Rollno desc;
