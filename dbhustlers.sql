

/*
Clients
*/
Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('BOWEN','LIU','DOUBIGONGSI','Small',1234567890,'bowenliu@gmail.com');
Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('Zonia','Tufts','ABC Inc.','Small',5209987676,'zoniatufts@gmail.com');
Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('Bibi','Cromwell','CBA Inc.','Medium',5209987678,'bibicrow@gmail.com');
Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('Vannesa','Stamp','EFN Inc.','Medium',5207654432,'vannesastamp@gmail.com');
Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('Erick','Sansom','IUO Inc.','Large',5209985456,'ericksansom@gmail.com');

/*
Knowledge
*/
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-DEC-2014','02-DEC-2019','Enterprise Database Management',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-Nov-2014','02-DEC-2018','Networking and Communication',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-OCT-2014','02-DEC-2017','Business Communication',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-SEP-2014','02-DEC-2016','Business Intelligence',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-AUG-2014','02-DEC-2015','Human Resource',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-Jul-2014','02-DEC-2015','Administration Management',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-Jun-2014','02-DEC-2015','Operationg Management',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-May-2014','02-DEC-2015','Supply Chain Management',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-APR-2014','02-DEC-2015','IT Foundation',0,0);
insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-Mar-2014','02-DEC-2015','Marketing',0,0);
/*
VEmployees
*/

INSERT INTO VEmployees Values('VE001','2', 'Princess', 'Lamy', '10000', 5206578843, 'princesslamy@knolwedgevault.com');
INSERT INTO VEmployees Values('VE002','3', 'Al', 'Heal', '20000', 5208873476, 'alheal@knolwedgevault.com');
INSERT INTO VEmployees Values('VE003','4', 'Neida', 'Farner', '30000', 5208897705, 'neidafarner@knolwedgevault.com');
INSERT INTO VEmployees Values('VE004','5', 'Craig', 'Butkovich', '40000', 5207762106, 'craigbutkovich@knolwedgevault.com');
INSERT INTO VEmployees Values('VE005','6', 'Marylynn', 'Johnson', '50000', 5208864403, 'marylynnjohnson@knolwedgevault.com');

INSERT INTO Accountants Values('VE001');
INSERT INTO Accountants Values('VE004');

INSERT INTO Servicemen Values('VE002');
INSERT INTO Servicemen Values('VE003');

/*
Payments
*/
INSERT INTO payments(PAYMODE,STARTDATE,ENDDATE,kid,VEID,CID) VALUES('Cash','01-JAN-2015','01-JAN-2019','K110','VE001','C109');
INSERT INTO payments(PAYMODE,STARTDATE,ENDDATE,kid,VEID,CID) VALUES('Cheque','01-Jun-2015','01-JAN-2018','K115','VE004','C113');
INSERT INTO payments(PAYMODE,STARTDATE,ENDDATE,kid,VEID,CID) VALUES('Credit Card','01-JAN-2015','01-JAN-2019','K113','VE001','C111');
select * from knowledge;
select * from clients;
select * from payments;
