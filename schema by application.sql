-- SQL for schema: CRver3
-- Drop relationship tables
DROP TABLE Belong_to CASCADE CONSTRAINTS;


DROP TABLE Buy CASCADE CONSTRAINTS;


DROP TABLE Consist_of_CUSTOMER_SERVICE_EMPLOYEE CASCADE CONSTRAINTS;


DROP TABLE Consist_of_TECHNICAL_SERVICE_EMPLOYEE CASCADE CONSTRAINTS;


DROP TABLE Constrain CASCADE CONSTRAINTS;


DROP TABLE Cover CASCADE CONSTRAINTS;


DROP TABLE Maintain CASCADE CONSTRAINTS;


DROP TABLE Make CASCADE CONSTRAINTS;


DROP TABLE Provide CASCADE CONSTRAINTS;


DROP TABLE Validate CASCADE CONSTRAINTS;


-- Drop entity class tables
DROP TABLE ACCOUNTING_STAFF CASCADE CONSTRAINTS;


DROP TABLE CLIENTS CASCADE CONSTRAINTS;


DROP TABLE CONTENT CASCADE CONSTRAINTS;


DROP TABLE CONTRIBUTION CASCADE CONSTRAINTS;


DROP TABLE CUSTOMER_SERVICE_EMPLOYEE CASCADE CONSTRAINTS;


DROP TABLE CUSTOMER_SERVICE_TEAM CASCADE CONSTRAINTS;


DROP TABLE Field CASCADE CONSTRAINTS;


DROP TABLE KNOWLEDGE CASCADE CONSTRAINTS;


DROP TABLE KNOWLEDGE_DETAIL CASCADE CONSTRAINTS;


DROP TABLE KNOWLEDGE_NUGGET CASCADE CONSTRAINTS;


DROP TABLE LEARNING_GUIDE CASCADE CONSTRAINTS;


DROP TABLE OVERVIEW CASCADE CONSTRAINTS;


DROP TABLE PAYMENT CASCADE CONSTRAINTS;


DROP TABLE PPT CASCADE CONSTRAINTS;


DROP TABLE PROVIDERS CASCADE CONSTRAINTS;


DROP TABLE PROVIDER_ENGINEERS CASCADE CONSTRAINTS;


DROP TABLE SERVICE_DETAIL CASCADE CONSTRAINTS;


DROP TABLE TECHNICAL_SERVICE_EMPLOYEE CASCADE CONSTRAINTS;


DROP TABLE VENDOR_EMPLOYEES CASCADE CONSTRAINTS;


DROP TABLE VIDEO CASCADE CONSTRAINTS;


DROP TABLE WORK_SHEET CASCADE CONSTRAINTS;


-- Strong Entity Class
CREATE TABLE CLIENTS (
	Cname	Varchar(50),
	Email	Varchar(50),
	Scale	Varchar(50),
	CID	Varchar(50),
	CONSTRAINT CLIENTS_pk PRIMARY KEY(CID));

-- Strong Entity Class
CREATE TABLE Field (
	Fname	Varchar(50),
	FID	Varchar(50),
	CONSTRAINT Field_pk PRIMARY KEY(FID));

-- Strong Entity Class
CREATE TABLE KNOWLEDGE (
	Kname	Varchar(50),
	Total_fare	Varchar(50),
	KID	Varchar(50),
	CONSTRAINT KNOWLEDGE_pk PRIMARY KEY(KID));

-- Strong Entity Class
CREATE TABLE KNOWLEDGE_DETAIL (
	Duration	Varchar(50),
	EndDate	Varchar(50),
	Startdate	Varchar(50),
	cost	Varchar(50),
	KDID_	Varchar(50),
	CONSTRAINT KNOWLEDGE_DETAIL_pk PRIMARY KEY(KDID_));

-- Strong Entity Class
CREATE TABLE KNOWLEDGE_NUGGET (
	KNname	Varchar(50),
	path	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT KNOWLEDGE_NUGGET_pk PRIMARY KEY(KNID));

-- Multivalued Attribute of KNOWLEDGE_NUGGET
DROP TABLE KNOWLEDGE_NUGGET_Mature_Level CASCADE CONSTRAINTS;

