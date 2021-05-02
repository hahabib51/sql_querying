For this challenge you need to create a simple GROUP BY statement, 
you want to group all the people by 
their age and count the people who have the same age.

SELECT age, COUNT(*) AS people_count
FROM people
GROUP BY age
