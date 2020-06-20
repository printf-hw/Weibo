/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2020/6/2 10:59:56                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Command') and o.name = 'FK_COMMAND_REFERENCE_LOG')
alter table Command
   drop constraint FK_COMMAND_REFERENCE_LOG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Command') and o.name = 'FK_COMMAND_REFERENCE_USER')
alter table Command
   drop constraint FK_COMMAND_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Follow') and o.name = 'FK_FOLLOW_REFERENCE_LOG')
alter table Follow
   drop constraint FK_FOLLOW_REFERENCE_LOG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Follow') and o.name = 'FK_FOLLOW_REFERENCE_USER')
alter table Follow
   drop constraint FK_FOLLOW_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Forward') and o.name = 'FK_FORWARD_REFERENCE_USER')
alter table Forward
   drop constraint FK_FORWARD_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Forward') and o.name = 'FK_FORWARD_REFERENCE_LOG')
alter table Forward
   drop constraint FK_FORWARD_REFERENCE_LOG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Like"') and o.name = 'FK_LIKE_REFERENCE_LOG')
alter table "Like"
   drop constraint FK_LIKE_REFERENCE_LOG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Like"') and o.name = 'FK_LIKE_REFERENCE_USER')
alter table "Like"
   drop constraint FK_LIKE_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Messsage') and o.name = 'FK_MESSSAGE_REFERENCE_USER')
alter table Messsage
   drop constraint FK_MESSSAGE_REFERENCE_USER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Command')
            and   type = 'U')
   drop table Command
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Follow')
            and   type = 'U')
   drop table Follow
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Forward')
            and   type = 'U')
   drop table Forward
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"Like"')
            and   type = 'U')
   drop table "Like"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Log')
            and   type = 'U')
   drop table Log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Messsage')
            and   type = 'U')
   drop table Messsage
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

/*==============================================================*/
/* Table: Command                                               */
/*==============================================================*/
create table Command (
   CommandID            int                  identity,
   LogID                int                  null,
   CommandInfo          nvarchar(80)         null,
   CommandTime          datetime             null,
   UserID               int                  null,
   constraint PK_COMMAND primary key (CommandID)
)
go

/*==============================================================*/
/* Table: Follow                                                */
/*==============================================================*/
create table Follow (
   FollowID             int                  identity,
   UserID               int                  null,
   LogID                int                  null,
   constraint PK_FOLLOW primary key (FollowID)
)
go

/*==============================================================*/
/* Table: Forward                                               */
/*==============================================================*/
create table Forward (
   FoewardID            int                  identity,
   UserID               int                  null,
   LogID                int                  null,
   constraint PK_FORWARD primary key (FoewardID)
)
go

/*==============================================================*/
/* Table: "Like"                                                */
/*==============================================================*/
create table "Like" (
   LikeID               int                  identity,
   UserID               int                  null,
   LogID                int                  null,
   constraint PK_LIKE primary key (LikeID)
)
go

/*==============================================================*/
/* Table: Log                                                   */
/*==============================================================*/
create table Log (
   UserID               int                  null,
   LogID                int                  identity,
   LogInfo              nvarchar(80)         null,
   LogPic               varchar(20)          null,
   Vlog                 varchar(20)          null,
   Command              nvarchar(80)         null,
   Tag                  nvarchar(20)         null,
   constraint PK_LOG primary key (LogID)
)
go

/*==============================================================*/
/* Table: Messsage                                              */
/*==============================================================*/
create table Messsage (
   MessageID            int                  identity,
   UserID               int                  null,
   SendID               int                  null,
   MessageInfo          nvarchar(80)         null,
   MessgaeTime          datetime             null,
   constraint PK_MESSSAGE primary key (MessageID)
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   UserID               int                  identity,
   UserNname            nvarchar(20)         null,
   address              nvarchar(40)         null,
   UserInfo             nvarchar(80)         null,
   Email                varchar(20)          null,
   Pwd                  varchar(20)          null,
   Icon                 varchar(20)          null,
   constraint PK_USER primary key (UserID)
)
go

alter table Command
   add constraint FK_COMMAND_REFERENCE_LOG foreign key (LogID)
      references Log (LogID)
go

alter table Command
   add constraint FK_COMMAND_REFERENCE_USER foreign key (UserID)
      references "User" (UserID)
go

alter table Follow
   add constraint FK_FOLLOW_REFERENCE_LOG foreign key (LogID)
      references Log (LogID)
go

alter table Follow
   add constraint FK_FOLLOW_REFERENCE_USER foreign key (UserID)
      references "User" (UserID)
go

alter table Forward
   add constraint FK_FORWARD_REFERENCE_USER foreign key (UserID)
      references "User" (UserID)
go

alter table Forward
   add constraint FK_FORWARD_REFERENCE_LOG foreign key (LogID)
      references Log (LogID)
go

alter table "Like"
   add constraint FK_LIKE_REFERENCE_LOG foreign key (LogID)
      references Log (LogID)
go

alter table "Like"
   add constraint FK_LIKE_REFERENCE_USER foreign key (UserID)
      references "User" (UserID)
go

alter table Messsage
   add constraint FK_MESSSAGE_REFERENCE_USER foreign key (UserID)
      references "User" (UserID)
go