CREATE TABLE KNOWLEDGE_NUGGET_Mature_Level (
	KNID	Varchar(50),
	KNOWLEDGE_NUGGET_Mature_Level	Varchar(50),
	CONSTRAINT KNOWLEDGE_NUGGET_Mature_Lev_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT KNOWLEDGE_NUGGET_Mature_Lev_pk PRIMARY KEY(KNID,KNOWLEDGE_NUGGET_Mature_Level));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE OVERVIEW (
	KNID	Varchar(50),
	CONSTRAINT OVERVIEW_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT OVERVIEW_pk PRIMARY KEY(KNID));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE PPT (
	Page	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT PPT_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT PPT_pk PRIMARY KEY(KNID));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE VIDEO (
	Length	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT VIDEO_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT VIDEO_pk PRIMARY KEY(KNID));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE WORK_SHEET (
	Rowcolumn	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT WORK_SHEET_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT WORK_SHEET_pk PRIMARY KEY(KNID));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE LEARNING_GUIDE (
	KNID	Varchar(50),
	CONSTRAINT LEARNING_GUIDE_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT LEARNING_GUIDE_pk PRIMARY KEY(KNID));

-- Subclass of KNOWLEDGE_NUGGET
CREATE TABLE CONTENT (
	KNID	Varchar(50),
	CONSTRAINT CONTENT_fk FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT CONTENT_pk PRIMARY KEY(KNID));

-- Strong Entity Class
CREATE TABLE PAYMENT (
	Endate	Varchar(50),
	Fee2provider	Varchar(50),
	Fee2vendor	Varchar(50),
	KID	Varchar(50),
	Paymode	Varchar(50),
	Startdate	Varchar(50),
	PID_	Varchar(50),
	CONSTRAINT PAYMENT_pk PRIMARY KEY(PID_));

-- Strong Entity Class
CREATE TABLE PROVIDERS (
	Pname	Varchar(50),
	PID	Varchar(50),
	CONSTRAINT PROVIDERS_pk PRIMARY KEY(PID));

-- Strong Entity Class
CREATE TABLE PROVIDER_ENGINEERS (
	FirstName	Varchar(50),
	LastName	Varchar(50),
	EID	Varchar(50),
	CONSTRAINT PROVIDER_ENGINEERS_pk PRIMARY KEY(EID));

-- Multivalued Attribute of PROVIDER_ENGINEERS
DROP TABLE PROVIDER_ENGINEERS_Email CASCADE CONSTRAINTS;

CREATE TABLE PROVIDER_ENGINEERS_Email (
	EID	Varchar(50),
	PROVIDER_ENGINEERS_Email	Varchar(50),
	CONSTRAINT PROVIDER_ENGINEERS_Email_fk FOREIGN KEY(EID) REFERENCES PROVIDER_ENGINEERS (EID),
	CONSTRAINT PROVIDER_ENGINEERS_Email_pk PRIMARY KEY(EID,PROVIDER_ENGINEERS_Email));

-- Strong Entity Class
CREATE TABLE VENDOR_EMPLOYEES (
	Contract_Time	Varchar(50),
	Salary	Varchar(50),
	name	Varchar(50),
	VEID_	Varchar(50),
	CONSTRAINT VENDOR_EMPLOYEES_pk PRIMARY KEY(VEID_));

-- Multivalued Attribute of VENDOR_EMPLOYEES
DROP TABLE VENDOR_EMPLOYEES_Email CASCADE CONSTRAINTS;

CREATE TABLE VENDOR_EMPLOYEES_Email (
	VEID_	Varchar(50),
	VENDOR_EMPLOYEES_Email	Varchar(50),
	CONSTRAINT VENDOR_EMPLOYEES_Email_fk FOREIGN KEY(VEID_) REFERENCES VENDOR_EMPLOYEES (VEID_),
	CONSTRAINT VENDOR_EMPLOYEES_Email_pk PRIMARY KEY(VEID_,VENDOR_EMPLOYEES_Email));

-- Subclass of VENDOR_EMPLOYEES
CREATE TABLE CUSTOMER_SERVICE_EMPLOYEE (
	VEID_	Varchar(50),
	CONSTRAINT CUSTOMER_SERVICE_EMPLOYEE_fk FOREIGN KEY(VEID_) REFERENCES VENDOR_EMPLOYEES (VEID_),
	CONSTRAINT CUSTOMER_SERVICE_EMPLOYEE_pk PRIMARY KEY(VEID_));

