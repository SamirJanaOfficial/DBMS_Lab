CREATION  :

1. Create
CLIENT_MASTER TABLE:

create table CLIENT_MASTER2728(CLIENTNO varchar2(6) Primary Key,
check(CLIENTNO like 'C%'),
NAME Varchar2(20) Not Null,
ADDRESS1 Varchar2(30),
ADDRESS2 varchar2(30),
CITY Varchar2(15),
PINCODE Number(8),
STATE Varchar2(15),
BALDUE Number(10,2));

PRODUCT_MASTER TABLE:

create table PRODUCT_MASTER2728(PRODUCTNO Varchar2(6) Primary Key,
check(PRODUCTNO like 'P%'),
DESCRIPTION Varchar2(15) Not Null,
PROFITPERCENT Number(4,2) Not Null,
UNITMEASURE Varchar2(10) Not Null,
QTYONHAND Number(8) Not Null,
REORDERLVL Number(8) Not Null,
SELLPRICE Number(8,2) Not Null,
check(SELLPRICE>0),
COSTPRICE Number(8,2) Not Null,
check(COSTPRICE>0));

SALESMAN_MASTER TABLE:

create table SALESMAN_MASTER2728(SALESMANNO varchar2(6) Primary Key,
check(SALESMANNO like 'S%'),
SALESMANNAME Varchar2(20) Not Null,
ADDRESS1 Varchar2(30) Not Null,
ADDRESS2 Varchar2(30),
CITY Varchar2(20),
PINCODE Number(8),
STATE Varchar2(20),
SALAMT Number(8,2) Not Null,
check(SALAMT>0),
TGTTOGET Number(6,2) Not Null,
check(TGTTOGET>0),
YTDSALES Number(6,2) Not Null,
REMARKS Varchar2(60));

SALES_ORDER TABLE:

create table SALES_ORDER2728(ORDERNO Varchar2(6) Primary Key,
check(ORDERNO like 'O%'),
CLIENTNO Varchar2(6) references CLIENT_MASTER2728(CLIENTNO),
ORDERDATE Date Not Null,
DELYADDR Varchar2(25),
SALESMANNO Varchar2(6) references SALESMAN_MASTER2728(SALESMANNO),
DELYTYPE char(1) default 'F',
check(DELYTYPE in ('P','F')),
BILLYN Char(1),
DELYDATE Date,
check(DELYDATE>ORDERDATE),
ORDERSTATUS Varchar2(10),
check(ORDERSTATUS in ('In Process','Fulfilled','BackOrder','Cancelled')));

SALES_ORDER_DETAILS TABLE:

create table SALES_ORDER_DETAILS2728(ORDERNO Varchar2(6) references SALES_ORDER2728(ORDERNO),
PRODUCTNO Varchar(6) references PRODUCT_MASTER2728(PRODUCTNO),
QTYORDERED Number(8),
QTYDISP Number(8),
PRODUCTRATE Number(10,2));



INSERTION:

CLIENT_MASTER Table:

Insert into CLIENT_MASTER2728 values('C00001','Ivan Bayross',NULL,NULL,'Mumbai',400054,'Maharashtra',15000);

Insert into CLIENT_MASTER2728 values('C00002','Mamta Muzumdar',NULL,NULL,'Madras',780001,'Tamil Nadu',0);

Insert into CLIENT_MASTER2728 values('C00003','Chhaya Bankar',NULL,NULL,'Mumbai',400057,'Maharashta',5000);

Insert into CLIENT_MASTER2728 values('C00004','Ashwini Joshi',NULL,NULL,'Bangalore',560001,'Karnataka',0);

Insert into CLIENT_MASTER2728 values('C00005','Hansel Colaco',NULL,NULL,'Mumbai',400060,'Maharashta',2000);

Insert into CLIENT_MASTER2728 values('C00006','Deepak Sharma',NULL,NULL,'Mangalore',560050,'Karnataka',0);




PRODUCT_MASTER TABLE:

Insert into PRODUCT_MASTER2728 values('P00001','T-Shirts',5,'Piece',200,50,350,250);

Insert into PRODUCT_MASTER2728 values('P0345','Shirts',6,'Piece',150,50,500,350);

Insert into PRODUCT_MASTER2728 values('P06734','Cotton Jeans',5,'Piece',100,20,600,450);

Insert into PRODUCT_MASTER2728 values('P07865','Jeans',5,'Piece',100,20,750,500);

Insert into PRODUCT_MASTER2728 values('P07868','Trousers',2,'Piece',150,50,850,550);

Insert into PRODUCT_MASTER2728 values('P07885','Pull Overs',2.5,'Piece',80,30,700,450);

Insert into PRODUCT_MASTER2728 values('P07965','Denim Shirts',4,'Piece',100,40,350,250);

