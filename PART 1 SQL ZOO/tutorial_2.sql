SELECT from WORLD 

1.Observe the result of running this SQL command 
to show the name, continent and population of all countries.

SELECT name, continent, population FROM world;

name	    continent	population
Afghanistan	Asia	    25500100
Albania	    Europe	    2821977
Algeria	    Africa	    38700000
Andorra	    Europe  	76098
Angola	    Africa  	19183590
Antigua and 
Barbuda	    Caribbean	86295
Argentina	South
            America	    42669500
Armenia	    Eurasia	    3017400
Australia	Oceania	    23545500
Austria	    Europe	    8504850
Azerbaijan	Asia	    9477100
Bahamas	    Caribbean	351461
Bahrain	    Asia	    1234571
Bangladesh	Asia	    156557000
Barbados	Caribbean	285000
Belarus	    Europe	    9467000
Belgium	    Europe	    11198638
Belize  	North 
            America	    349728
Benin	    Africa	    9988068
Bhutan  	Asia	    749090
Bolivia	    South 
            America	    10027254
Bosnia and 
Herzegovina	Europe	    3791622
Botswana	Africa	    2024904
Brazil	    South 
            America	    202794000
Brunei	    Asia	    393162
Bulgaria	Europe	    7245677
Burkina 
Faso	    Africa	    17322796
Burundi	    Africa	    9420248
Cambodia	Asia	    15184116
Cameroon	Africa	    20386799
Canada	    North
            America	    35427524
Cape Verde	Africa	    491875
Central 
African 
Republic	Africa  	4709000
Chad	    Africa	    13211000
Chile	    South   
            America 	17773000
China	    Asia	    1365370000
Colombia	South 
            America	    47662000
Comoros	    Africa	    743798
Congo, 
Democratic 
Republic of	Africa	    69360000
Congo, 
Republic of	Africa	    4559000
Costa Rica	North
            America 	4667096
Côte 
d'Ivoire	Africa  	23919000
Croatia	    Europe	    4290612
Cuba	    Caribbean	11167325
Cyprus  	Asia	    865878
Czech 
Republic	Europe	    10517400
Denmark	    Europe	    5634437
Djibouti	Africa	    886000
Dominica	Caribbean	71293
Dominican 
Republic	Caribbean	9445281


2. Show the name for the countries that have a population of at least 200 million.

SELECT name FROM world WHERE population > 200000000;

name
Brazil
China
India
Indonesia
United States

3.Give the name and the per capita GDP
 for those countries with a population of at least 200 million.

 SELECT name, gdp/population FROM world WHERE population>200000000

 name	
Brazil  	11115.264751422625
China	    6121.710598592322
India	    1504.793124478397
Indonesia	3482.020488188676
United 
States	    51032.29454636844

4. Show the name and population in millions for the countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 FROM world WHERE continent = 'South America';

name	
Argentina	42.6695
Bolivia	    10.027254
Brazil  	202.794
Chile	    17.773
Colombia	47.662
Ecuador	    15.7742
Guyana	    0.784894
Paraguay	6.783374
Peru	    30.475144
Saint Vincent 
and the 
Grenadines	0.109
Suriname	0.534189
Uruguay	    3.286314
Venezuela	28.946101


5. Show the name and population for France, Germany, Italy

SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');

name	population
France	65906000
Germany	80716000
Italy	60782668

6. Show the countries which have a name that includes the word 'United'

SELECT name FROM world WHERE name LIKE '%united%';

name
United Arab Emirates
United Kingdom
United States


7. Show the countries that are big by area or big by population. 
Show name, population and area.

SELECT name, population, area FROM world 
WHERE area > 3000000 OR population > 250000000;

name	    population	area
Australia	23545500	7692024
Brazil	    202794000	8515767
Canada	    35427524	9984670
China	    1365370000	9596961
India	    1246160000	3166414
Indonesia	252164800	1904569
Russia	    146000000	17125242
United 
States	    318320000	9826675

8. Show the countries that are big by area (more than 3 million)
 or big by population (more than 250 million) but not both. 
Show name, population and area.

SELECT name, population, area FROM world 
WHERE (area > 3000000 AND population < 250000000) 
OR (population > 250000000 AND area < 3000000);

name	    population	area
Australia	23545500	7692024
Brazil  	202794000	8515767
Canada	    35427524	9984670
Indonesia	252164800	1904569
Russia	    146000000	17125242

9. For South America show population in millions 
and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) 
FROM world WHERE continent = 'South America';

name		
Argentina	42.67	477.03
Bolivia	    10.03	27.04
Brazil  	202.79	2254.11
Chile	    17.77	268.31
Colombia	47.66	369.81
Ecuador	    15.77	87.5
Guyana	    0.78	2.85
Paraguay	6.78	25.94
Peru	    30.48	204.68
Saint Vincent 
and the 
Grenadines	0.11	0.69
Suriname	0.53	5.01
Uruguay	    3.29	49.92
Venezuela	28.95	382.42

10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3) FROM world WHERE gdp > 1000000000000;

name	
Australia	66000
Brazil	    11000
Canada	    45000
China	    6000
France	    40000
Germany	    42000
India	    2000
Italy	    33000
Japan	    47000
Mexico  	10000
Russia	    14000
South 
Korea	    22000
Spain	    28000
United 
Kingdom	    39000
United 
States	    51000

11. Show the name and capital 
where the name and the capital have the same number of characters.

SELECT name, capital
  FROM world
 WHERE LEN(name) = LEN(capital);


name	    capital
Algeria 	Algiers
Angola  	Luanda
Armenia	    Yerevan
Botswana	Gaborone
Canada	    Ottowa
Djibouti	Djibouti
Egypt	    Cairo
Estonia	    Tallinn
Fiji	    Suva
Gambia	    Banjul
Georgia 	Tbilisi
Ghana	    Accra
Greece  	Athens
Luxembourg	Luxembourg
Mauritania	Nouakchott
Paraguay	Asunción
Peru	    Lima
Poland	    Warsaw
Russia	    Moscow
Rwanda  	Kigali
San Marino	San Marino
Singapore	Singapore
Taiwan	    Taipei
Togo	    Lomé
Turkey  	Ankara
Zambia  	Lusaka

12. Show the name and the capital where the first letters of each match. 
Don't include countries where the name and the capital are the same word.

SELECT name, capital
  FROM world
 WHERE LEFT(name, 1) = LEFT(capital, 1)
   AND name <> capital;

   13. Find the country that has all the vowels and no spaces in its name

   SELECT name
   FROM world
   WHERE name     LIKE '%a%'
   AND name     LIKE '%e%'
   AND name     LIKE '%i%'
   AND name     LIKE '%o%'
   AND name     LIKE '%u%'
   AND name NOT LIKE '% %';

   name
   Mozambique


