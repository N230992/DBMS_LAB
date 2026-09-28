USE PlayStoreDB;

-- Level 0 
-- 1
UPDATE Apps
SET Rating= 4.8
WHERE AppID = 1002;
COMMIT;

-- 2
SET AUTOCOMMIT = 0;
UPDATE Apps 
SET Price = 250.0
WHERE AppID = 1006;
ROLLBACK;

-- 3
INSERT INTO Apps
VALUES 
(1012, "Dr Driving", 103,202,301,4.9,1000000000,0.0);
COMMIT;

-- 4
SET AUTOCOMMIT = 0;
INSERT INTO Developers
VALUES 
(107,"Inshot" ,"London" ,2020);
ROLLBACK;

-- 5
UPDATE Apps
SET Rating = 4.0
WHERE AppID = 1011;
SAVEPOINT App_Update;

ROLLBACK TO App_Update;

-- Level 1
-- 1
UPDATE Apps 
SET Rating = 4.5
WHERE AppID = 1005;

SAVEPOINT rating_savepoint;

UPDATE Apps 
SET Rating = 3.5
WHERE AppID = 1007;

ROLLBACK TO rating_savepoint;

-- 2
UPDATE Apps
SET Price = 100
WHERE AppID = 1003;
SAVEPOINT Update_App;

ROLLBACK  TO Update_App;

-- 3
INSERT INTO Apps
VALUES
(1013,"Dr Driving", 103, 201, 304,4.8,500000000,0.0);
SAVEPOINT New_Update;

UPDATE Apps
SET Price = 2
WHERE AppID = 1004;

ROLLBACK To New_Update;

-- 4
GRANT SELECT 
ON PlayStoreDB.Apps
TO 'root'@'localhost';

SHOW GRANTS FOR 'root'@'localhost';

-- 5
GRANT SELECT,INSERT 
ON PlayStoreDB.Apps
TO 'root'@'localhost';

-- 6
REVOKE SELECT 
ON PlayStoreDB.Apps
FROM 'root'@'localhost';

Select * FROM Apps;

-- Level 2
-- 1
UPDATE Apps
SET Rating =  5.0
WHERE AppID = 1002;

SAVEPOINT sp1;

SELECT * FROM Apps;

UPDATE Apps
SET Price = 0
WHERE AppID = 1003;

UPDATE Apps 
SET Rating = 5.0
WHERE AppID = 1004;

ROLLBACK TO SAVEPOINT sp1;

-- 2
SELECT * FROM Categories;
INSERT INTO Categories
VALUES
(307,"Chatgpr Astra" , 18),
(308,"Claude", 20);
SAVEPOINT sp2;
INSERT INTO Categories
VALUES
(309,"Gemini" , 18);
ROLLBACK TO sp2;

-- 3
GRANT SELECT , INSERT , UPDATE
ON PlayStoreDB.Apps
TO 'root'@'localhost';

-- 4
REVOKE UPDATE
ON PlayStoreDB.Apps
FROM 'root'@'localhost';

-- 5
GRANT SELECT
ON PlayStoreDB.Developers
TO 'root'@'localhost';

REVOKE SELECT 
ON PlayStoreDB.Developers
FROM 'root'@'localhost';

-- 6
UPDATE Apps
SET Price = 0
WHERE AppID = 1003;

UPDATE Apps 
SET Rating = 4.9
WHERE AppID = 1004;

COMMIT;

-- 7
SELECT * FROM Categories
WHERE CategoryID IN (306,307);

SELECT * FROM  Apps
WHERE AppID IN (1003,1004);




