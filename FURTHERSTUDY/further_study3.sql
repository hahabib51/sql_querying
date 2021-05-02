FS3. Find all the apps that have more than 1 genre.

SELECT * FROM analytics 
  WHERE  array_length(genres, 1) = 2;