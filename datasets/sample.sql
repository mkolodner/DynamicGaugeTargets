BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'AccountName');
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
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Birthdate" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'First1','Last','1851-12-22','2');
INSERT INTO "Contact" VALUES(2,'First2','Last','1851-12-22','1');
CREATE TABLE "DashboardTarget__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"SOQL_Query__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "DashboardTarget__c" VALUES(1,'Target1','a random record to have something to look at in the org','');
INSERT INTO "DashboardTarget__c" VALUES(2,'Target2 with SOQL','record with a value in the SOQL Query field','SELECT Id from Contact WHERE LastName = ''Last''');
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
COMMIT;
