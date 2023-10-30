CREATE DATABASE TasksJoin1

USE TasksJoin1

CREATE TABLE Users(
Id int primary key identity,
Username nvarchar(50) unique,
[Password] nvarchar(50),
)

CREATE TABLE Roles(
Id int primary key identity,
[Name] nvarchar(50) not null
)

CREATE TABLE UserRoles(
Id int primary key identity,
UserId int references Users(Id),
RolesId int references Roles(Id)
)

SELECT *FROM Users
SELECT *FROM Roles
SELECT *FROM UserRoles

INSERT INTO Users(Username,[Password]) VALUES
('Xeyal','xeyal085'),
('Kenan','kenan570'),
('Yusif','yusif907')

INSERT INTO Roles([Name]) VALUES
('Bash admin'),
('Admin'),
('Moderator')

INSERT INTO UserRoles (UserId,RolesId) VALUES
(1,3),
(2,1),
(3,2)

SELECT Users.Username, Roles.Name AS RoleName FROM Users
JOIN UserRoles ON Users.Id=UserRoles.UserId
JOIN Roles ON UserRoles.RolesId=Roles.Id 