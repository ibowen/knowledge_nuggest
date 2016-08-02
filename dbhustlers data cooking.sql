--1.For table Payments, buy, provider_revenue
--Before insert into Payments, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE payment_seq 
  INCREMENT BY 1 
  START WITH 1000 
  MAXVALUE 9999;
Drop table provider_revenue;
Create table provider_revenue(
PAYID		Varchar2(20), -- paymentID
NID Varchar2(20),
PAYDATE	Date,
CONSTRAINT provider_revenue_pk PRIMARY KEY(PAYID,NID)
); 

create or replace trigger makepay
  before insert 
  on payments
  for each row
declare
Cursor C1 is select nid from contributions where kid = :new.kid;
begin
  SELECT 'P' || to_char(payment_seq.nextval) INTO :new.PID FROM dual;
  INSERT INTO BUY VALUES(:new.cid,:new.kid);
  select price - totalcost into :new.fee2vendor from knowledge where kid = :new.kid;
  select totalcost into :new.fee2provider from knowledge where kid = :new.kid;
  FOR res in C1 LOOP
  insert into provider_revenue values(:new.PID,res.nid,:new.startdate);
  END LOOP;
end;

--Sample:insert 
--INSERT INTO payments(PAYMODE,STARTDATE,ENDDATE,kid,VEID,CID) VALUES('Cash','01-JAN-2015','01-JAN-2019','K001','VE001','C001');


--2. For table client
--Before insert into Payments, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE client_seq 
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger add_client
  before insert 
  on clients
  for each row
declare
begin
  SELECT 'C' || to_char(client_seq.nextval) INTO :new.CID FROM dual;
end;

--Sample:insert 
--Insert into clients(FNAME,LNAME,CNAME,CMPSIZE,PHONE,EMAIL) VALUES('BOWEN','LIU','DOUBIGONGSI','Small',1234567890,'bowenliu@gmail.com');


--3. For table knowledge:

--Before insert into knowledges, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE knowledge_seq 
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger add_knowledge
  before insert 
  on knowledge
  for each row
declare
begin
  SELECT 'K' || to_char(knowledge_seq.nextval) INTO :new.KID FROM dual;
end;

--Sample:insert
--insert into knowledge(STARTDATE,ENDDATE,NAME,price,totalcost) VALUES ('02-DEC-2014','02-DEC-2019','Knowledge1',0,0);
--
--the totalcoset and price will update automaticlly when you insert data into contribution!
--
--
--4.For table provider
 
--Before insert into provider, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE provider_seq 
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger add_provider
before insert 
  on providers
  for each row
declare
begin
  SELECT 'P' || to_char(provider_seq.nextval) INTO :new.PID FROM dual;
end;
--Sample insert
--insert into providers(NAME) values('Provider1');
--
--5. For table nugget
--Before insert into nugget, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE nugget_seq 
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger add_nuggets
before insert 
  on nuggets
  for each row
declare
begin
  SELECT 'N' || to_char(nugget_seq.nextval) INTO :new.NID FROM dual;
end;

--Sample insert
--insert into nuggets(NAME,PATH,PID,COST) values('Nuggets11','xxxx','P100',1000);
--
--6.For maturity and nuggetsize table, do it yourself!!!
--
--7.For table Fields
--Before insert into Fields, please frist run the script of creating table, trigger and sequence below:

CREATE SEQUENCE fields_seq 
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger add_fields
before insert 
  on fields
  for each row
declare
begin
  SELECT 'F' || to_char(fields_seq.nextval) INTO :new.FID FROM dual;
end;
--Sample insert
--insert into FIELDS(INDUSTRY, DEPARTMENT) values('IT','MANAGER');
--
--8.For Cover table, do it yourself!!!
--
--9.For table contribution
--Before insert into contribution, please frist run the script of creating table, trigger and sequence below:

ALTER TABLE CONTRIBUTIONS DROP(weight);
ALTER TABLE CONTRIBUTIONS ADD(weight NUMBER(5,2));

CREATE SEQUENCE contribution_seq
  INCREMENT BY 1 
  START WITH 100 
  MAXVALUE 999;

create or replace trigger recal_weight_insert
  before insert 
  on contributions
  for each row
declare
  pre_rec number(10,0);
  temp_totalcost knowledge.totalcost%type;
  temp_cost nuggets.cost%type;
  cursor_cost nuggets.cost%type;
  cursor c1 is select kid, nid
               from contributions 
               where kid = :new.kid 
               for update of weight;    
begin
  SELECT 'CON' || to_char(fields_seq.nextval) INTO :new.CID FROM dual;
  select count(*) into pre_rec from buy where kid = :new.kid;
  if (pre_rec = 0) 
    then
     raise_application_error('-20001','An transction already made, please create a new knowledge');
    rollback;
  end if;
  select totalcost into temp_totalcost from knowledge where kid = :new.kid;
  select cost into temp_cost from nuggets where nid = :new.nid;
  temp_totalcost:= temp_totalcost + temp_cost;
  for rec in c1 loop 
      select cost
      into cursor_cost
      from nuggets
      where nid = rec.nid;
      update contributions set weight = cursor_cost/temp_totalcost*100 where current of C1;
    end loop;  
    :new.weight := temp_cost/temp_totalcost *100;
    update knowledge set totalcost = temp_totalcost where kid = :new.kid;  
    update knowledge set price = temp_totalcost*1.2 where kid = :new.kid;
    exception 
    when no_data_found then 
    :new.weight := 100;
    update knowledge set totalcost = temp_totalcost where kid = :new.kid;  
    update knowledge set price = temp_totalcost*1.2 where kid = :new.kid;
end;

--Sample insert
--insert into contributions(KID,NID,WEIGHT) values('K001','N0011',0); NOTE:KID and NID should be inputed in advance!!!!
