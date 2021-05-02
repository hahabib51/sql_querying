FS1. Find the name and rating of the top rated apps in each category, among apps that have been installed at least 50,000 times.

SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;