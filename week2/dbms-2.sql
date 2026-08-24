USE PlayStoreDB;

SELECT UPPER(DeveloperName) FROM Developers;
SELECT LOWER(DeveloperName) FROM Developers;
SELECT LENGTH(AppName) FROM Apps;
SELECT CategoryName, LENGTH(CategoryName) FROM Categories;
SELECT CURRENT_DATE() , CURRENT_TIME();

SELECT ROUND(Rating,0) FROM Apps;
SELECT SUBSTRING(AppName, 1, 5) FROM Apps;
SELECT CONCAT(DeveloperName, ' ', Country) FROM Developers;
SELECT ROUND(Rating) FROM Apps;
SELECT CEIL(Price) FROM Apps;
SELECT FoundedYear FROM Developers;
SELECT CONVERT(Downloads, CHAR) FROM Apps;

SELECT UPPER(AppName) ,Rating FROM Apps;
SELECT SUBSTRING(CategoryName , 1, 3) FROM Categories;
SELECT ABS(Price - 200) FROM Apps;
SELECT DeveloperName, LENGTH(DeveloperName) FROM Developers;
SELECT CURRENT_DATE() , CURRENT_TIMESTAMP();
SELECT CAST(MinimumAge AS CHAR) FROM categories;