Insert into PRODUCT_MASTER2728 values('P07975','Lycra Tops',5,'Piece',70,30,300,175);

Insert into PRODUCT_MASTER2728 values('P08865','Skirts',5,'Piece',75,30,450,300);



SALESMAN_MASTER TABLE:

Insert into SALESMAN_MASTER2728 values('S00001','Aman','A/14','Worli','Mumbai',400002,'Maharashtra',3000,100,50,'Good');

Insert into SALESMAN_MASTER2728 values('S00002','Omkar','65','Nariman','Mumbai',400001,'Maharashtra',3000,200,100,'Good');

Insert into SALESMAN_MASTER2728 values('S00003','Raj','P-7','Bandra','Mumbai',400032,'Maharashtra',3000,200,100,'Good');

Insert into SALESMAN_MASTER2728 values('S00004','Ashish','A/5','Juhu','Mumbai',400044,'Maharashtra',3500,200,150,'Good');




SALES_ORDER TABLE:

Insert into SALES_ORDER2728 values('O19001','C00001','20-Jul-02',NULL,'S00001','F','N','12-Jun-04','In Process');

Insert into SALES_ORDER2728 values('O19002','C00002','27-Jun-02',NULL,'S00002','P','N','25-Jun-04','Cancelled');

Insert into SALES_ORDER2728 values('O46865','C00003','20-Feb-02',NULL,'S00003','F','Y','18-Feb-04','Fulfilled');

Insert into SALES_ORDER2728 values('O19003','C00001','07-Apr-02',NULL,'S00001','F','Y','03-Apr-04','Fulfilled');

Insert into SALES_ORDER2728 values('O46866','C00004','22-May-02',NULL,'S00002','P','N','20-May-04','Cancelled');

Insert into SALES_ORDER2728 values('O19008','C00005','26-Jul-02',NULL,'S00004','F','N','24-May-04','In Process');






SALES_ORDER_DETAILS TABLE:

Insert into SALES_ORDER_DETAILS2728 values('O19001','P00001',4,4,525);

Insert into SALES_ORDER_DETAILS2728 values('O19001','P07965',2,1,8400);

Insert into SALES_ORDER_DETAILS2728 values('O19001','P07885',2,1,5250);

Insert into SALES_ORDER_DETAILS2728 values('O19002','P00001',10,0,525);

Insert into SALES_ORDER_DETAILS2728 values('O46865','P07868',3,3,3150);

Insert into SALES_ORDER_DETAILS2728 values('O46865','P07885',3,1,5250);

Insert into SALES_ORDER_DETAILS2728 values('O46865','P00001',10,10,525);

Insert into SALES_ORDER_DETAILS2728 values('O46865','P0345',4,4,1050);

/////     Insert into SALES_ORDER_DETAILS2728 values('O19003','P03453',2,2,1050);

Insert into SALES_ORDER_DETAILS2728 values('O19003','P06734',1,1,12000);

Insert into SALES_ORDER_DETAILS2728 values('O46866','P07965',1,0,8400);

Insert into SALES_ORDER_DETAILS2728 values('O46866','P07975',1,0,1050);

Insert into SALES_ORDER_DETAILS2728 values('O19008','P00001',10,5,525);

Insert into SALES_ORDER_DETAILS2728 values('O19008','P07975',5,3,1050);



SQL> select name from client_master2728 where client_master2728.name like '_a%';

NAME
--------------------
Mamta Muzumdar
Hansel Colaco

SQL> select city from client_master2728 where client_master2728.city like '_a%';

CITY
---------------
Madras
Bangalore
Mangalore

SQL> select city from client_master2728 where client_master2728.city like 'bombay'or 'delhi'
select city from client_master2728 where client_master2728.city like 'bombay'or 'delhi'
                                                                                      *
ERROR at line 1:
ORA-00920: invalid relational operator


SQL> select city from client_master2728 where client_master2728.city = 'bombay'or client_mas

no rows selected

SQL> select city from client_master2728 where client_master2728.city = 'mumbai'or client_mas

no rows selected

SQL> select city from client_master2728 where client_master2728.city = 'Mumbai' or client_ma

CITY
---------------
Mumbai
Mumbai
Mumbai

SQL> select * from client_master2728 where bal_due>10000;
select * from client_master2728 where bal_due>10000
                                      *
ERROR at line 1:
ORA-00904: "BAL_DUE": invalid identifier


SQL> select * from client_master2728 where clent_master2728.bal_due>10000;
select * from client_master2728 where clent_master2728.bal_due>10000
                                      *
ERROR at line 1:
ORA-00904: "CLENT_MASTER2728"."BAL_DUE": invalid identifier


