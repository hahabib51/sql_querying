SELECT names 

1. Find the country that start with Y

SELECT name FROM world WHERE name LIKE 'Y%';

name
Yemen

2. Find the countries that end with y

name
Germany
Hungary
Italy
Norway
Paraguay
Turkey
Uruguay
Vatican City

3. Find the countries that contain the letter x

SELECT name FROM world WHERE name LIKE '%x%';

name
Luxembourg
Mexico

4. Find the countries that end with land

SELECT name FROM world WHERE name LIKE '%land';

name
Finland
Iceland
Ireland
New Zealand
Poland
Swaziland
Switzerland
Thailand

5. Find the countries that start with C and end with ia

SELECT name FROM world WHERE name LIKE 'C%%ia';

name
Cambodia
Colombia
Croatia

6. Find the country that has oo in the name

SELECT name FROM world WHERE name LIKE '%oo%';

name
Cameroon

7. Find the countries that have three or more a in the name

SELECT name FROM world WHERE name LIKE'%a%a%a%';

name
Afghanistan
Albania
Antigua and Barbuda
Australia
Azerbaijan
Bahamas
Bosnia and Herzegovina
Canada
Central African Republic
Equatorial Guinea
Guatemala
Jamaica
Kazakhstan
Madagascar
Malaysia
Marshall Islands
Mauritania
Micronesia, Federated States of
Nicaragua
Panama
Papua New Guinea
Paraguay
Saint Vincent and the Grenadines
Saudi Arabia
Tanzania
Trinidad and Tobago
United Arab Emirates

8. Find the countries that have "t" as the second character.

SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name;

name
Ethiopia
Italy

9. Find the countries that have two "o" characters separated by two others.

SELECT name FROM world WHERE name LIKE '%o__o%';

name
Congo, Democratic Republic of
Congo, Republic of
Lesotho
Moldova
Mongolia
Morocco
Sao Tomé and Príncipe

10. Find the countries that have exactly four characters.

SELECT name FROM world WHERE name LIKE '____';

name
Chad
Cuba
Fiji
Iran
Iraq
Laos
Mali
Oman
Peru
Togo

11. Find the country where the name is the capital city.

SELECT name FROM world WHERE name = capital;

name
Djibouti
Luxembourg
San Marino
Singapore

12. Find the country where the capital is the country plus "City".

SELECT name FROM world WHERE capital = concat(name, ' City');

name
Guatemala
Kuwait
Mexico
Panama

13. Find the capital and the name where the capital includes the name of the country.

SELECT capital,name FROM world WHERE capital LIKE concat('%', name, '%');

capital	            name
Andorra la Vella	Andorra
Djibouti	        Djibouti
Guatemala City	    Guatemala
Kuwait City	        Kuwait
Luxembourg	        Luxembourg
Mexico City	        Mexico
Monaco-Ville       	Monaco
Panama City	        Panama
San Marino	        San Marino
Singapore	        Singapore

14.Find the capital and the name where the capital 
is an extension of name of the country.
You should include Mexico City as it is longer than Mexico. 
You should not include Luxembourg as the capital is the same as the country.

SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%') AND capital > name;
capital	            name
Andorra la Vella	Andorra
Guatemala City	    Guatemala
Kuwait City	        Kuwait
Mexico City     	Mexico
Monaco-Ville	    Monaco
Panama City	        Panama

15. Show the name and the extension
 where the capital is an extension of name of the country.

SELECT name, REPLACE(capital, name, '') FROM world 
WHERE capital LIKE concat('%', name, '%') AND capital > name;


 name	
Andorra	la Vella
Guatemala	City
Kuwait	City
Mexico	City
Monaco	-Ville
Panama	City


