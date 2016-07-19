create table Funds (Post varchar(50) Primary Key, TotalMoney real);
create table Senators (RollNumber bigint , Name varchar(50), Username varchar(15) Primary Key, Post varchar(50), UsedMoney real, PledgeMoney real, Foreign Key(Post) References Funds(Post));
create table StatesOfApproval (ID int Primary Key, State varchar(250));
create table Users(Username varchar(15) PRIMARY KEY, Password varchar(1000));
create table Forms(FormID int Primary Key AUTO_INCREMENT, Name varchar(50), RollNumber bigint, Email varchar(20), Phone varchar(15), Event varchar(100), Council varchar(50), CreationDate date, ExpiryDate date, TargetAmount real, ApprovalState int, Remark varchar(1000) Default NULL, Username varchar(15), Foreign Key(ApprovalState) References StatesOfApproval(ID), Foreign Key(Username) References Users(Username));
create table PledgedMoney(FormID int, SenatorID varchar(15), MoneyPledged real, Date date, Foreign Key(FormID) References Forms(FormID), Foreign Key(SenatorID) References Senators(Username), Primary Key(FormID, SenatorID));
create table UsedMoney(FormID int, SenatorID varchar(15), MoneyUsed real, Date date, Foreign Key(FormID) References Forms(FormID), Foreign Key(SenatorID) References Senators(Username), Primary Key(FormID, SenatorID));

Alter table Forms add constraint check_dates check (CreationDate<ExpriryDate);
Alter table Forms add constraint check_dates check (0<DATEDIFF(ExpiryDate ,CreationDate) and DATEDIFF(ExpiryDate ,CreationDate)<60);

insert into StatesOfApproval values (0, 'Form not submitted to Executive'),
(1, 'Awaiting approval by Executive'),
(2, 'Awaiting approval by Chairperson'),
(3, 'Active'),
(4, 'Target money reached'),
(5, 'Expiration date reached'),
(6, 'Submitted by Executive'),
(7, 'Approved by Finance Convenor'),
(8, 'Rejected by Executive'),
(9, 'Rejected by Chairperson'),
(10,'Rejected by Finance Convenor'),
(11, 'Check Remarks');
