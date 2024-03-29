-- REALESTATE PRICES FOR USA AND CANADA, QUERY COLLECTED AFTER CREATING TABLES HOUSEPRICES_USA AND HOUSEPRICES_CA IN DATABASE AND HAS BEEN ANALYZED.

--SKILLS USED: EXISTING TABLE, WINDOWS FUNCTIONS, AGGREGATE FUNCTIONS, WILD CARDS, LEFTJOINS & INNERJOINS, CASE STAEMENTS.

--EXAMPLE QUERY: GET DISTINCT STATE AND PRICE FROM HOUSEPRICES_USA THEN ORDER BY STATE
SELECT DISTINCT STATE, PRICE
FROM [dbo].[HOUSEPRICES_USA]
ORDER BY STATE

--EXAMPLE QUERY: SELECT MINPRICE FROM HOUSEPRICES_CA, HAVING MINPRICE GRT 500000, WHERE PROVINCE NOT LIKE 'O'
SELECT MIN(PRICE) AS MINPRICE, PROVINCE, CITY
FROM [dbo].[HOUSEPRICES_CA]
WHERE PROVINCE NOT LIKE '%O%'
GROUP BY PROVINCE, CITY
HAVING MIN(PRICE) > 500000
ORDER BY MIN(PRICE)

--EXAMPLE QUERY: TO SEE THE MINROOMS, MINBATH, PROVINCE, CITY AS ALIASED NAME FROM HOUSEPRICES_CA, GROUP BY PROVINCE, HAVING THE MINROOMS EQL 4, ORDER BY PROVINCE.
SELECT MIN(BEDROOMS) AS MINROOM, MIN(BATHROOMS) AS MINBATH, PROVINCE, CITY
FROM [dbo].[HOUSEPRICES_CA]
GROUP BY PROVINCE, CITY
HAVING MIN(BEDROOMS) = '4'
ORDER BY PROVINCE

--EXAMPLE QUERY: WHAT IS THE AVERAGE PRICE OF HOUSE IN USA YEAR BTWN 2015 AND 2016 GROUP BY HOUSEID TO GET FULL RESULTS. 
SELECT AVG(PRICE) AS AVG_PRICE
FROM [dbo].[HOUSEPRICES_USA]
WHERE YEAR BETWEEN '2015' AND '2020'
GROUP BY HOUSEID

--EXAMPLE QUERY: SELECT CANADA AND USA HOUSEPRICES, ALIAS BOTH NAMES, INNERJOIN BOTH TABLES, WHERE BOTH HOUSEPRICES GRTEQL 500000 ORDER BY CANADA PRICE
SELECT [dbo].[HOUSEPRICES_CA].PRICE AS HOUSEPRICE_CA, [dbo].[HOUSEPRICES_USA].PRICE AS HOUSEPRICE_USA
FROM [dbo].[HOUSEPRICES_CA] INNER JOIN [dbo].[HOUSEPRICES_USA]
ON [dbo].[HOUSEPRICES_CA].HOUSEID = [dbo].[HOUSEPRICES_USA].HOUSEID
WHERE [dbo].[HOUSEPRICES_CA].PRICE >= 500000 AND [dbo].[HOUSEPRICES_USA].PRICE >= 500000
ORDER BY [dbo].[HOUSEPRICES_CA].PRICE

--EXAMPLE QUERY:SELECT HOUSEID, STATE, CITY, HOUSETYPE, PROVINCE, PRICE, FROM HOUSEPRICES_USA AND HOUSEPRICES_CA, FULL JOIN BOTH TABLES, GIVE A CONDITION AND WHERE PRICE GRT 400000
SELECT [dbo].[HOUSEPRICES_USA].HOUSEID AS USAHOUSEID,[dbo].[HOUSEPRICES_USA].STATE AS USSTATES, [dbo].[HOUSEPRICES_USA].CITY AS USACITY, [dbo].[HOUSEPRICES_USA].HOUSETYPE AS USAHOUSETYPE, [dbo].[HOUSEPRICES_USA].PRICE AS USAPRICE,
[dbo].[HOUSEPRICES_CA].HOUSEID AS CAHOUSEID, [dbo].[HOUSEPRICES_CA].PROVINCE AS CAPROVINCE,
[dbo].[HOUSEPRICES_CA].CITY AS CACITY, [dbo].[HOUSEPRICES_CA].PRICE AS CAPRICE
FROM [dbo].[HOUSEPRICES_USA] FULL JOIN [dbo].[HOUSEPRICES_CA]
ON [dbo].[HOUSEPRICES_USA].HOUSEID = [dbo].[HOUSEPRICES_CA].HOUSEID
WHERE [dbo].[HOUSEPRICES_CA].PRICE > 400000 AND [dbo].[HOUSEPRICES_USA].PRICE > 400000

