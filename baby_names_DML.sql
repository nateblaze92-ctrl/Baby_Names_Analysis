-- Exploring Data

SELECT * FROM regions;

SELECT * FROM names;

SELECT COUNT(DISTINCT name)
FROM names;
-- There are 22,240 unique names

SELECT COUNT (DISTINCT year)
FROM names;
-- Analysis is from 1980 to 2009 (30 years)

SELECT DISTINCT region
FROM regions;
-- There are six regions in the United States 
-- (Mountain, Pacific, Mid_Atlantic, South, Midwest, New-England)


-- Question 1: Total Child Birth
SELECT SUM(births) AS agg_births
FROM names;
--- Total birth is 98730863

-- Question 2: Total Female Child Birth
SELECT SUM(births) AS agg_female_births 
FROM names
WHERE gender = 'F';
--- Total female birth is 45856778

-- Question 3: Total Male Child Birth
SELECT SUM(births) AS agg_male_births 
FROM names
WHERE gender = 'M';
--- Total male birth is 52874085

--- Question 4: Top five names given to Female child
SELECT name, SUM(births) AS agg_births
FROM names
WHERE year BETWEEN 1980 AND 2009
      AND gender ='F'
GROUP BY name
ORDER BY agg_births DESC
LIMIT 5;
-- Jessica 863121, Ashley 786945, Jennifer 652244, Sarah 621174, Amanda 607253

--- Question 5: Least five names given to Female child
SELECT name, SUM(births) AS agg_births
FROM names
WHERE year BETWEEN 1980 AND 2009
      AND gender ='F'
GROUP BY name
ORDER BY agg_births ASC
LIMIT 5;
-- Celestia 5, Tyeesha 5, Emmajean 5, Skyllar 5, Breely 5

--- Question 6: Top five names given to Male child
SELECT name, SUM(births) AS agg_births
FROM names
WHERE year BETWEEN 1980 AND 2009
      AND gender ='M'
GROUP BY name
ORDER BY agg_births DESC
LIMIT 5;
-- Michael 1376418, Christopher 1118253, Matthew 1031984, 
-- Joshua 957518, Daniel 821281

--- Question 7: Least five names given to Male child
SELECT name, SUM(births) AS agg_births
FROM names
WHERE year BETWEEN 1980 AND 2009
      AND gender ='M'
GROUP BY name
ORDER BY agg_births ASC
LIMIT 5;
--- Jusiah 5, Evrett 5, Sophal 5, Kahne 5, Ryle 5

-- Question 8: Most Popular Name per decade
SELECT name, SUM(births) AS agg_births, (year / 10) * 10 AS decade  
FROM names
WHERE year BETWEEN 1980 AND 2009
GROUP BY decade, name
ORDER BY decade, agg_births DESC;
-- 1980 Michael 668414, 1990 Michael 463620, 2000 Jacob 273930

-- Question 9: Most Popular Name per decade for Female
SELECT name, SUM(births) AS agg_births, (year / 10) * 10 AS decade  
FROM names
WHERE gender = 'F'
AND year BETWEEN 1980 AND 2009
GROUP BY decade, name
ORDER BY decade, agg_births DESC;
-- 1980 Jessica 469452, 1990 Jessica 303079, 2000 Emily 223640

-- Question 10: Most Popular Name per decade for Male
SELECT name, SUM(births) AS agg_births, (year / 10) * 10 AS decade  
FROM names
WHERE gender = 'M'
AND year BETWEEN 1980 AND 2009
GROUP BY decade, name
ORDER BY decade, agg_births DESC;
-- 1980 Michael 663645, 1990 Michael 462302, 2000 Jacob 273746

-- Question 11: Most and Least Popular Name per region for female
SELECT regions.region, names.name, SUM(names.births) AS agg_births
FROM names
JOIN regions
ON names.state = regions.state
WHERE names.gender = 'F'
GROUP BY regions.region, names.name
ORDER BY regions.region, agg_births DESC;
-- Mid_Atlantic - Jessica 122614 Sharena 5, Midwest - Jessica 201936 Lennon 5, 
-- Mountain - Jessica 53767 Aila 5, New England - Jessica 42962 Niyah 5, 
-- Pacific - Jessica 145260 Maressa 5, South Ashley 304961 Parys 5
