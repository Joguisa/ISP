--CREATE DATABASE ISP_DB;

--USE ISP_DB;

CREATE TABLE [userstatus] (
  [statusid] VARCHAR(3) PRIMARY KEY NOT NULL,
  [description] VARCHAR(50) NOT NULL
);

CREATE TABLE [device] (
  [deviceid] INTEGER PRIMARY KEY NOT NULL,
  [devicename] VARCHAR(50) NOT NULL,
  [service_serviceid] INTEGER NOT NULL
);

CREATE TABLE [service] (
  [serviceid] INTEGER PRIMARY KEY NOT NULL,
  [servicename] VARCHAR(100) NOT NULL,
  [servicedescription] VARCHAR(150) NOT NULL,
  [price] VARCHAR(10) NOT NULL
);

CREATE TABLE [contract] (
  [contractid] INTEGER PRIMARY KEY NOT NULL,
  [startdate] DATETIME2 NOT NULL,
  [enddate] DATETIME2 NOT NULL,
  [statuscontract_statusid] VARCHAR(3) NOT NULL,
  [methodpayment_methodpaymentid] INTEGER NOT NULL,
  [service_serviceid] INTEGER NOT NULL,
  [client_clientid] INTEGER NOT NULL
);

CREATE TABLE [statuscontract] (
  [statusid] VARCHAR(3) PRIMARY KEY NOT NULL,
  [description] VARCHAR(50) NOT NULL
);

CREATE TABLE [methodpayment] (
  [methodpaymentid] INTEGER PRIMARY KEY NOT NULL,
  [description] VARCHAR(50) NOT NULL
);

CREATE TABLE [user] (
  [userid] INTEGER PRIMARY KEY NOT NULL,
  [username] VARCHAR(50) NOT NULL,
  [email] VARCHAR(100) NOT NULL,
  [password] VARCHAR(100) NOT NULL,
  [rol_rolid] INTEGER NOT NULL,
  [creationdate] DATETIME2 NOT NULL,
  [usercreate] INTEGER NOT NULL,
  [userapproval] INTEGER NOT NULL,
  [dateapproval] DATETIME2 NOT NULL,
  [userstatus_statusid] VARCHAR(3) NOT NULL
);

CREATE TABLE [rol] (
  [rolid] INTEGER PRIMARY KEY NOT NULL,
  [rolname] VARCHAR(50) NOT NULL
);

CREATE TABLE [usercash] (
  [user_userid] INTEGER NOT NULL,
  [cash_cashid] INTEGER NOT NULL,
  PRIMARY KEY (user_userid, cash_cashid)
);

CREATE TABLE [cash] (
  [cashid] INTEGER PRIMARY KEY NOT NULL,
  [cashdescription] VARCHAR(50) NOT NULL,
  [active] VARCHAR(1) NOT NULL
);

CREATE TABLE [turn] (
  [turnid] INTEGER PRIMARY KEY NOT NULL,
  [description] VARCHAR(7) NOT NULL,
  [date] DATETIME2 NOT NULL,
  [cash_cashid] INTEGER NOT NULL,
  [usergestorid] INTEGER NOT NULL
);

CREATE TABLE [client] (
  [clientid] INTEGER PRIMARY KEY NOT NULL,
  [clientname] VARCHAR(50) NOT NULL,
  [lastname] VARCHAR(50) NOT NULL,
  [identification] VARCHAR(13) NOT NULL,
  [email] VARCHAR(120) NOT NULL,
  [phonenumber] VARCHAR(13) NOT NULL,
  [address] VARCHAR(100) NOT NULL,
  [referenceaddress] VARCHAR(100) NOT NULL
);

CREATE TABLE [payments] (
  [paymentid] INTEGER PRIMARY KEY NOT NULL,
  [paymentdate] DATETIME2 NOT NULL,
  [client_clientid] INTEGER NOT NULL,
  [turn_cash_cashid] INTEGER NOT NULL
);

CREATE TABLE [attention] (
  [attentionid] INTEGER PRIMARY KEY NOT NULL,
  [turn_turnid] INTEGER NOT NULL,
  [client_clientid] INTEGER NOT NULL,
  [attentiontype_attentiontypeid] VARCHAR(3) NOT NULL,
  [attentionstatus_statusid] INTEGER NOT NULL
);

CREATE TABLE [attentiontype] (
  [attentiontypeid] VARCHAR(3) PRIMARY KEY NOT NULL,
  [description] VARCHAR(100) NOT NULL
);

CREATE TABLE [attentionstatus] (
  [statusid] INTEGER PRIMARY KEY NOT NULL,
  [description] VARCHAR(30) NOT NULL
);

ALTER TABLE [device] ADD FOREIGN KEY ([service_serviceid]) REFERENCES [service] ([serviceid]);

ALTER TABLE [contract] ADD FOREIGN KEY ([statuscontract_statusid]) REFERENCES [statuscontract] ([statusid]);

ALTER TABLE [contract] ADD FOREIGN KEY ([methodpayment_methodpaymentid]) REFERENCES [methodpayment] ([methodpaymentid]);

ALTER TABLE [contract] ADD FOREIGN KEY ([service_serviceid]) REFERENCES [service] ([serviceid]);

ALTER TABLE [contract] ADD FOREIGN KEY ([client_clientid]) REFERENCES [client] ([clientid]);

ALTER TABLE [user] ADD FOREIGN KEY ([rol_rolid]) REFERENCES [rol] ([rolid]);

ALTER TABLE [user] ADD FOREIGN KEY ([userstatus_statusid]) REFERENCES [userstatus] ([statusid]);

ALTER TABLE [usercash] ADD FOREIGN KEY ([user_userid]) REFERENCES [user] ([userid]);

ALTER TABLE [usercash] ADD FOREIGN KEY ([cash_cashid]) REFERENCES [cash] ([cashid]);

ALTER TABLE [turn] ADD FOREIGN KEY ([cash_cashid]) REFERENCES [cash] ([cashid]);

ALTER TABLE [payments] ADD FOREIGN KEY ([client_clientid]) REFERENCES [client] ([clientid]);

ALTER TABLE [attention] ADD FOREIGN KEY ([turn_turnid]) REFERENCES [turn] ([turnid]);

ALTER TABLE [attention] ADD FOREIGN KEY ([client_clientid]) REFERENCES [client] ([clientid]);

ALTER TABLE [attention] ADD FOREIGN KEY ([attentiontype_attentiontypeid]) REFERENCES [attentiontype] ([attentiontypeid]);

ALTER TABLE [attention] ADD FOREIGN KEY ([attentionstatus_statusid]) REFERENCES [attentionstatus] ([statusid]);
