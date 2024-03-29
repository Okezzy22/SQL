CREATE PROCEDURE TEMP_HOUSEPRICE_USA
AS 
DROP TABLE IF EXISTS #TEXASHOUSE_PRICES
CREATE TABLE #USAHOUSEPRICES
(
HOUSEID INT,
    STATE VARCHAR(30),
    CITY VARCHAR(30),
    BEDROOMS INT,
    BATHROOMS INT,
    YEAR INT,
    PRICE INT,
    ZIPCODE INT
	);
	
	SELECT * INTO #USAHOUSEPRICES
	FROM [dbo].[HOUSEPRICES_USA]

	SELECT HOUSEID, STATE, CITY, BEDROOMS, BATHROOMS, AVG(PRICE) AS PRICE
	FROM [dbo].[HOUSEPRICES_USA]
	WHERE STATE = 'CALIFORNIA'
	GROUP BY HOUSEID, STATE, CITY, BEDROOMS, BATHROOMS

	SELECT * FROM #TEMPUSAHOUSEPRICES
	
	
CREATE PROCEDURE TOP_USA_HOUSE_PRICES 
AS 
BEGIN
SELECT TOP 1 HOUSEID, PROVINCE, CITY, POSTALCODE, PRICE
FROM(
SELECT TOP 3 HOUSEID, PROVINCE, CITY, POSTALCODE, PRICE
FROM [dbo].[HOUSEPRICES_CA]
ORDER BY PRICE DESC) AS PRICEDESC
ORDER BY PRICE ASC
END
