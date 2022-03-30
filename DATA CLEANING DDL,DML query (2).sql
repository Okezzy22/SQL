--EXAMPLE QUERY: TO ADD NEW COLUMNS INTO HOUSEPRICES_USA TABLE AND ADD DATA INTO NEW COLUMN
ALTER TABLE [dbo].[HOUSEPRICES_USA]
ADD HOUSETYPE VARCHAR(30)

--EXAMPLE QUERY: DELETE ALL COLUMNS TO INSERT NEW DATA
DELETE FROM [dbo].[HOUSEPRICES_USA] 
WHERE HOUSEID >= 112

--EXAMPLE QUERY: UPDATE DATA INTO NEW CREATED COLUMN BY USING PREVIOUS SQL QUERY
INSERT INTO HOUSEPRICES_USA VALUES (112, 'ALABAMA', 'AUBURN', 4, 3, 2019, $275000, 36117, 'TOWNHOUSE')
INSERT INTO HOUSEPRICES_USA VALUES (113, 'TEXAS', 'FORT-WORTH', 5, 5, 2018, $54000, 77053, 'VICTORIAN')
INSERT INTO HOUSEPRICES_USA VALUES (114, 'TEXAS', 'HOUSTON', 7, 5, 2019, $133000, 77001, 'BUNGALOW')
INSERT INTO HOUSEPRICES_USA VALUES (115, 'OKLAHOMA', 'TULSA', 5,4, 2002, $185200, 73013, 'AMERICANCRAFTSMANN')
INSERT INTO HOUSEPRICES_USA VALUES (116, 'CALIFORNIA','LONGBEACH', 7, 5, 2013, $255000, 90717, 'RANCHSTYLE')
INSERT INTO HOUSEPRICES_USA VALUES (117, 'COLORADO', 'DENVER', 3, 2, 2018, $192715, 80201, 'FARMHOUSE')
INSERT INTO HOUSEPRICES_USA VALUES (118, 'CALIFORNIA', 'LOSANGELES', 8, 6, 2017, $7000000, 94204, 'CONTEMPORARY')
INSERT INTO HOUSEPRICES_USA VALUES (119, 'NEWYORK', 'BROOKLYN', 5, 4, 2013, $825034, 12301, 'CONTEMPORARY')
INSERT INTO HOUSEPRICES_USA VALUES (120, 'MASSACHUSETTS', 'BOSTON', 4, 3, 2015, $720000, 02108, 'MID-CENTURY CONTEMPORAY')
INSERT INTO HOUSEPRICES_USA VALUES (121, 'MONTANA', 'HELANA', 5, 4, 2018, $712302, 59601, 'MEDITTERANEAN')
INSERT INTO HOUSEPRICES_USA VALUES (122, 'NORTHCAROLINA', 'CHARLOTTE', 5, 5, 2017, $652521, 27601, 'CONTEMPORARY')
INSERT INTO HOUSEPRICES_USA VALUES (123, 'NEWYORK', 'NEWYORKCITY', 3, 3, $2005, 421400, 12251, 'VICTORIAN')
INSERT INTO HOUSEPRICES_USA VALUES (124, 'TEXAS', 'DALLAS', 5, 4, 2020, $520305, 75302, 'MEDITERRANEAN')
INSERT INTO HOUSEPRICES_USA VALUES (125, 'GEORGIA', 'ATLANTA', 6, 5, 2016, $855423, 30301, 'AMERICAN CRAFTSMAN')
INSERT INTO HOUSEPRICES_USA VALUES (126, 'COLORADO', 'DENVER', 5, 5, 2016, $754321, 80223, 'CONTEMPORARY')
INSERT INTO HOUSEPRICES_USA VALUES (127, 'MARYLAND', 'ANNAPOLIS', 4, 3, 2015, $337255, 21401, 'TUDOR')
INSERT INTO HOUSEPRICES_USA VALUES (128, 'FLORIDA', 'MIAMI', 5, 4, 2010, $2500000, 32301, 'PENTHOUSE')
INSERT INTO HOUSEPRICES_USA VALUES (129, 'CALIFORNIA', 'LONGBEACH', 4, 3, 2009, $460053, 94225, 'RANCH')
INSERT INTO HOUSEPRICES_USA VALUES (130, 'GEORGIA', 'ATLANTA', 5, 4, 2018, $645500, 30302, 'VICTORIAN')

-- EXAMPLE QUERY: DELETING MULTIPLE ROWS SHOWING THE COUNT RESULTS 
SELECT [HOUSEID], 
    [STATE], 
    [CITY], 
	[BEDROOMS],
	[BATHROOMS],
	[YEAR],
	[ZIPCODE],
	[HOUSETYPE],

COUNT(*) AS CNT
FROM [dbo].[HOUSEPRICES_USA]
GROUP BY [HOUSEID], 
    [STATE], 
    [CITY], 
	[BEDROOMS],
	[BATHROOMS],
	[YEAR],
	[ZIPCODE],
	[HOUSETYPE]
HAVING COUNT(*) > 1

--EXAMPLE QUERY: DROP TABLE 
DROP TABLE HOUSEPRICES_USA





