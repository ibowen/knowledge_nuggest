-- SQL for schema: 007 
-- 20 Entity tables + 2 multivalue tables + 4 relational tables
-- Drop relationship tables
DROP TABLE Buy CASCADE CONSTRAINTS;
DROP TABLE Cover CASCADE CONSTRAINTS;
DROP TABLE Form_Salesmen CASCADE CONSTRAINTS;
DROP TABLE Form_Servicemen CASCADE CONSTRAINTS;

-- Drop Multivalue tables
DROP TABLE Nugget_Maturity CASCADE CONSTRAINTS;
DROP TABLE Nugget_Size CASCADE CONSTRAINTS;

-- Drop entity class tables
DROP TABLE Accountants CASCADE CONSTRAINTS;
DROP TABLE Contents CASCADE CONSTRAINTS;
DROP TABLE Contributions CASCADE CONSTRAINTS;
DROP TABLE Clients CASCADE CONSTRAINTS;
DROP TABLE Fields CASCADE CONSTRAINTS;
DROP TABLE Guide CASCADE CONSTRAINTS;
DROP TABLE Knowledge CASCADE CONSTRAINTS;
DROP TABLE Leads CASCADE CONSTRAINTS;
DROP TABLE Nuggets CASCADE CONSTRAINTS;
DROP TABLE Overview CASCADE CONSTRAINTS;
DROP TABLE PPT CASCADE CONSTRAINTS;
DROP TABLE Payments CASCADE CONSTRAINTS;
DROP TABLE Providers CASCADE CONSTRAINTS;
DROP TABLE Salesmen CASCADE CONSTRAINTS;
DROP TABLE Service_Detail CASCADE CONSTRAINTS;
DROP TABLE Service_Team CASCADE CONSTRAINTS;
DROP TABLE Servicemen CASCADE CONSTRAINTS;
DROP TABLE VEmployees CASCADE CONSTRAINTS;
DROP TABLE Video CASCADE CONSTRAINTS;
DROP TABLE Worksheet CASCADE CONSTRAINTS;

-- Strong Entity Class
CREATE TABLE Clients (
	CID	    Varchar2(20),
	FName	Varchar2(20) NOT NULL,
	LName	Varchar2(20) NOT NULL,
	Cname   Varchar2(50) NOT NULL,
	CmpSize	Varchar2(10),
	Phone	Number(10) NOT NULL,
	Email	Varchar2(50) NOT NULL,
	CONSTRAINT Clients_pk PRIMARY KEY(CID),
	CONSTRAINT check_CmpSize CHECK (CmpSize IN ('Small','Medium','Large'))
);

-- Strong Entity Class for all vendor employees
CREATE TABLE VEmployees (
	VEID	Varchar2(20),
	ContractTime	Number(2) NOT NULL,
	FName	Varchar2(20) NOT NULL,
	LName	Varchar2(20) NOT NULL,
	Salary	Number(10) NOT NULL,
	Phone	Number(10) NOT NULL UNIQUE,
	Email	Varchar2(50) NOT NULL UNIQUE,
	CONSTRAINT VEmployees_pk PRIMARY KEY(VEID)
);

-- Subclass of VEmployees
CREATE TABLE Salesmen (
	VEID	Varchar2(20),
	CONSTRAINT Salesmen_fk FOREIGN KEY(VEID) REFERENCES VEmployees (VEID),
	CONSTRAINT Salesmen_pk PRIMARY KEY(VEID)
);

-- Subclass of VEmployees
CREATE TABLE Servicemen (
	VEID	Varchar2(20),
	CONSTRAINT Servicemen_fk FOREIGN KEY(VEID) REFERENCES VEmployees (VEID),
	CONSTRAINT Servicemen_pk PRIMARY KEY(VEID)
);

-- Subclass of VEmployees
CREATE TABLE Accountants (
	VEID	Varchar2(20),
	CONSTRAINT Accountants_fk FOREIGN KEY(VEID) REFERENCES VEmployees (VEID),
	CONSTRAINT Accountants_pk PRIMARY KEY(VEID)
);

-- Grouping Entity Class
CREATE TABLE Service_Team (
	TID		Varchar2(20),
	Name  	Varchar2(20) NOT NULL,
	CONSTRAINT Service_Team_pk PRIMARY KEY(TID)
);

