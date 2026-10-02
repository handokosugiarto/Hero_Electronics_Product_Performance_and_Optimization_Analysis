
/*================== Data Cleeaning and standadization for Customers Table ======================== 
  = I was performing Exploratory Data Analysis and I did not find any duplicates on customers     =
  = table. I identified data inconsistency issue within city column which was some identified as  =
  = upper case letter, and some was consistent.                                                   =
  =                                                                                               =
  = Solving the issues, I performed:                                                              =
  = 1. CTE and created extra columns for extraction letters.                                      =
  = 2. Extraction function such as LEFT and SUBSTRING being performed.                            =
  = 3. Finding the starting and ending position to extract such as CHARINDEX.                     =
  = 4. Conditional expression CASE WHEN                                                           = 
  = 5. Join Function LEFT JOIN to combine tables                                                  =
  = 6. Capitalization text function such as UPPER and LOWER.                                      =
  = 7. String Function CONCAT to combine multiple texts.                                          =
  = 8. Counting character LEN                                                                     =
  = 9. Removing spaces using TRIM                                                                 =
  = Below are the queries.                                                                        =
  ================================================================================================= */

WITH a AS(SELECT 
	customerkey,
	gender,
	name,
	city,
	CHARINDEX(' ',TRIM(city)) AS num1,
	SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))) AS city0,
	LEFT(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))),1)+
	SUBSTRING(LOWER(
	SUBSTRING(city,1,CHARINDEX(' ',TRIM(city)))),2, LEN(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))))) AS city1,
	CASE WHEN LEFT(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))),1)+
	SUBSTRING(LOWER(
	SUBSTRING(city,1,CHARINDEX(' ',TRIM(city)))),2, LEN(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city)))))='' 
	THEN LEFT(city,1)+SUBSTRING(LOWER(city),2,LEN(city)) ELSE LEFT(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))),1)+
	SUBSTRING(LOWER(
	SUBSTRING(city,1,CHARINDEX(' ',TRIM(city)))),2, LEN(SUBSTRING(city,1,CHARINDEX(' ',TRIM(city))))) END AS city2,
	CASE WHEN CHARINDEX(' ',TRIM(city))=0 THEN '' ELSE
	TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city))) END AS city3,
	CHARINDEX(' ',TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city)))) AS num2,
	CASE WHEN CHARINDEX(' ',TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city))))=0 
	THEN LEFT(CASE WHEN CHARINDEX(' ',TRIM(city))=0 THEN '' ELSE
	TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city))) END,1)+
	SUBSTRING(LOWER(CASE WHEN CHARINDEX(' ',TRIM(city))=0 THEN '' ELSE
	TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city))) END),2,LEN(CASE WHEN CHARINDEX(' ',TRIM(city))=0 THEN '' ELSE
	TRIM(SUBSTRING(TRIM(city), CHARINDEX(' ',TRIM(city)), LEN(city))) END)) ELSE '' END AS city4,
	state_code,
	state,
	zip_code,
	country,
	continent,
	birthday
	
FROM bronze.customers),

b AS(SELECT
	customerkey,
	city,
	num1,
	city2, 
	city3, 
	num2,
	city4,
	LEFT(SUBSTRING(city3,1, CHARINDEX(' ',city3)),1)+
	SUBSTRING(
	LOWER(
	SUBSTRING(city3,1, CHARINDEX(' ',city3))),2,CHARINDEX(' ',SUBSTRING(city3,1, CHARINDEX(' ',city3)))) As city0,
	TRIM(CASE WHEN num2>0 THEN LEFT(SUBSTRING(city3,1, CHARINDEX(' ',city3)),1)+
	SUBSTRING(
	LOWER(
	SUBSTRING(city3,1, CHARINDEX(' ',city3))),2,CHARINDEX(' ',SUBSTRING(city3,1, CHARINDEX(' ',city3)))) 
	ELSE city4 END) AS city5,
	CONCAT(city2, 	TRIM(CASE WHEN num2>0 THEN LEFT(SUBSTRING(city3,1, CHARINDEX(' ',city3)),1)+
	SUBSTRING(
	LOWER(
	SUBSTRING(city3,1, CHARINDEX(' ',city3))),2,CHARINDEX(' ',SUBSTRING(city3,1, CHARINDEX(' ',city3)))) 
	ELSE city4 END)) AS city6,
	CASE WHEN num2=0 THEN '' ELSE
	TRIM(SUBSTRING(city3,CHARINDEX(' ',city3),LEN(city3)))END AS city7
	
FROM a),

c AS(SELECT
	customerkey,
	city,
	num1,
	city3, 
	num2,
	city6,
	city7,
	CHARINDEX(' ',city7) AS num3,
	CASE WHEN CHARINDEX(' ',city7)>0 THEN 
	UPPER(LEFT(SUBSTRING(city7,1,CHARINDEX(' ',city7)),1))+
	SUBSTRING(LOWER(SUBSTRING(city7,1,CHARINDEX(' ',city7))),2,LEN(SUBSTRING(city7,1,CHARINDEX(' ',city7))))
	ELSE LEFT(city7,1)+SUBSTRING(LOWER(city7),2,LEN(city7)) END AS city8,
	CASE WHEN CHARINDEX(' ',city7)=0 THEN '' ELSE
	TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7)))END AS city9,
	CHARINDEX(' ',TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7)))) AS num4,
	TRIM(CASE WHEN CHARINDEX(' ',TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))))>0 THEN
	SUBSTRING(TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))),1,
	CHARINDEX(' ',TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))))) ELSE 
	(CASE WHEN CHARINDEX(' ',city7)=0 THEN '' ELSE
	TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7)))END) END) AS city10,
	CASE WHEN CHARINDEX(' ',TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))))=0 THEN '' ELSE
	SUBSTRING(TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))),CHARINDEX(' ',TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7)))),
	LEN(TRIM(SUBSTRING(city7,CHARINDEX(' ',city7),LEN(city7))))) END AS city11
	
FROM b)

SELECT
	c.customerkey,
	a.gender,
	a.name,
	c.city AS old_city,
	TRIM(CONCAT (c.city6,' ',c.city8,' ',LEFT(c.city10,1)+SUBSTRING(LOWER(c.city10),2,LEN(c.city10)),' ',c.city11)) AS new_city,
	a.state_code,
	a.state,
	a.zip_code,
	a.country,
	a.continent,
	a.birthday
FROM c
LEFT JOIN a 
	ON c.customerkey=a.customerkey