SQL> select * from client_master2728 where client_master2728.bal_due>10000;
select * from client_master2728 where client_master2728.bal_due>10000
                                      *
ERROR at line 1:
ORA-00904: "CLIENT_MASTER2728"."BAL_DUE": invalid identifier


SQL> select name from client_master2728 where client_master2728.bal_due>10000;
select name from client_master2728 where client_master2728.bal_due>10000
                                         *
ERROR at line 1:
ORA-00904: "CLIENT_MASTER2728"."BAL_DUE": invalid identifier


SQL> select name from client_master2728 where client_master2728.baldue>10000;

NAME
--------------------
Ivan Bayross

SQL> desc sales_order2728;
 Name
 -------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------
 ORDERNO
 CLIENTNO
 ORDERDATE
 DELYADDR
 SALESMANNO
 DELYTYPE
 BILLYN
 DELYDATE
 ORDERSTATUS

SQL> select * from sales_order2728 where orderdate > TO_DATE('31-MAY-04','dd-MON-yy') and or

no rows selected

SQL> select * from sales_order2728 where orderdate > TO_DATE('31-05-04','dd-mm-yy') and orde

no rows selected

SQL> select * from sales_order2728 where orderdate between TO_DATE('31-05-04','dd-mm-yy') an

no rows selected

SQL> select * from sales_order2728 where orderdate between TO_DATE('31-MAY-04','dd-MON-yy')

no rows selected

SQL> select * from sales_order2728;

ORDERN CLIENT ORDERDATE DELYADDR                  SALESM D B DELYDATE  ORDERSTATU
------ ------ --------- ------------------------- ------ - - --------- ----------
O19001 C00001 20-JUL-02                           S00001 F N 12-JUN-04 In Process
O19002 C00002 27-JUN-02                           S00002 P N 25-JUN-04 Cancelled
O46865 C00003 20-FEB-02                           S00003 F Y 18-FEB-04 Fulfilled
O19003 C00001 07-APR-02                           S00001 F Y 03-APR-04 Fulfilled
O46866 C00004 22-MAY-02                           S00002 P N 20-MAY-04 Cancelled
O19008 C00005 26-JUL-02                           S00004 F N 24-MAY-04 In Process

6 rows selected.

SQL> select * from sales_order2728 where orderdate between TO_DATE('31-MAY-02','dd-MON-yy')

ORDERN CLIENT ORDERDATE DELYADDR                  SALESM D B DELYDATE  ORDERSTATU
------ ------ --------- ------------------------- ------ - - --------- ----------
O19002 C00002 27-JUN-02                           S00002 P N 25-JUN-04 Cancelled

SQL> select * from sales_order2728 where client_no = 'C00001' and client_no = 'C000002';
select * from sales_order2728 where client_no = 'C00001' and client_no = 'C000002'
                                                             *
ERROR at line 1:
ORA-00904: "CLIENT_NO": invalid identifier


SQL> select * from sales_order2728 where clientno = 'C00001' and clientno = 'C000002';

no rows selected

SQL> select * from sales_order2728 where clientno = 'C00001' and clientno = 'C00002';

no rows selected

SQL> select * from sales_order2728 where clientno = 'C00001'or clientno = 'C00002';

ORDERN CLIENT ORDERDATE DELYADDR                  SALESM D B DELYDATE  ORDERSTATU
------ ------ --------- ------------------------- ------ - - --------- ----------
O19001 C00001 20-JUL-02                           S00001 F N 12-JUN-04 In Process
O19002 C00002 27-JUN-02                           S00002 P N 25-JUN-04 Cancelled
O19003 C00001 07-APR-02                           S00001 F Y 03-APR-04 Fulfilled

SQL> select * from product_master2728 where sellprice>350 and sellprice<850;

PRODUC DESCRIPTION     PROFITPERCENT UNITMEASUR  QTYONHAND REORDERLVL  SELLPRICE  COSTPRICE
------ --------------- ------------- ---------- ---------- ---------- ---------- ----------
P0345  Shirts                      6 Piece             150         50        500        350
P06734 Cotton Jeans                5 Piece             100         20        600        450
P07865 Jeans                       5 Piece             100         20        750        500
P07885 Pull Overs                2.5 Piece              80         30        700        450
P08865 Skirts                      5 Piece              75         30        450        300

SQL> update PRODUCT_MASTER2728 set sellprice=sellprice*0.15 where sellprice>350;

6 rows updated.

SQL> select * from product_master2728;