--EXAMPLE QUERY: CASE WHEN PRICE GRT AND EQL 300000 OR ELSE PRICE IS UNDER 300000, END RESULT TABLE ALIAS AS PRICECALC AND ORDER BY
SELECT HOUSEID, PRICE,
CASE
    WHEN PRICE > 300000 THEN 'THE PRICE IS GREATER THAN 300000'
    WHEN PRICE = 300000 THEN 'THE PRICE IS 300000'
    ELSE 'THE PRICE IS UNDER 300000'
END AS PRICECALC
FROM [dbo].[HOUSEPRICES_USA]
ORDER BY PRICECALC;

--EXAMPLE QUERY:GET THE FIFTH-HIGHEST PRICE AND HOUSEID FROM HOUSEPRICES_CA
SELECT TOP 1 PRICE, HOUSEID
FROM(
SELECT TOP 5 PRICE, HOUSEID
FROM [dbo].[HOUSEPRICES_CA]
ORDER BY PRICE DESC) AS PRICEDESC
ORDER BY PRICE ASC

--EXAMPLE QUERY: UNION HOUSEPRICES_USA AND HOUSEPRICES_CA BY SELECTING PRICE ALIAS AS USA_CA_PRICE, BEDROOMS, BATHROOMS, STATE AND PROVINCE ALIAS AS STATE_PROVINCE, ORDER BY STATE_PROVINCE
SELECT [dbo].[HOUSEPRICES_USA].PRICE AS USA_CA_PRICES, [dbo].[HOUSEPRICES_USA].BEDROOMS, [dbo].[HOUSEPRICES_USA].BATHROOMS, [dbo].[HOUSEPRICES_USA].STATE AS STATE_PROVINCE
FROM [dbo].[HOUSEPRICES_USA]
UNION ALL 
SELECT [dbo].[HOUSEPRICES_CA].PRICE AS CA_PRICE, [dbo].[HOUSEPRICES_CA].BEDROOMS, [dbo].[HOUSEPRICES_CA].BATHROOMS, [dbo].[HOUSEPRICES_CA].PROVINCE
FROM [dbo].[HOUSEPRICES_CA]
ORDER BY STATE


-- EXAMPLE QUERY; ACCESS ONLINE DATABASE Employment Growth from Industry Transitions GET RESULTS WHEN GROWTH RATE FOR EACH YEAR ABOVE 5%
SELECT country_code, country_name, wb_region, wb_income, isic_section_name, industry_name, MAX(growth_rate_2015) AS growth_2015 , MAX(growth_rate_2016) AS growth_2016 , MAX(growth_rate_2017) AS growth_2017, MAX(growth_rate_2018) AS growth_2018, MAX(growth_rate_2019) AS growth_2019
FROM public_use_industry_employment_growth 
GROUP BY country_code, country_name, wb_region, wb_income, isic_section_index, industry_name
HAVING MAX(growth_rate_2015) > '0.05' AND MAX(growth_rate_2016) > '0.05' AND MAX(growth_rate_2017) > '0.05' AND MAX(growth_rate_2018) > '0.05' AND MAX(growth_rate_2019) > '0.05'
ORDER BY country_name
LIMIT 5000


--EXAMPLE QUERY: CALCULATE PROFIT FOR HOUSEPRICES_USA
Select HOUSEID, STATE, CITY, BEDROOMS, BATHROOMS, YEAR, PRICE, PRICE*0.3 as PROFIT, ZIPCODE, HOUSETYPE
From [dbo].[HOUSEPRICES_USA]
ORDER BY HOUSEID

--EXAMPLE QUERY: CALCULATE DISCOUNT FOR HOUSEPRICES_USA
SELECT  HOUSEID, PROVINCE, CITY, BEDROOMS, BATHROOMS, PRICE, PRICE/200 AS DISCOUNT
FROM [dbo].[HOUSEPRICES_CA]
WHERE PROVINCE = 'ALBERTA'
GROUP BY HOUSEID, PROVINCE, CITY, BEDROOMS, BATHROOMS, PRICE
