CREATE DATABASE CACT;
CREATE LOGIN cact_user WITH PASSWORD = 'cact_user';
use CACT;
CREATE USER cact_user FOR LOGIN cact_user WITH DEFAULT_SCHEMA=dbo;
GRANT SELECT, UPDATE, DELETE, INSERT TO cact_user;

EXEC sp_addrolemember N'db_owner', N'cact_user';

CREATE TABLE CACT.dbo.selections
(
  selection_id INT PRIMARY KEY NOT NULL IDENTITY,
  name VARCHAR(50) NULL,
  active INT NULL,
)

CREATE TABLE CACT.dbo.dbusers
(
  user_id INT PRIMARY KEY NOT NULL IDENTITY,
  login_name VARCHAR(50) NOT NULL,
  firstname VARCHAR(50) NULL,
  surname VARCHAR(50) NULL,
  password VARCHAR(50) NOT NULL,
  password_updated DATETIME NULL,
  isLock INT NULL,
  user_level INT NULL,
  failed_attempts INT NULL,
)

CREATE TABLE CACT.dbo.db_calander
(
  case_id INT PRIMARY KEY NOT NULL IDENTITY,
  search_date NVARCHAR(50) NULL,
  case_no NVARCHAR(50) NULL,
  heading_status NVARCHAR(50) NULL,
  judge1 NVARCHAR(50) NULL,
  judge2 NVARCHAR(50) NULL,
  judge3 NVARCHAR(50) NULL,
  lcourt NVARCHAR(50) NULL,
  venue NVARCHAR(50) NULL,
  case_ref NVARCHAR(50) NULL,
  title1 NVARCHAR(50) NULL,
  title2 NVARCHAR(50) NULL,
  type NVARCHAR(50) NULL,
  lc_judge NVARCHAR(50) NULL,
  nature NVARCHAR(50) NULL,
  last_updated NVARCHAR(50) NULL,
  result NVARCHAR(50) NULL,
  status NVARCHAR(50) NULL,
  track_line1 NVARCHAR(50) NULL,
  track_line2 NVARCHAR(50) NULL,
  track_line3 NVARCHAR(50) NULL,
  track_line4 NVARCHAR(50) NULL,
  track_line5 NVARCHAR(50) NULL,
  track_line6 NVARCHAR(50) NULL,
  track_line7 NVARCHAR(50) NULL,
  track_line8 NVARCHAR(50) NULL,
)

CREATE TABLE CACT.dbo.applications(
  application_id INT PRIMARY KEY NOT NULL IDENTITY,
  surname VARCHAR(50) NULL,
  firstname VARCHAR(50) NULL,
  email VARCHAR(50) NOT NULL,
  notes VARCHAR(50) NULL,
  contact_number VARCHAR(50) NOT NULL,
  filename VARCHAR(50) NULL,
  date_received VARCHAR(50) NULL,
  comments VARCHAR(50) NULL,
  download INT NULL,
  confirmation_file image NULL,
  selection_id INT NOT NULL
)

SET IDENTITY_INSERT CACT.dbo.dbusers ON;
INSERT INTO dbo.dbusers
(
  user_id, login_name, firstname, surname, password, password_updated, isLock, user_level, failed_attempts
) VALUES (
  10, N'admin', N'Admin', N'User', N'44rSFJQ9qtHWTBAvrsKd5K/p2j0=', CAST(0x00009BA700000000 AS DateTime), 0, 0, 0
), (
  11, N'superUser', N'Super', N'User', N'44rSFJQ9qtHWTBAvrsKd5K/p2j0=', CAST(0x00009BA700000000 AS DateTime), 0, 1, 0
)