-- Strong Entity Class
CREATE TABLE Providers (
	PID		Varchar2(20),
	Name	Varchar2(50) NOT NULL,
	CONSTRAINT Providers_pk PRIMARY KEY(PID)
);
-- Strong Entity Class
CREATE TABLE Leads (
	LID		Varchar2(20),
	PID 	Varchar2(20),
	FName	Varchar2(20) NOT NULL,
	LName	Varchar2(20) NOT NULL,
	Phone	Number(10) 	NOT NULL UNIQUE,
	Email	Varchar(50) NOT NULL UNIQUE,
	CONSTRAINT Leads_pk PRIMARY KEY(LID),
	CONSTRAINT Leads_fk FOREIGN KEY(PID) REFERENCES Providers (PID)
);

-- Strong Entity Class
CREATE TABLE Nuggets (
	NID		Varchar2(20),
	Name	Varchar2(20) NOT NULL,
	Path	Varchar2(50) NOT NULL,
	PID     Varchar2(20) NOT NULL,
	Cost    Number(10) NOT NULL,
	CONSTRAINT Nuggets_pk PRIMARY KEY(NID),
	CONSTRAINT Nuggets_fk FOREIGN KEY(PID) REFERENCES Providers (PID)
);
-- Strong Entity Class
CREATE TABLE Fields (
	FID	Varchar2(20),
	Industry	Varchar2(20) NOT NULL,
	Department	Varchar2(20) NOT NULL,
	CONSTRAINT Fields_pk PRIMARY KEY(FID)
);
-- Multivalued Attribute of Nuggets
CREATE TABLE Nugget_Maturity (
	NID			Varchar2(20),
	Maturity	Number(1),
	CONSTRAINT Maturity_fk FOREIGN KEY(NID) REFERENCES Nuggets(NID),
	CONSTRAINT Maturity_pk PRIMARY KEY(NID,Maturity),
	CONSTRAINT check_maturity CHECK (Maturity BETWEEN 1 AND 5)
);
-- Multivalued Attribute of Nuggets
CREATE TABLE Nugget_Size (
	NID			Varchar2(20),
	NuggetSize		Number(1),
	CONSTRAINT Nugget_Size_fk FOREIGN KEY(NID) REFERENCES Nuggets(NID),
	CONSTRAINT Nugget_Size_pk PRIMARY KEY(NID,NuggetSize),
	CONSTRAINT check_NuggetSize CHECK (NuggetSize BETWEEN 1 AND 5)
);
-- Subclass of Nuggets
CREATE TABLE Overview (
	NID	Varchar2(20),
	CONSTRAINT Overview_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Overview_pk PRIMARY KEY(NID)
);
-- Subclass of Nuggets
CREATE TABLE PPT (
	NID	Varchar2(20),
	CONSTRAINT PPT_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT PPT_pk PRIMARY KEY(NID)
);
-- Subclass of Nuggets
CREATE TABLE Video (
	NID	Varchar2(20),
	CONSTRAINT Video_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Video_pk PRIMARY KEY(NID)
);
-- Subclass of Nuggets
CREATE TABLE Worksheet (
	NID	Varchar2(20),
	CONSTRAINT Worksheet_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Worksheet_pk PRIMARY KEY(NID)
);
-- Subclass of Nuggets
CREATE TABLE Guide (
	NID	Varchar2(20),
	CONSTRAINT Guide_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Guide_pk PRIMARY KEY(NID)
);
-- Subclass of Nuggets
CREATE TABLE Contents (
	NID	Varchar2(20),
	CONSTRAINT Contents_fk FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Contents_pk PRIMARY KEY(NID)
);

-- Strong Entity Class
CREATE TABLE Knowledge (
	KID			Varchar2(20),
	VEID 		Varchar2(20),
	Startdate	DATE NOT NULL,
	Enddate		DATE NOT NULL,
	Price		Number(10,2) NOT NULL,
	TotalCost	Number(10,2) NOT NULL,
	Name		Varchar2(30) NOT NULL,
	CONSTRAINT Knowledge_pk PRIMARY KEY(KID),
	CONSTRAINT Knowledge_fk FOREIGN KEY(VEID) REFERENCES Servicemen(VEID)
);

