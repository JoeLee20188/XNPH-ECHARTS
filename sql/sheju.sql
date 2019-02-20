drop database if exists SHEJU;
create database SHEJU;
use SHEJU;

drop table if exists Send;
drop table if exists Notify;
drop table if exists MbelongToD;
drop table if exists managedBy;
drop table if exists Letter;
drop table if exists Message;
drop table if exists Member;
drop table if exists Dormitory;
drop table if exists Manager;
drop table if exists Fees;

create table Manager(
	ManagerID int primary key not null,
	Managerphone varchar(20),
	ManagerPassword varchar(50)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index managerIndex on Manager(ManagerID);

/* some managers defined*/
insert into Manager values(13354355,"110","wull");
insert into Manager values(13354167,"120","liwj");
insert into Manager values(13354342,"130","wangy");

create table Dormitory(
	BuildingID varchar(20), /*例如：R9 / L9*/
	DomID int,
	Account varchar(30) unique,
	Password varchar(50),
	primary key (BuildingID,DomID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index domIndex on Dormitory(Account);

create table Member(
	MemberID int primary key unique,
	MemberName varchar(50),
	Phone varchar(20)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index memIndex on Member(MemberID);

create table Message(
	MsgID int auto_increment primary key,
	day varchar(20) DEFAULT "20150101",
	Duration int,
	public boolean DEFAULT false,
	objects varchar(1000), /*据说是没有数组这个形式的，插入的时候以','隔开，获取数据之后对字符串进行分割*/
	content varchar(1000),
	Type varchar(50),
	accept boolean /*true表示已经接受*/
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index msgIndex on Message(MsgID);

create table Letter(
	LetterID int auto_increment primary key,
	Receiver varchar(50),
	day varchar(20),
	State boolean/*true表示已经接受*/
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index lIndex on Letter(LetterID);

create table Fees(
	day varchar(20),
	DomID int,
	BuildingID varchar(20),
	hotWater double,
	coolWater double,
	electric double,
	primary key (DomID,BuildingID,day),
	constraint foreign key(BuildingID,DomID) references Dormitory(BuildingID,DomID) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index feeIndex on Fees(DomID,BuildingID,day);


create table managedBy(
	DomID int,
	BuildingID varchar(20),
	ManagerID int,
	primary key (DomID,BuildingID,ManagerID),
	constraint foreign key(BuildingID,DomID) references Dormitory(BuildingID,DomID) ON DELETE CASCADE ON UPDATE CASCADE,
	constraint foreign key(ManagerID) references Manager(ManagerID) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index managedByIndex on  managedBy(DomID,BuildingID,ManagerID);

create table MbelongToD(
	MemberID int,
	BuildingID varchar(20),
	DomID int,
	primary key(MemberID),
	constraint foreign key(MemberID) references Member(MemberID) ON DELETE CASCADE ON UPDATE CASCADE,
	constraint foreign key(BuildingID,DomID) references Dormitory(BuildingID,DomID) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index MbelongToDIndex on MbelongToD(MemberID,DomID,BuildingID);

create table Notify(
	BuildingID varchar(20),
	MsgID int,
	primary key(BuildingID,MsgID),
	constraint foreign key(BuildingID) references Dormitory(BuildingID) ON DELETE CASCADE ON UPDATE CASCADE,
	constraint foreign key(MsgID) references Message(MsgID) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index NotifyIndex on  Notify(BuildingID,MsgID);

create table Send(
	LetterID int,
	DomID int,
	BuildingID varchar(20),
	primary key(LetterID,BuildingID),
	constraint foreign key(LetterID) references Letter(LetterID) ON DELETE CASCADE ON UPDATE CASCADE,
	constraint foreign key(BuildingID,DomID) references Dormitory(BuildingID,DomID) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index SendIndex on Send(LetterID,BuildingID,DomID);