-- Subclass of VENDOR_EMPLOYEES
CREATE TABLE TECHNICAL_SERVICE_EMPLOYEE (
	VEID_	Varchar(50),
	CONSTRAINT TECHNICAL_SERVICE_EMPLOYEE_fk FOREIGN KEY(VEID_) REFERENCES VENDOR_EMPLOYEES (VEID_),
	CONSTRAINT TECHNICAL_SERVICE_EMPLOYEE_pk PRIMARY KEY(VEID_));

-- Subclass of VENDOR_EMPLOYEES
CREATE TABLE ACCOUNTING_STAFF (
	VEID_	Varchar(50),
	CONSTRAINT ACCOUNTING_STAFF_fk FOREIGN KEY(VEID_) REFERENCES VENDOR_EMPLOYEES (VEID_),
	CONSTRAINT ACCOUNTING_STAFF_pk PRIMARY KEY(VEID_));

-- Grouping Entity Class
CREATE TABLE CUSTOMER_SERVICE_TEAM (
	Server_level	Varchar(50),
	Standard_fare	Varchar(50),
	TID	Varchar(50),
	CONSTRAINT CUSTOMER_SERVICE_TEAM_pk PRIMARY KEY(TID));

-- Weak Entity Class
CREATE TABLE CONTRIBUTION (
	Weight_Value	Varchar(50),
	CID_	Varchar(50),
	KID	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT CONTRIBUTION_fk0 FOREIGN KEY(KID) REFERENCES KNOWLEDGE (KID),
	CONSTRAINT CONTRIBUTION_fk1 FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT CONTRIBUTION_pk PRIMARY KEY(CID_,KID,KNID));

-- Weak Entity Class
CREATE TABLE SERVICE_DETAIL (
	Price	Varchar(50),
	Server_type	Varchar(50),
	Date	Varchar(50),
	CID	Varchar(50),
	TID	Varchar(50),
	CONSTRAINT SERVICE_DETAIL_fk0 FOREIGN KEY(CID) REFERENCES CLIENTS (CID),
	CONSTRAINT SERVICE_DETAIL_fk1 FOREIGN KEY(TID) REFERENCES CUSTOMER_SERVICE_TEAM (TID),
	CONSTRAINT SERVICE_DETAIL_pk PRIMARY KEY(Date,CID,TID));


-- Base class for aggregate relationship Consist_of
CREATE TABLE Consist_of_CUSTOMER_SERVICE_EM
 (	VEID_	Varchar(50),
	TID	Varchar(50),
	CONSTRAINT Consist_of_CUSTOMER_SERVIC_fk0 FOREIGN KEY(VEID_) REFERENCES CUSTOMER_SERVICE_EMPLOYEE (VEID_),
	CONSTRAINT Consist_of_CUSTOMER_SERVIC_fk1 FOREIGN KEY(TID) REFERENCES CUSTOMER_SERVICE_TEAM (TID),
	CONSTRAINT Consist_of_CUSTOMER_SERVICE_pk PRIMARY KEY(VEID_,TID));

-- Retrieves the lock id
-- Must be an autonomous transaction since a commit is done when retrieving the id
CREATE OR REPLACE FUNCTION Get_Lock_Id(lock_name VARCHAR2) RETURN VARCHAR2 IS
PRAGMA AUTONOMOUS_TRANSACTION;
lock_id VARCHAR2(128);
BEGIN
  DBMS_LOCK.ALLOCATE_UNIQUE (lock_name,lock_id);
  RETURN lock_id;
END;
/

CREATE OR REPLACE PROCEDURE Request_Lock(lock_name VARCHAR2)
IS
lock_status INT;
BEGIN
  lock_status :=DBMS_LOCK.REQUEST(Get_Lock_Id(lock_name), DBMS_LOCK.X_MODE,DBMS_LOCK.MAXWAIT, TRUE);
  IF(lock_status NOT IN (0,4)) THEN
    Raise_Application_Error(-20000,'Unable to request lock '|| lock_name ||' DMBS_LOCK.REQUEST error code: '|| lock_status);
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE Release_Lock(lock_name VARCHAR2)
IS
lock_status INT;
BEGIN
  lock_status :=DBMS_LOCK.RELEASE(Get_Lock_Id(lock_name));
  IF(lock_status <> 0) THEN
    Raise_Application_Error(-20000,'Unable to release lock '|| lock_name ||' DMBS_LOCK.RELEASE error code '|| lock_status);
  END IF;