-- Strong Entity Class
CREATE TABLE Payments (
	PID			Varchar2(20),
	Paymode		Varchar2(20),
	Startdate	Date NOT NULL,
	Enddate		Date NOT NULL,
	Fee2provider	Number(10,2) NOT NULL,
	Fee2vendor		Number(10,2) NOT NULL,
	KID			Varchar2(20),
	VEID		Varchar2(20),
	CID 		Varchar2(20),
	CONSTRAINT Payments_pk PRIMARY KEY(PID),
	CONSTRAINT Payments_fk0 FOREIGN KEY(KID) REFERENCES Knowledge (KID),
	CONSTRAINT Payments_fk1 FOREIGN KEY(VEID) REFERENCES Accountants (VEID),
	CONSTRAINT Payments_fk2 FOREIGN KEY(CID) REFERENCES Clients (CID),
	CONSTRAINT check_paymode CHECK (Paymode IN ('Cheque','Cash','Credit Card'))
);

----------------------------All Weak Classes--------------------------------
-- Weak Entity Class
CREATE TABLE Contributions (
	CID		Varchar2(20),
	KID		Varchar2(20),
	NID		Varchar2(20),
	Weight	Number(2) NOT NULL,
	CONSTRAINT Contributions_fk0 FOREIGN KEY(KID) REFERENCES Knowledge (KID),
	CONSTRAINT Contributions_fk1 FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Contributions_pk PRIMARY KEY(CID,KID,NID)
);

-- Weak Entity Class
CREATE TABLE Service_Detail (
	CID			Varchar2(20),
	TID			Varchar2(20),
	Servicedate	Date,
	Serivcetype		Number(1),
	Fare		Number(10,2) NOT NULL,
	Description		Varchar2(100) NOT NULL,
	CONSTRAINT Service_Detail_fk0 FOREIGN KEY(CID) REFERENCES Clients (CID),
	CONSTRAINT Service_Detail_fk1 FOREIGN KEY(TID) REFERENCES Service_Team (TID),
	CONSTRAINT Service_Detail_pk PRIMARY KEY(CID,TID,Servicedate),
	CONSTRAINT check_servicetype CHECK (Serivcetype BETWEEN 1 AND 5)
);


-- Base class for aggregate relationship Form
CREATE TABLE Form_Salesmen(	
	VEID	Varchar2(20),
	TID		Varchar2(20),
	CONSTRAINT Form_Salesmen_fk0 FOREIGN KEY(VEID) REFERENCES Salesmen (VEID),
	CONSTRAINT Form_Salesmen_fk1 FOREIGN KEY(TID) REFERENCES Service_Team (TID),
	CONSTRAINT Form_Salesmen_pk PRIMARY KEY(VEID,TID)
);

-- Base class for aggregate relationship Form
CREATE TABLE Form_Servicemen(	
	VEID	Varchar2(20),
	TID		Varchar2(20),
	CONSTRAINT Form_Servicemen_fk0 FOREIGN KEY(VEID) REFERENCES Servicemen (VEID),
	CONSTRAINT Form_Servicemen_fk1 FOREIGN KEY(TID) REFERENCES Service_Team (TID),
	CONSTRAINT Form_Servicemen_pk PRIMARY KEY(VEID,TID)
);

-- Binary Many to Many Interaction Relationship
CREATE TABLE Buy (
	CID	Varchar2(20),
	KID	Varchar2(20),
	CONSTRAINT Buy_fk0 FOREIGN KEY(CID) REFERENCES Clients (CID),
	CONSTRAINT Buy_fk1 FOREIGN KEY(KID) REFERENCES Knowledge (KID),
	CONSTRAINT Buy_pk PRIMARY KEY(CID,KID)
);

-- Binary Many to Many Interaction Relationship
CREATE TABLE Cover (
	FID	Varchar2(20),
	NID	Varchar2(20),
	CONSTRAINT Cover_fk0 FOREIGN KEY(FID) REFERENCES Fields (FID),
	CONSTRAINT Cover_fk1 FOREIGN KEY(NID) REFERENCES Nuggets (NID),
	CONSTRAINT Cover_pk PRIMARY KEY(FID,NID)
);
/

