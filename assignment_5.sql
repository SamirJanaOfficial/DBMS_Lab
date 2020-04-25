ASSIGNMENT - %

CREATION OF TABLE:

ZIPCODES TABLE:-
Create table Zipcodes(Zip Number(6) Primary Key,
City Varchar2(15));

EMPLOYEES TABLE:-
Create table Employees(Eno Number(3) Primary Key,
Ename Varchar2(25),
Zip Number(6) references Zipcodes(Zip) on delete cascade,
Hdate Date);

PARTS TABLE:-
Create table Parts(Pno Number(5) Primary Key,
Pname Varchar2(9),
Qoh Number(4),
Price Number(6),
Lvl Number(2));

CUSTOMERS TABLE:-
Create table Customers(Cno Number(3) Primary Key,
Cname varchar2(25),
Street Varchar2(30),
Zip Number(6) references Zipcodes(Zip) on delete cascade,
Phone Number(10));

ORDERS TABLE:-
Create table Orders(Ono Number(4) Primary Key,
Cno Number(3) references Customers(Cno) on delete cascade,
Eno Number(3) references Employees(Eno) on delete cascade,
Received Date,
Shipped Date);

ODETAILS TABLE:-
Create table Odetails(Ono Number(4) references Orders(Ono) on delete cascade,
Pno Number(5) references Parts(Pno) on delete cascade,
Qty Number(3));


INSERTION OF VALUES:

ZIPCODES TABLE:-
insert into Zipcodes values(700001,'Kolkata');
insert into Zipcodes values(711102,'Howrah');
insert into Zipcodes values(721122,'Hooghly');

EMPLOYEES TABLE:-
insert into Employees values(701,'George',700001,'12-Jan-2010');
insert into Employees values(703,'Fort Dodge',711102,'20-Dec-2012');
insert into Employees values(707,'Robert',721122,'07-Feb-2011');

PARTS TABLE:-
insert into Parts values(10600,'Mobile',100,65,10);
insert into Parts values(10601,'Cover',35,15,5);
insert into Parts values(10602,'Accessory',20,25,3);
insert into Parts values(10603,'Anklet',15,12,5);

CUSTOMERS TABLE:-
insert into Customers values(201,'Sonu','Atindra Mukhorjee Lane',711102,9874563210);
insert into Customers values(203,'Avi','Bhairav Dutta Lane',711102,9654123078);
insert into Customers values(204,'Subho','B.B Ganguly Street',700001,7894563210);
insert into Customers values(207,'Daisy','chitrakut Aprtmnt',721122,3210456987);

ORDERS TABLE:-
insert into Orders values(110,204,701,'04-Mar-17','17-Mar-17');
insert into Orders values(111,201,703,'10-Mar-17',NULL);
insert into Orders values(112,204,701,'12-Mar-17','16-Mar-17');
insert into Orders values(115,207,707,'15-Mar-17',NULL);

ODETAILS TABLE:-
insert into Odetails values(110,10602,3);
insert into Odetails values(115,10600,1);
insert into Odetails values(111,10603,2);
insert into Odetails values(112,10601,1);
insert into Odetails values(110,10600,1);


QUERIES:-

select Pno,Pname from Parts where Price<20;

select distinct(Pno) from Parts;

select * from Customers where Cname like 'S%';

select Ono,Cname from Orders,Customers where
Shipped is NULL and
Customers.Cno=Orders.Cno;





select Ename from Employees where Hdate like (select min(Hdate) from Employees);

select Pno,Pname,Price from Parts where Price>20 order by Pno;

