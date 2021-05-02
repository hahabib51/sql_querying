1. Show the total population of the world.

SELECT SUM(population)
FROM world;

7118632738

2. List all the continents - just once each.

SELECT DISTINCT continent
FROM world;

continent
Africa
Asia
Caribbean
Eurasia
Europe
North America
Oceania
South America

3. Give the total GDP of Africa

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

1811788000000

4. How many countries have an area of at least 1000000

SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

28

5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');


6251750

6. For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

continent	
Africa	    53
Asia	    47
Caribbean	11
Eurasia 	2
Europe	    44
North 
    America	11
Oceania	    14
South 
    America	13

7. For each continent show the continent 
and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world 
WHERE population >= 10000000
GROUP BY continent;

continent	
Africa  	29
Asia	    26
Caribbean	2
Eurasia	    1
Europe	    14
North 
    America	4
Oceania	    1
South 
    America	8

8. List the continents that have a total population of at least 100 million.

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;


continent
Africa
Asia
Eurasia
Europe
North America
South America

