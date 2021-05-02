FS4. Find all the apps that have education as one of their genres.

SELECT * FROM analytics 
  WHERE genres @> '{"Education"}';