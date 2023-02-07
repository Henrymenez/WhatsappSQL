/* CREATE TABLE QUERIES */
/* User table*/

CREATE TABLE Users(
	Id INT UNIQUE IDENTITY(1,1) NOT NULL,
	userId VARCHAR(20)  UNIQUE  NOT NULL,  
  	phone BIGINT UNIQUE NOT NULL,
	Contacts TEXT NULL,
	PRIMARY KEY(Id))

	/* Profile table*/
	CREATE TABLE Profiles(
	Id INT UNIQUE IDENTITY(1,1) NOT NULL,
	userId VARCHAR(20) UNIQUE  NOT NULL,  
  	displayName VARCHAR(20) NOT NULL,
	displayImage VARCHAR(20) NOT NULL,
	bio VARCHAR(20) NOT NULL, 
	lastSeen DATETIME NOT NULL,
	createdAt TIMESTAMP NOT NULL,
	FOREIGN KEY (userId) REFERENCES Users (userId),
	PRIMARY KEY(Id))
	/* status table*/
	CREATE TABLE UserStatus(
	Id INT UNIQUE IDENTITY(1,1) NOT NULL,
	userId VARCHAR(20)  NOT NULL,  
  	statusDisplay VARCHAR(20) NULL,
	statusText TEXT NULL,
	seenCount INT NOT NULL,
	FOREIGN KEY (userId) REFERENCES Users (userId),
	PRIMARY KEY(Id))

	CREATE TABLE MessagesTb(
	Id INT UNIQUE IDENTITY(1,1) NOT NULL,
	sender VARCHAR(20) NOT NULL,
	receiver VARCHAR(20) NOT NULL,
	chat TEXT NOT NULL,
	createdAT DATETIME NOT NULL,
	msgStatus VARCHAR(20) NOT NULL,
	FOREIGN KEY (sender) REFERENCES Profiles (userId),
	FOREIGN KEY (receiver) REFERENCES Profiles (userId),
	PRIMARY KEY(Id)
	)




	/* INSERT QUERIES*/
	/*user table*/
INSERT INTO [dbo].[Users]([userId],[phone])VALUES('1808724C669C',19381143492,'(206)3428631,(717)550-675,(248)7620356,(253)6442182')
INSERT INTO [dbo].[Users]([userId],[phone])VALUES('C64D7FE5D9E',09096026989,'(212)6583916,(209)3002557,(262)1621585,(252)2583799')
INSERT INTO [dbo].[Users]([userId],[phone])VALUES('F40B4090',08177622560,'(512)1826663,(848)4937724,(731)5982787,(614)0636651')
/*profile table*/
INSERT INTO [dbo].[Profiles]([userId],[displayName],[displayImage],[bio],[lastSeen])VALUES('1808724C669C','Henry One','image1.png','Hello hello'
 ,GETDATE())
 INSERT INTO [dbo].[Profiles]([userId],[displayName],[displayImage],[bio],[lastSeen])VALUES('C64D7FE5D9E','Henry Two','image2.png','Hi There'
 ,GETDATE())
 INSERT INTO [dbo].[Profiles]([userId],[displayName],[displayImage],[bio],[lastSeen])VALUES('F40B4090','Henry Three','image3.png','Here we go'
 ,GETDATE())
 /*userStatus table*/
 INSERT INTO [dbo].[UserStatus]([userId],[statusDisplay],[statusText],[seenCount])VALUES('F40B4090','me.jpeg',NULL,0)
 /*message table*/
 
INSERT INTO [dbo].[MessagesTb]([sender],[receiver],[chat],[createdAT],[msgStatus])VALUES('1808724C669C','C64D7FE5D9E','How far',GETDATE(),'sent')


/* VIEW QUERY*/
SELECT sender.displayName AS senderName,
	receiver.displayName AS receiverName,
	MessagesTb.chat,
	MessagesTb.createdAT 
	FROM 
	MessagesTb 
	JOIN Profiles AS sender ON sender.userId = MessagesTb.sender
	JOIN Profiles AS receiver ON receiver.userId  = MessagesTb.receiver