PRODUC DESCRIPTION     PROFITPERCENT UNITMEASUR  QTYONHAND REORDERLVL  SELLPRICE  COSTPRICE
------ --------------- ------------- ---------- ---------- ---------- ---------- ----------
P00001 T-Shirts                    5 Piece             200         50        350        250
P0345  Shirts                      6 Piece             150         50         75        350
P06734 Cotton Jeans                5 Piece             100         20         90        450
P07865 Jeans                       5 Piece             100         20      112.5        500
P07868 Trousers                    2 Piece             150         50      127.5        550
P07885 Pull Overs                2.5 Piece              80         30        105        450
P07965 Denim Shirts                4 Piece             100         40        350        250
P07975 Lycra Tops                  5 Piece              70         30        300        175
P08865 Skirts                      5 Piece              75         30       67.5        300

9 rows selected.

SQL>select NAME,CITY,STATE from CLIENT_MASTER2728 where state not in 'Karnataka';

NAME                 CITY            STATE
-------------------- --------------- ---------------
Ivan Bayross         Mumbai          Maharashtra
Mamta Muzumdar       Madras          Tamil Nadu
Chhaya Bankar        Mumbai          Maharashta
Hansel Colaco        Mumbai          Maharashta

SQL> select count(*) from sales_order2728;

  COUNT(*)
----------
         6

SQL> select avg(sellprice) from sales_order2728;
select avg(sellprice) from sales_order2728
           *
ERROR at line 1:
ORA-00904: "SELLPRICE": invalid identifier


SQL> select avg(sellprice) from product_master2728;

AVG(SELLPRICE)
--------------
    175.277778


SQL> ALTER TABLE product_master2728
  2  RENAME COLUMN sellprice TO newprice;

Table altered.

SQL> select * from product_master2728;

PRODUC DESCRIPTION     PROFITPERCENT UNITMEASUR  QTYONHAND REORDERLVL   NEWPRICE  COSTPRICE
------ --------------- ------------- ---------- ---------- ---------- ---------- ----------
P00001 T-Shirts                    5 Piece             200         50        350        250
P0345  Shirts                      6 Piece             150         50         75        350
P06734 Cotton Jeans                5 Piece             100         20         90        450
P07865 Jeans                       5 Piece             100         20      112.5        500
P07868 Trousers                    2 Piece             150         50      127.5        550
P07885 Pull Overs                2.5 Piece              80         30        105        450
P07965 Denim Shirts                4 Piece             100         40        350        250
P07975 Lycra Tops                  5 Piece              70         30        300        175
P08865 Skirts                      5 Piece              75         30       67.5        300

9 rows selected.



SQL> select max(newprice) as max_price, min(newprice) as min_price from product_master2728;

 MAX_PRICE  MIN_PRICE
---------- ----------
       350       67.5



SQL> select count(*) from product_master2728 where costprice>250;

  COUNT(*)
----------
         6
SQL> select * from product_master2728 where qtyonhand>reorderlvl;

PRODUC DESCRIPTION     PROFITPERCENT UNITMEASUR  QTYONHAND REORDERLVL   NEWPRICE  COSTPRICE
------ --------------- ------------- ---------- ---------- ---------- ---------- ----------
P00001 T-Shirts                    5 Piece             200         50        350        250
P0345  Shirts                      6 Piece             150         50         75        350
P06734 Cotton Jeans                5 Piece             100         20         90        450
P07865 Jeans                       5 Piece             100         20      112.5        500
P07868 Trousers                    2 Piece             150         50      127.5        550
P07885 Pull Overs                2.5 Piece              80         30        105        450
P07965 Denim Shirts                4 Piece             100         40        350        250
P07975 Lycra Tops                  5 Piece              70         30        300        175
P08865 Skirts                      5 Piece              75         30       67.5        300

9 rows selected.

SQL> select * from product_master2728 where qtyonhand>reorderlvl*3;

PRODUC DESCRIPTION     PROFITPERCENT UNITMEASUR  QTYONHAND REORDERLVL   NEWPRICE  COSTPRICE
------ --------------- ------------- ---------- ---------- ---------- ---------- ----------
P00001 T-Shirts                    5 Piece             200         50        350        250
P06734 Cotton Jeans                5 Piece             100         20         90        450
P07865 Jeans                       5 Piece             100         20      112.5        500



SQL> select extract (DAY FROM sales_order2728.orderdate), orderno from sales_order2728;

EXTRACT(DAYFROMSALES_ORDER2728.ORDERDATE) ORDERN
----------------------------------------- ------
                                       20 O19001
                                       27 O19002
                                       20 O46865
                                        7 O19003
                                       22 O46866
                                       26 O19008

6 rows selected.

SQL> select extract (DAY FROM sales_order2728.orderdate) as order_day, orderno from sales_order2728;

 ORDER_DAY ORDERN
---------- ------
        20 O19001
        27 O19002
        20 O46865
         7 O19003
        22 O46866
        26 O19008

6 rows selected.
