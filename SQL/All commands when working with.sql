CREATE TABLE Hotels
(
    Hotelid int IDENTITY NOT NULL PRIMARY KEY,
    HotelName varchar (20) NOT NULL,
    StarCount int NOT NULL,
    CreationYear int NOT NULL,
    Adress varchar(40)
)

CREATE TABLE rooms
(
    Roomid int IDENTITY NOT NULL PRIMARY KEY,
    RoomNumber int NOT NULL,
    Hotelid int NOT NULL FOREIGN KEY Hotels(Hotelid)
)

CREATE TABLE Clients
(
    Clientid int IDENTITY NOT NULL PRIMARY KEY,
    ClientName varchar(20),
    Email varchar(20),
    DaysCount int NOT NULL
)

CREATE TABLE Orders
(
    Orderid int IDENTITY NOT NULL PRIMARY KEY,
    Clientid int NOT NULL FOREIGN KEY REFERENCES Clients(Clientid),
    Roomid int NOT NULL FOREIGN KEY REFERENCES Rooms(Roomid),
    Price int NOT NULL,
    DaysCount int NOT NULL
)


SELECT TOP (1000) [Hotelid]
       ,[HotelName]
       ,[StarCount]
       ,[CreationYear]
       ,[Adress]
FROM [HotelDB].[dbo].[Hotels]

SELECT TOP (1000) [Roomid]
      ,[RoomNumber]
      ,[Hotelid]
FROM [HotelDB].[dbo].[rooms]


INSERT INTO Clients (ClientName, Email, Age)
VALUES  ('Ivan','iva@gmail.com','23'),
        ('Anton','ant@gmail.com','21'),
        ('Ira','jj@gmail.com','19'),
        ('Oleg','ole@gmail.com','25');


SELECT * FROM Clients WHERE Age = 21;
SELECT * FROM Clients;
SELECT Clients.ClientName, Clients.Email FROM Clients;

SELECT * Clients WHERE Clients.ClientsName = 'Ivan';
SELECT * Clients WHERE Clients.ClientsName LIKE 'A%';
SELECT * Clients WHERE Clients.ClientsName LIKE '%n';
SELECT * Clients WHERE Clients.ClientsName LIKE 'O__g';
SELECT * Clients WHERE Clients.ClientsName LIKE '%a%';
SELECT * Clients WHERE Clients.ClientsName LIKE 'a&n';
SELECT * Clients.Clientid, Clients.ClientName, Clients.Email, Age FROM Clients WHERE Age = 21;
SELECT * COUNT(Age) AS AgeCount FROM Clients WHERE Age = 21;
SELECT * SUM(Age) AS SunAge FROM Clients WHERE ClientsName LIKE 'A%';
SELECT * AVG(Age) AS AvgAge FROM Clients;
SELECT * MAX(Age) FROM Clients;
SELECT * MIN(Age) FROM Clients;


INSERT INTO Hotels (HotelName, StarCount, CreationYear, Adress) 
VALUES  ('Ukraina','5','2014','Molodisna 99'),
        ('Dream','4','2019','Holivna 4');


INSERT INTO Rooms (RoomNumber, Hotelid)
VALUES  ('100','1'),
        ('101','1'),
        ('102','1'),
        ('200','2'),
        ('201','2'),
        ('203','2');


SELECT * FROM Clients;
SELECT * FROM Hotels;
SELECT * FROM Rooms;
SELECT * FROM Orders;

SELECT * FROM Orders JOIN Clients ON Orders.Clientid = Clients.Clientid;
SELECT * FROM Orders JOIN Rooms ON Orders.Roomid = Rooms.Roomid;
SELECT * FROM Rooms RIGHT JOIN Hotels ON Hotels.Hotelid = Rooms.Hotelid;

INSERT INTO Hotels(HotelName, CreationYear, Adress)
VALUES  ('Romashka','1','2020','Karpatska 4');

INSERT INTO Orders (Clientid, Roomid, Price, DaysCount)
VALUES ('1','1','100','1'),
       ('2','3','1000','2'),
       ('3','4','400','2'),
       ('4','5','700','1'),
       ('5','7','800','2');



SELECT Price, COUNT(Price) FROM Orders GROUP BY Price;
SELECT DaysCount, COUNT(DaysCount) FROM Orders GROUP BY DaysCount;
SELECT Age, COUNT(Age) FROM Clients GROUP BY Age;
SELECT Roomid, MAX(Price) FROM Orders GROUP BY Roomid;

SELECT Age, COUNT(Age) FROM Clients GROUP BY Age HAVING Age < 19;

SELECT * FROM Orders ORDER BY Price;
SELECT * FROM Clients ORDER BY ClientName DESC;


UPDATE Hotels SET StarCount = 4 WHERE Hotelid = 1;
UPDATE Hotelid SET StarCount = 5 WHERE Hotelid = 2;
UPDATE Hotels SET StarCount = 1, CreationYear = 2009, Adress = 'Dovha 5' WHERE Hotelid = 1;

DELETE FROM Hotels WHERE Hotelid = 1;

DROP TABLE Hotels;