END;
/

-- Consist_of_CUSTOMER_SERVICE_EM Constraint Validation Table
DROP TABLE Consist_of_CUSTOMER_S_Validate CASCADE CONSTRAINTS;

CREATE TABLE Consist_of_CUSTOMER_S_Validate (
	VEID_	Varchar(50),
	TID	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_AG_Consist_of_CUSTOMER_S
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Consist_of_CUSTOMER_S_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-AG-PJ(Consist_of, CUSTOMER_SERVICE_EMPLOYEE) = [1, M]
    IF(check_min) THEN
      OPEN count_cur FOR 'SELECT COUNT(*) FROM Consist_of_CUSTOMER_SERVICE_EM WHERE TID = :0' USING mod_row.TID;
      FETCH count_cur INTO count_var;
      CLOSE count_cur;

      IF(count_var < 1) THEN
       raise_application_error (-20001, 'Projection constraint violated, CUSTOMER_SERVICE_EMPLOYEE must associate in Consist_of at least 1 time(s).');
      END IF;
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Consist_of_CUSTOME_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Consist_of_CUSTOMER_SERVICE_EM
BEGIN
  Request_Lock('Consist_of_CUSTOMER_SERVICE_EM');
  DELETE FROM Consist_of_CUSTOMER_S_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Consist_of_CUSTOMER__After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Consist_of_CUSTOMER_SERVICE_EM
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Consist_of_CUSTOMER_S_Validate VALUES(:new.VEID_,:new.TID,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Consist_of_CUSTOMER_S_Validate VALUES(:new.VEID_,:new.TID,NULL);
    INSERT INTO Consist_of_CUSTOMER_S_Validate VALUES(:old.VEID_,:old.TID,1);
  ELSE
    INSERT INTO Consist_of_CUSTOMER_S_Validate VALUES(:old.VEID_,:old.TID,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Consist_of_CUSTOMER_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Consist_of_CUSTOMER_SERVICE_EM
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_AG_Consist_of_CUSTOMER_S();
  Release_Lock('Consist_of_CUSTOMER_SERVICE_EM');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Consist_of_CUSTOMER_SERVICE_EM');
    RAISE;
END;
/


-- Base class for aggregate relationship Consist_of
CREATE TABLE Consist_of_TECHNICAL_SERVICE_E
 (	VEID_	Varchar(50),
	TID	Varchar(50),
	CONSTRAINT Consist_of_TECHNICAL_SERVI_fk0 FOREIGN KEY(TID) REFERENCES CUSTOMER_SERVICE_TEAM (TID),
	CONSTRAINT Consist_of_TECHNICAL_SERVI_fk1 FOREIGN KEY(VEID_) REFERENCES TECHNICAL_SERVICE_EMPLOYEE (VEID_),
	CONSTRAINT Consist_of_TECHNICAL_SERVIC_pk PRIMARY KEY(VEID_,TID));

-- Consist_of_TECHNICAL_SERVICE_E Constraint Validation Table
DROP TABLE Consist_of_TECHNICAL__Validate CASCADE CONSTRAINTS;

CREATE TABLE Consist_of_TECHNICAL__Validate (
	VEID_	Varchar(50),
	TID	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_AG_Consist_of_TECHNICAL_
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Consist_of_TECHNICAL__Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-AG-PJ(Consist_of, TECHNICAL_SERVICE_EMPLOYEE) = [1, M]
    IF(check_min) THEN
      OPEN count_cur FOR 'SELECT COUNT(*) FROM Consist_of_TECHNICAL_SERVICE_E WHERE TID = :0' USING mod_row.TID;
      FETCH count_cur INTO count_var;
      CLOSE count_cur;

      IF(count_var < 1) THEN
       raise_application_error (-20001, 'Projection constraint violated, TECHNICAL_SERVICE_EMPLOYEE must associate in Consist_of at least 1 time(s).');
      END IF;
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Consist_of_TECHNIC_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Consist_of_TECHNICAL_SERVICE_E
BEGIN
  Request_Lock('Consist_of_TECHNICAL_SERVICE_E');
  DELETE FROM Consist_of_TECHNICAL__Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Consist_of_TECHNICAL_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Consist_of_TECHNICAL_SERVICE_E
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Consist_of_TECHNICAL__Validate VALUES(:new.VEID_,:new.TID,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Consist_of_TECHNICAL__Validate VALUES(:new.VEID_,:new.TID,NULL);
    INSERT INTO Consist_of_TECHNICAL__Validate VALUES(:old.VEID_,:old.TID,1);
  ELSE
    INSERT INTO Consist_of_TECHNICAL__Validate VALUES(:old.VEID_,:old.TID,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Consist_of_TECHNICA_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Consist_of_TECHNICAL_SERVICE_E
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_AG_Consist_of_TECHNICAL_();
  Release_Lock('Consist_of_TECHNICAL_SERVICE_E');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Consist_of_TECHNICAL_SERVICE_E');
    RAISE;
END;
/

-- Binary Many to Many Interaction Relationship
CREATE TABLE Belong_to (
	PID	Varchar(50),
	EID	Varchar(50),
	CONSTRAINT Belong_to_fk0 FOREIGN KEY(PID) REFERENCES PROVIDERS (PID),
	CONSTRAINT Belong_to_fk1 FOREIGN KEY(EID) REFERENCES PROVIDER_ENGINEERS (EID),
	CONSTRAINT Belong_to_pk PRIMARY KEY(PID,EID));

-- Binary Many to Many Interaction Relationship
CREATE TABLE Buy (
	CID	Varchar(50),
	KID	Varchar(50),
	CONSTRAINT Buy_fk0 FOREIGN KEY(CID) REFERENCES CLIENTS (CID),
	CONSTRAINT Buy_fk1 FOREIGN KEY(KID) REFERENCES KNOWLEDGE (KID),
	CONSTRAINT Buy_pk PRIMARY KEY(CID,KID));

-- Binary One to Many or One to One Interaction Relationship
CREATE OR REPLACE SYNONYM Constrain FOR KNOWLEDGE_DETAIL;

ALTER TABLE KNOWLEDGE_DETAIL ADD (
	Constrain_KID	Varchar(50));


ALTER TABLE KNOWLEDGE_DETAIL ADD 	CONSTRAINT Constrain_fk FOREIGN KEY(Constrain_KID) REFERENCES KNOWLEDGE (KID);


-- Constrain Constraint Validation Table
DROP TABLE Constrain_Validate CASCADE CONSTRAINTS;

CREATE TABLE Constrain_Validate (
	KDID_	Varchar(50),
	Constrain_KID	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_R_Constrain
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Constrain_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-R-PT(Constrain,KNOWLEDGE) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Constrain WHERE Constrain_KID= :0' USING mod_row.Constrain_KID;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE must participate in Constrain at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE must participate in Constrain at most 1 time(s).');
    END IF;

    -- Card-R-PT(Constrain,KNOWLEDGE_DETAIL) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Constrain WHERE KDID_= :0' USING mod_row.KDID_;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE_DETAIL must participate in Constrain at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE_DETAIL must participate in Constrain at most 1 time(s).');
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Constrain_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Constrain
BEGIN
  Request_Lock('Constrain');
  DELETE FROM Constrain_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Constrain_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Constrain
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Constrain_Validate VALUES(:new.KDID_,:new.Constrain_KID,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Constrain_Validate VALUES(:new.KDID_,:new.Constrain_KID,NULL);
    INSERT INTO Constrain_Validate VALUES(:old.KDID_,:old.Constrain_KID,1);
  ELSE
    INSERT INTO Constrain_Validate VALUES(:old.KDID_,:old.Constrain_KID,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Constrain_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Constrain
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_R_Constrain();
  Release_Lock('Constrain');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Constrain');
    RAISE;
END;
/

-- Binary Many to Many Interaction Relationship
CREATE TABLE Cover (
	FID	Varchar(50),
	KNID	Varchar(50),
	CONSTRAINT Cover_fk0 FOREIGN KEY(FID) REFERENCES Field (FID),
	CONSTRAINT Cover_fk1 FOREIGN KEY(KNID) REFERENCES KNOWLEDGE_NUGGET (KNID),
	CONSTRAINT Cover_pk PRIMARY KEY(FID,KNID));

-- Binary One to Many or One to One Interaction Relationship
CREATE OR REPLACE SYNONYM Maintain FOR KNOWLEDGE;

ALTER TABLE KNOWLEDGE ADD (
	Maintain_VEID_	Varchar(50));


ALTER TABLE KNOWLEDGE ADD 	CONSTRAINT Maintain_fk FOREIGN KEY(Maintain_VEID_) REFERENCES TECHNICAL_SERVICE_EMPLOYEE (VEID_);


-- Maintain Constraint Validation Table
DROP TABLE Maintain_Validate CASCADE CONSTRAINTS;

CREATE TABLE Maintain_Validate (
	KID	Varchar(50),
	Maintain_VEID_	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_R_Maintain
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Maintain_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-R-PT(Maintain,KNOWLEDGE) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Maintain WHERE KID= :0' USING mod_row.KID;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE must participate in Maintain at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE must participate in Maintain at most 1 time(s).');
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Maintain_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Maintain
BEGIN
  Request_Lock('Maintain');
  DELETE FROM Maintain_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Maintain_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Maintain
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Maintain_Validate VALUES(:new.KID,:new.Maintain_VEID_,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Maintain_Validate VALUES(:new.KID,:new.Maintain_VEID_,NULL);
    INSERT INTO Maintain_Validate VALUES(:old.KID,:old.Maintain_VEID_,1);
  ELSE
    INSERT INTO Maintain_Validate VALUES(:old.KID,:old.Maintain_VEID_,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Maintain_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Maintain
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_R_Maintain();
  Release_Lock('Maintain');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Maintain');
    RAISE;
END;
/

-- Binary One to Many or One to One Interaction Relationship
CREATE OR REPLACE SYNONYM Make FOR PAYMENT;

ALTER TABLE PAYMENT ADD (
	Make_CID	Varchar(50));


ALTER TABLE PAYMENT ADD 	CONSTRAINT Make_fk FOREIGN KEY(Make_CID) REFERENCES CLIENTS (CID);


-- Make Constraint Validation Table
DROP TABLE Make_Validate CASCADE CONSTRAINTS;

CREATE TABLE Make_Validate (
	PID_	Varchar(50),
	Make_CID	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_R_Make
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Make_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-R-PT(Make,PAYMENT) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Make WHERE PID_= :0' USING mod_row.PID_;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, PAYMENT must participate in Make at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, PAYMENT must participate in Make at most 1 time(s).');
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Make_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Make
BEGIN
  Request_Lock('Make');
  DELETE FROM Make_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Make_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Make
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Make_Validate VALUES(:new.PID_,:new.Make_CID,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Make_Validate VALUES(:new.PID_,:new.Make_CID,NULL);
    INSERT INTO Make_Validate VALUES(:old.PID_,:old.Make_CID,1);
  ELSE
    INSERT INTO Make_Validate VALUES(:old.PID_,:old.Make_CID,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Make_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Make
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_R_Make();
  Release_Lock('Make');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Make');
    RAISE;
END;
/

-- Binary One to Many or One to One Interaction Relationship
CREATE OR REPLACE SYNONYM Provide FOR KNOWLEDGE_NUGGET;

ALTER TABLE KNOWLEDGE_NUGGET ADD (
	Provide_PID	Varchar(50));


ALTER TABLE KNOWLEDGE_NUGGET ADD 	CONSTRAINT Provide_fk FOREIGN KEY(Provide_PID) REFERENCES PROVIDERS (PID);


-- Provide Constraint Validation Table
DROP TABLE Provide_Validate CASCADE CONSTRAINTS;

CREATE TABLE Provide_Validate (
	KNID	Varchar(50),
	Provide_PID	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_R_Provide
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Provide_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-R-PT(Provide,PROVIDERS) = [1,M]
    IF(check_min) THEN
      OPEN count_cur FOR 'SELECT COUNT(*) FROM Provide WHERE Provide_PID= :0' USING mod_row.Provide_PID;
      FETCH count_cur INTO count_var;
      CLOSE count_cur;

      IF(count_var < 1) THEN
       raise_application_error (-20001, 'Participation constraint violated, PROVIDERS must participate in Provide at least 1 time(s).');
      END IF;
    END IF;

    -- Card-R-PT(Provide,KNOWLEDGE_NUGGET) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Provide WHERE KNID= :0' USING mod_row.KNID;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE_NUGGET must participate in Provide at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, KNOWLEDGE_NUGGET must participate in Provide at most 1 time(s).');
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Provide_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Provide
BEGIN
  Request_Lock('Provide');
  DELETE FROM Provide_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Provide_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Provide
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Provide_Validate VALUES(:new.KNID,:new.Provide_PID,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Provide_Validate VALUES(:new.KNID,:new.Provide_PID,NULL);
    INSERT INTO Provide_Validate VALUES(:old.KNID,:old.Provide_PID,1);
  ELSE
    INSERT INTO Provide_Validate VALUES(:old.KNID,:old.Provide_PID,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Provide_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Provide
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_R_Provide();
  Release_Lock('Provide');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Provide');
    RAISE;
END;
/

-- Binary One to Many or One to One Interaction Relationship
CREATE OR REPLACE SYNONYM Validate FOR PAYMENT;

ALTER TABLE PAYMENT ADD (
	Validate_VEID_	Varchar(50));


ALTER TABLE PAYMENT ADD 	CONSTRAINT Validate_fk FOREIGN KEY(Validate_VEID_) REFERENCES ACCOUNTING_STAFF (VEID_);


-- Validate Constraint Validation Table
DROP TABLE Validate_Validate CASCADE CONSTRAINTS;

CREATE TABLE Validate_Validate (
	PID_	Varchar(50),
	Validate_VEID_	Varchar(50),
	IsOld	Numeric(1));


-- Checks every non set level constraint on the relation
CREATE OR REPLACE PROCEDURE Check_R_Validate
IS
check_min BOOLEAN;
check_max BOOLEAN;
count_var INTEGER;
CURSOR mod_row_cur IS
SELECT * FROM Validate_Validate;
TYPE CountCur IS REF CURSOR;
count_cur CountCur;

BEGIN
  FOR mod_row IN mod_row_cur
  LOOP
    IF (mod_row.IsOld IS NOT NULL) THEN
      check_min := TRUE;
      check_max := FALSE;
    ELSE
      check_min := FALSE;
      check_max := TRUE;
    END IF;

    -- Card-R-PT(Validate,PAYMENT) = [1,1]
    OPEN count_cur FOR 'SELECT COUNT(*) FROM Validate WHERE PID_= :0' USING mod_row.PID_;
    FETCH count_cur INTO count_var;
    CLOSE count_cur;

    IF(check_min AND count_var < 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, PAYMENT must participate in Validate at least 1 time(s).');
    END IF;

    IF(check_max AND count_var > 1) THEN
     raise_application_error (-20001, 'Participation constraint violated, PAYMENT must participate in Validate at most 1 time(s).');
    END IF;
  END LOOP;
END;
/

-- Before Modify Statement Trigger
CREATE OR REPLACE TRIGGER Validate_Before_Stmt
BEFORE INSERT OR UPDATE OR DELETE
ON Validate
BEGIN
  Request_Lock('Validate');
  DELETE FROM Validate_Validate;
END;
/

-- After Modify Row Trigger
CREATE OR REPLACE TRIGGER Validate_After_Row
AFTER INSERT OR UPDATE OR DELETE
ON Validate
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO Validate_Validate VALUES(:new.PID_,:new.Validate_VEID_,NULL);
  ELSIF UPDATING THEN
    INSERT INTO Validate_Validate VALUES(:new.PID_,:new.Validate_VEID_,NULL);
    INSERT INTO Validate_Validate VALUES(:old.PID_,:old.Validate_VEID_,1);
  ELSE
    INSERT INTO Validate_Validate VALUES(:old.PID_,:old.Validate_VEID_,1);
  END IF;
END;
/

-- After Modify Trigger
CREATE OR REPLACE TRIGGER Validate_After_Stmt
AFTER INSERT OR UPDATE OR DELETE
ON Validate
DECLARE
event_type CHAR;
constraint_ex EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_ex, -20001);
BEGIN
  Check_R_Validate();
  Release_Lock('Validate');
EXCEPTION
  WHEN constraint_ex THEN
    Release_Lock('Validate');
    RAISE;
END;
/

