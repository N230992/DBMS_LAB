USE PlayStoreDB;

-- Level 0

-- 1
SELECT A.AppName,D.DeveloperName
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID;

-- 2
SELECT A.AppName, P.PublisherName
FROM Apps A
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID;

-- 3
SELECT A.AppName , C.CategoryName
FROM Apps A
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID;

-- 4
SELECT A.AppName,D.DeveloperName, P.PublisherName
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID 
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID;

-- 5
SELECT A.AppName , D.DeveloperName, C.CategoryName
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID;

-- 6
SELECT *  
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID;

-- 7
SELECT * 
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID  = A.CategoryID;

-- Level 1

-- 1
SELECT * 
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID;

-- 2
SELECT *
FROM Publishers P
RIGHT JOIN Apps A
ON P.PublisherID = A.PublisherID;

-- 3
SELECT *
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID;

-- 4
SELECT AppName, DeveloperName , Country
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID;

-- 5
SELECT AppName , DeveloperName,PublisherName, CategoryName 
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID;

-- 6
SELECT A.AppName, D.DeveloperName ,D.Country
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
WHERE Country = "USA";

-- 7
SELECT A.AppName, P.PublisherName 
FROM Apps A
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID 
WHERE CategoryName = "Gaming";

-- Level 2

-- 2
SELECT P.PublisherName
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID 
WHERE AppID IS NULL;

-- 3
SELECT AppName, CategoryName
FROM Apps A
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID 
ORDER BY CategoryName;

-- 4
SELECT A.AppName , D.DeveloperName, P.PublisherName, C.CategoryName, A.Rating
FROM Apps A
INNER JOIN Developers D
ON A.CategoryID = A.CategoryID
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID;

-- 5

SELECT A.AppName,P.PublisherName
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID
WHERE D.Country = "USA" AND P.PublisherID = "201";

-- 7
SELECT D1.DeveloperName AS Developer1,
       D2.DeveloperName AS Developer2,
       D1.Country
FROM Developers D1
JOIN Developers D2
ON D1.Country = D2.Country
AND D1.DeveloperID < D2.DeveloperID;

-- 8
SELECT D.DeveloperName , C.CategoryName
FROM Developers D
CROSS JOIN Categories C;

-- 9 
SELECT P.PublisherName, A.AppName
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID
UNION 
SELECT P.PublisherName , A.AppName
FROM Publishers P
RIGHT JOIN Apps A
ON P.PublisherID = A.PublisherID;