BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'AccountName2');
INSERT INTO "Account" VALUES(2,'AccountName1');
CREATE TABLE "Campaign" (
	id INTEGER NOT NULL, 
	"IsActive" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"Status" VARCHAR(255), 
	"StartDate" VARCHAR(255), 
	"EndDate" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Campaign" VALUES(1,'True','One Campaign','Conference','Planned','1899-12-09','1899-12-10','a description of this campaign','');
INSERT INTO "Campaign" VALUES(2,'True','Second Campaign','Conference','Planned','1899-12-09','1899-12-10','a description of this campaign','');
INSERT INTO "Campaign" VALUES(3,'True','Third Campaign','Conference','Planned','1899-12-09','1899-12-10','a description of this campaign','');
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Birthdate" VARCHAR(255), 
	"Title" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'First4','Last','1851-12-22','Secretary','1');
INSERT INTO "Contact" VALUES(2,'First5','Last','1851-12-22','Chief People Person','1');
INSERT INTO "Contact" VALUES(3,'NotA','Manager','','Machinist','2');
INSERT INTO "Contact" VALUES(4,'A','Manager','','Manager of Data','2');
INSERT INTO "Contact" VALUES(5,'First2','Last','1851-12-22','Manager of People','2');
INSERT INTO "Contact" VALUES(6,'First1','Last','1851-12-22','Chief Beans Officer','2');
INSERT INTO "Contact" VALUES(7,'King','Shah','','Chief Executive King','2');
CREATE TABLE "DashboardTarget__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Auto_Update__c" VARCHAR(255), 
	"Target__c" VARCHAR(255), 
	"Object_API_Name__c" VARCHAR(255), 
	"SOQL_WHERE_clause__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "DashboardTarget__c" VALUES(1,'Chiefs','True','','Contact','Title LIKE ''%Chief%''','record with a value in the SOQL Query field');
INSERT INTO "DashboardTarget__c" VALUES(2,'Managers','True','','Contact','(Title LIKE ''%Chief%'' OR Title LIKE ''%Manager%'')','record with a value in the SOQL Query field. All contacts that are management level (C-suite or "manager" in title.)');
INSERT INTO "DashboardTarget__c" VALUES(3,'Target1','False','7.0','','','a random record to have something to look at in the org');
INSERT INTO "DashboardTarget__c" VALUES(4,'Target2 with SOQL','True','','Contact','LastName = ''Last''','record with a value in the SOQL Query field');
INSERT INTO "DashboardTarget__c" VALUES(5,'All Contacts in DB','True','','Contact','LastName !=''''','record with a value in the SOQL Query field. All contacts.');
CREATE TABLE "Opportunity" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"CloseDate" VARCHAR(255), 
	"Amount" VARCHAR(255), 
	"StageName" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Opportunity" VALUES(1,'An Oppty on AccountName','1900-01-01','50.0','Closed Won','1');
INSERT INTO "Opportunity" VALUES(2,'An Oppty on AccountName','1900-01-01','50.0','Closed Won','2');
COMMIT;
