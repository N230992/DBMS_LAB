SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;
-- 1
CREATE VIEW All_Application_records AS
SELECT * FROM Apps;
SELECT * FROM All_Application_records;
-- 2
CREATE VIEW App_Details AS
SELECT AppID, AppName, Rating, Price FROM Apps;
SELECT * FROM App_Details;
-- 3
CREATE VIEW Apps_HighRating AS
SELECT AppId, AppName, Rating FROM Apps
WHERE Rating>=4.5;
SELECT * FROM Apps_HighRating;
-- 4
CREATE VIEW Free_Apps AS
SELECT * FROM Apps
WHERE Price = 0;
SELECT * FROM Free_Apps;
-- 6
SHOW FULL TABLES
WHERE Table_Type = 'VIEW';

SHOW CREATE VIEW Free_Apps;

-- Level 1

-- 1
CREATE VIEW AppDev AS
SELECT A.AppName, D.DeveloperName FROM Apps A INNER JOIN Developers D ON A.DeveloperID = D.DeveloperID;
SELECT * FROM AppDev;
-- 2
CREATE VIEW AppPub AS
SELECT A.AppName, P.PublisherName, P.PublisherID FROM Apps A INNER JOIN Publishers P ON A.PublisherID = P.PublisherID;
SELECT * FROM AppPub;
-- 3
CREATE VIEW AppCat AS
SELECT A.AppName, C.CategoryName FROM Apps A INNER JOIN Categories C ON A.CategoryID = C.CategoryID;
SELECT * FROM AppCat;
-- 4
CREATE VIEW Appdeveloperdetails AS
SELECT A.AppID, A.AppName, D.DeveloperName, D.Country FROM Apps A INNER JOIN Developers D ON A.DeveloperID = D.DeveloperID;
SELECT * FROM Appdeveloperdetails;
-- 5
CREATE VIEW qu4 AS
SELECT C.CategoryName, COUNT(A.AppID) AS Total_Apps FROM Categories C INNER JOIN Apps A ON C.CategoryID = A.CategoryID GROUP BY C.CategoryName;
SELECT * FROM qu4;
-- 6
CREATE VIEW qu6 AS
SELECT D.DeveloperName, COUNT(A.AppID) AS Total_Apps FROM Developers D INNER JOIN Apps A ON D.DeveloperID = A.DeveloperID GROUP BY D.DeveloperName, D.DeveloperID;
SELECT * FROM qu6;
-- 7
CREATE VIEW qu7 AS
SELECT C.CategoryName, AVG(A.Rating) FROM Categories C INNER JOIN Apps A 
ON C.CategoryID = A.CategoryID GROUP BY C.CategoryName;
SELECT * FROM qu7;
-- 8
CREATE VIEW qu8 AS
SELECT A.AppName,A.Rating, D.DeveloperName FROM Developers D INNER JOIN Apps A ON D.DeveloperID = A.DeveloperID WHERE A.Rating > 4.3;
SELECT * FROM qu8;
-- 9
SELECT A.AppName, D.DeveloperName FROM qu8
WHERE D.DeveloperName = 'Google LLC';
-- 10
SHOW CREATE VIEW qu8;

-- Level 2

-- 1
CREATE VIEW qu9 AS
SELECT C.CategoryName, COUNT(A.AppID) AS Total_Apps FROM Categories C INNER JOIN Apps A ON C.CategoryID = A.CategoryID GROUP BY C.CategoryID, C.CategoryName;
SELECT * FROM qu9;
-- 2
CREATE VIEW qu10 AS
SELECT D.DeveloperName, COUNT(A.AppID) AS AppsCount FROM Developers D INNER JOIN Apps A ON D.DeveloperID = A.DeveloperID GROUP BY D.DeveloperName HAVING COUNT(A.AppID)>1;
SELECT * FROM qu10;
-- 3
CREATE VIEW qu11 AS
SELECT C.CategoryName, MAX(A.Rating), MIN(A.Rating) FROM Categories C INNER JOIN Apps A ON C.CategoryID = A.CategoryID GROUP BY C.CategoryName;
SELECT * FROM qu11;
-- 5
CREATE VIEW qu12 AS
SELECT A.AppID, A.AppName, D.DeveloperName, D.Country, C.CategoryName, A.Rating, P.PublisherName,A.Downloads,A.Price FROM Apps A 
INNER JOIN Developers D ON A.developerID = D.DeveloperID 
INNER JOIN Publishers P ON A.PublisherID = P.PublisherID
INNER JOIN Categories C ON A.CategoryID = C.CategoryID;
SELECT * FROM qu12;
-- 9
CREATE VIEW q13 AS
SELECT AppID, AppName, Rating FROM Apps;
SELECT * FROM q13;
UPDATE q13
SET Rating = 2.0
WHERE AppID = 1005;
SELECT * FROM q13;