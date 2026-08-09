DROP DATABASE IF EXISTS PlayStoreDB;
CREATE DATABASE PlayStoreDB;
USE PlayStoreDB;

-- Table 1: Developers
CREATE TABLE Developers (
    DeveloperID INT PRIMARY KEY,
    DeveloperName VARCHAR(60) NOT NULL,
    Country VARCHAR(30),
    FoundedYear INT
);

-- Table 2: Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(60),
    HeadOffice VARCHAR(40),
    SupportEmail VARCHAR(60)
);

-- Table 3: Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(40),
    MinimumAge INT
);

-- Table 4: Apps
CREATE TABLE Apps (
    AppID INT PRIMARY KEY,
    AppName VARCHAR(60),
    DeveloperID INT,
    PublisherID INT,
    CategoryID INT,
    Rating DECIMAL(2,1),
    Downloads BIGINT,
    Price DECIMAL(6,2)
);

-- Inserting Developers values
INSERT INTO Developers
(DeveloperID, DeveloperName, Country, FoundedYear)
VALUES
(101, 'Google LLC', 'USA', 1998),
(102, 'Meta Platforms', 'USA', 2004),
(103, 'Spotify AB', 'Sweden', 2006),
(104, 'Canva Pty Ltd', 'Australia', 2012),
(105, 'BYJU''S', 'India', 2011);

-- Publishers
INSERT INTO Publishers
(PublisherID, PublisherName, HeadOffice, SupportEmail)
VALUES
(201, 'Google Play', 'California', 'support@google.com'),
(202, 'Samsung Galaxy Store', 'Seoul', 'support@samsung.com'),
(203, 'Huawei AppGallery', 'Shenzhen', 'support@huawei.com'),
(204, 'Amazon Appstore', 'Seattle', 'support@amazon.com');

-- Categories
INSERT INTO Categories
(CategoryID, CategoryName, MinimumAge)
VALUES
(301, 'Education', 3),
(302, 'Productivity', 3),
(303, 'Music', 12),
(304, 'Social', 13),
(305, 'Gaming', 16);

-- Apps
INSERT INTO Apps
(AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES
(1001, 'Google Classroom', 101, 201, 301, 4.6, 500000000, 0.00),
(1002, 'Google Keep', 101, 201, 302, 4.5, 1000000000, 0.00),
(1003, 'Instagram', 102, 201, 304, 4.4, 5000000000, 0.00),
(1004, 'Spotify', 103, 201, 303, 4.5, 1000000000, 0.00),
(1005, 'Canva', 104, 201, 302, 4.7, 500000000, 0.00),
(1006, 'BYJU''S Learning', 105, 201, 301, 4.3, 100000000, 299.00),
(1007, 'Candy Crush', 102, 204, 305, 4.6, 1000000000, 0.00),
(1008, 'Temple Run', 104, 203, 305, 4.2, 500000000, 0.00);

-- Display all records from every table
SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;


DESC Apps;
INSERT INTO Developers
(DeveloperID, DeveloperName, Country, FoundedYear)
VALUES
(106, 'OpenAI', 'USA', 2015);

INSERT INTO Categories
(CategoryID, CategoryName, MinimumAge)
VALUES
(306, 'Artificial Intelligence', 12);

INSERT INTO Apps
(AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES
(1009, 'ChatGPT', 106, 201, 306, 4.8, 100000000, 0.00);

UPDATE Apps
SET Rating = 4.5
WHERE AppID = 1008;

DELETE FROM Developers
WHERE DeveloperID = 105;

UPDATE Publishers
SET SupportEmail = 'help@samsung.com'
WHERE PublisherID = 202;

INSERT INTO Apps
(AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES
(1010, 'Google Drive', 101, 201, 302, 4.6, 5000000000, 0.00),
(1011, 'WhatsApp', 102, 201, 304, 4.5, 5000000000, 0.00);

UPDATE Apps
SET Price = 199.00
WHERE AppID = 1006;

DELETE FROM Categories
WHERE CategoryID = 303;

SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;