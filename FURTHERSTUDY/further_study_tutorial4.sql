SELECT within SELECT

1. List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

      name
Bangladesh
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States

2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'


SELECT name
FROM world
WHERE gdp/population >
    (SELECT gdp/population FROM world WHERE name = 'United Kingdom') 
    AND continent = 'Europe'

name
Andorra
Austria
Belgium
Denmark
Finland
France
Germany
Iceland
Ireland
Liechtenstein
Luxembourg
Monaco
Netherlands
Norway
San Marino
Sweden
Switzerland

List the name and continent of countries in the continents containing 
either Argentina or Australia. Order by name of the country.

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

name	continent
Argentina	South America
Australia	Oceania
Bolivia	    South America
Brazil	    South America
Chile	    South America
Colombia	South America
Ecuador	    South America
Fiji	    Oceania
Guyana	    South America
Kiribati	Oceania
Marshall 
Islands	    Oceania
Micronesia, Federated 
States of	
Oceania 
Nauru	    Oceania
New Zealand	Oceania
Palau	    Oceania
Papua New 
Guinea	    Oceania
Paraguay	South America
Peru	    South America
Saint Vincent 
and the 
Grenadines  South America
Samoa	    Oceania
Solomon
 Islands	Oceania
Suriname	South America
Tonga	    Oceania
Tuvalu	    Oceania
Uruguay	    South America
Vanuatu	    Oceania
Venezuela	South America


4. Which country has a population that is more than 
Canada but less than Poland? Show the name and the population.

SELECT name, population
FROM world
WHERE population >
    (SELECT population FROM world WHERE name = 'Canada')
AND population <
    (SELECT population FROM world WHERE name = 'Poland')

name	population
Iraq	36004552
Sudan	37289406

5. Show the name and the population of each country in Europe. 
Show the population as a percentage of the population of Germany.

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany'), 0), %)
FROM world
WHERE continent = 'Europe'

SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany')) ,'%') FROM world WHERE continent ='Europe'




6.
Which countries have a GDP greater than every country in Europe? 
[Give the name only.] (Some countries may have NULL gdp values)

SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp >=0 AND continent = 'Europe') 
AND continent != 'Europe'

name
China
Japan
United States


7. Find the largest country (by area) in each continent, 
show the continent, the name and the area:

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
    WHERE y.continent=x.continent
    AND area>0)

continent	name	    area
Africa	    Algeria	    2381741
Oceania	    Australia	7692024
South America	Brazil	8515767
North America	Canada	9984670
Asia	    China	    9596961
Caribbean	Cuba	    109884
Europe	    Kazakhstan	2724900
Eurasia	    Russia	    17125242

8. List each continent and the name of the country that comes first alphabetically.

SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)

continent	    name
Africa	        Algeria
Asia	        Afghanistan
Caribbean	    Antigua and Barbuda
Eurasia	        Armenia
Europe	        Albania
North America	Belize
Oceania	        Australia
South America	Argentina

9. Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population.

SELECT name, continent, population
FROM world x
WHERE 25000000  > ALL(SELECT population FROM world y 
WHERE x.continent = y.continent AND y.population > 0)

name	            continent	population
Antigua and Barbuda	Caribbean	86295
Australia	        Oceania	    23545500
Bahamas	            Caribbean	351461
Barbados	        Caribbean	285000
Cuba	            Caribbean	11167325
Dominica	        Caribbean	71293
Dominican Republic	Caribbean	9445281
Fiji	            Oceania	    858038
Grenada	            Caribbean	103328
Haiti	            Caribbean	10413211
Jamaica	            Caribbean	2717991
Kiribati	        Oceania	    106461
Marshall Islands	Oceania	56086
Micronesia, 
Federated States of	Oceania	101351
Nauru	            Oceania	9945
New Zealand	        Oceania	4538520
Palau	            Oceania	20901
Papua New Guinea	Oceania	7398500
Saint Lucia	        Caribbean	180000
Samoa	            Oceania	187820
Solomon Islands	    Oceania	581344
Tonga	            Oceania	103036
Trinidad and Tobago	Caribbean	1328019
Tuvalu	            Oceania	11323
Vanuatu	            Oceania	264652


Some countries have populations more than three times that of any of their neighbours 
(in the same continent). Give the countries and continents.

SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3 FROM world y 
WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)

name	continent
Russia	Eurasia
Australia	Oceania
Brazil	South America