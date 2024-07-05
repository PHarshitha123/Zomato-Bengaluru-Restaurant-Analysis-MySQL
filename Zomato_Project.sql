Use sql_Zomato_Project;

SELECT 
	*
FROM
	zomato;

-- 1. What are the Top 10 areas with restaurants concentration?

SELECT 
	area, count(*) AS No_Of_Restaurants
FROM
	zomato
GROUP BY area
ORDER BY No_Of_Restaurants DESC
Limit 10;


-- 2. What are the bottom 10 areas with the restaurant concentration?

SELECT 
	area, count(*) AS No_Of_Restaurants
FROM
	zomato
GROUP BY area
ORDER BY No_Of_Restaurants ASC
Limit 10;


-- 3. What is the Percentage of restaurants that have online order?

SELECT
  (COUNT(CASE WHEN online_order = 'yes' THEN 1 END) / COUNT(*)) * 100 AS percentage_online_orders
FROM zomato;


-- 4. What is the Percentage of restaurants that have table booking?

SELECT
  (COUNT(CASE WHEN Table_booking = 'yes' THEN 1 END) / COUNT(*)) * 100 AS percentage_table_booking
FROM zomato;


-- 5. What is the percentage of restaurants that have both online_order and table_booking
SELECT
	(COUNT(CASE WHEN Table_booking = 'yes' THEN 1 END 
	AND CASE WHEN online_order = 'yes' THEN 1 END) / COUNT(*)) * 100 AS '%_no_of_rest_online_table'
FROM 
	zomato;


-- 6. What is the most popular restaurant type in our dataset, and what percentage of restaurants does it represent?

SELECT
  RestaurantType,
  COUNT(*) AS number_of_restaurants,
  (COUNT(*) / (SELECT COUNT(*) FROM zomato)) * 100 AS percentage
FROM zomato
GROUP BY RestaurantType
ORDER BY number_of_restaurants DESC
LIMIT 5;


-- 7. Is there a particular cuisine type that dominates the area with the highest restaurant concentration? 

SELECT
  CuisinesType AS cuisine_type,
  COUNT(*) AS restaurant_count
FROM zomato
WHERE area = (
  SELECT area
  FROM zomato
  GROUP BY area
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
GROUP BY CuisinesType
ORDER BY restaurant_count DESC;

/* 8.What is the percentage of restaurants in our data that have an average cost between ₹300 and ₹500, 
and how many restaurants fall into this price range?*/

SELECT count(*) AS No_of_restaurants, (count(*)/(SELECT count(*) FROM zomato))*100 AS percentage_of_restaurants
FROM zomato
WHERE AvgCost BETWEEN 300 AND 500;

-- 9. What are the no of restaaurants with rating of 4 to 5?

SELECT count(*) As No_of_restaurants
FROM zomato
WHERE Rating BETWEEN 4 AND 5;

-- 10(a). What is Average rating for the restaurants with online_order ?

SELECT AVG(Rating) AS average_rating
FROM zomato
WHERE online_order = 'yes';

 -- 10(b). What is Average rating for the restaurants with table_booking ?

SELECT AVG(Rating) AS average_rating
FROM zomato
WHERE Table_booking = 'yes';

-- 10(c). What is the average rating for the restaurants?

SELECT AVG(Rating) AS average_rating
FROM zomato;





