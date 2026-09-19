USE PlayStoreDB;

-- Level 0

SELECT COUNT(*)
FROM Apps;

SELECT AVG(Rating)
FROM Apps;

SELECT MAX(Rating)
FROM Apps;

SELECT MIN(Rating)
FROM Apps;

SELECT COUNT(Downloads)
FROM Apps;

SELECT * 
FROM Apps
ORDER BY Rating DESC;

-- Level1
SELECT CategoryID , COUNT(*) 
FROM Apps
GROUP BY CategoryID;

SELECT CategoryID , AVG(Rating)
FROM Apps
GROUP BY CategoryID;

SELECT MAX(Price) , MIN(Price)
FROM Apps;

SELECT *
FROM Apps
ORDER BY Downloads DESC;

SELECT DeveloperID , COUNT(*)
FROM Apps
GROUP BY DeveloperID;

SELECT CategoryID , COUNT(*)
FROM Apps
GROUP BY CategoryID 
HAVING COUNT(*) > 1;

-- Level 2
SELECT DeveloperID , COUNT(*)
FROM Apps
GROUP BY DeveloperID;

SELECT PublisherID , AVG(Rating)
FROM Apps
GROUP BY PublisherID;

SELECT DeveloperID , COUNT(*)
FROM Apps
GROUP BY DeveloperID
HAVING COUNT(*) > 1;

SELECT CategoryID , AVG(Rating)
FROM Apps
GROUP BY CategoryID
HAVING AVG(Rating) > 4.3;

SELECT CategoryID ,COUNT(*) AS Total_num_of_Applications 
FROM Apps
GROUP BY CategoryID 
ORDER BY COUNT(*) DESC;

SELECT *
FROM Apps
WHERE  Rating = ( SELECT MAX(Rating) 
          FROM Apps);
          
SELECT DeveloperID , COUNT(Price)
FROM Apps
GROUP BY DeveloperID;