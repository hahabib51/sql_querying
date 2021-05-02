FS2. Find all the apps that have a name similar to “facebook”.

SELECT * FROM analytics 
  WHERE app_name ILIKE '%facebook%';