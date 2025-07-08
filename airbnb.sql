QUERY 1 :Average Price by Room Type in each Borough


SELECT 
neighbourhood_group AS borough,
room_type,
ROUND(AVG(price),2) AS avg_price
FROM NYCAIRBNB
GROUP by borough, room_type
ORDER BY avg_price DESC;

QUERY2 : Count of Listings by Borough & Room Type

SELECT
 neighbourhood_group as borough,
 room_type,
 COUNT(*)AS total_listings
 FROM NYCAIRBNB
 GROUP BY borough,room_type
 ORDER BY total_listings DESC


QUERY3 : Top 10 Most Expensive Listings
 
 SELECT 
 id,
 name,
 neighbourhood_group,
 neighbourhood,
 room_type,
 price
 FROM NYCAIRBNB
 ORDER BY price DESC
 LIMIT 10;
 
QUERY 4 : Top 10 Hosts with Most Listings
 SELECT
 host_id,
 host_name,
 COUNT(*)AS listing_count
 FROM NYCAIRBNB
 GROUP BY host_id,host_name
 ORDER BY listing_count DESC
 LIMIT 10;

 
QUERY 5 : Average Price per Neighborhood( with >10 Listings)
 SELECT
 neighbourhood,
 ROUND(AVG(price),2) AS avg_price,
 COUNT(*) AS listing_count
 FROM NYCAIRBNB
 GROUP BY neighbourhood
 HAVING COUNT(*)>10
 ORDER BY avg_price DESC
 LIMIT 10;
 
 
 
