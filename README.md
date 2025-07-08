# airbnb-nyc-sql-project
SQL- based exploratory data analysis on Airbnb NYC listings dataset

# 🏠 Airbnb NYC Data Analysis with SQL

## 🔍 Objective
Analyze Airbnb listings in New York City using SQL to uncover pricing patterns, host behaviors, — helping identify revenue potential and optimize listing strategies.

---

## 📊 Dataset
- **Source:** Kaggle – NYC Airbnb Open Data  
- **Size:** ~49,000 rows  
- **Key Columns:** `neighbourhood_group`, `room_type`, `price`, `availability_365`, `host_id`, `minimum_nights`

---

## ❓ Business Questions
1. What’s the average price across boroughs and room types?
2. Which Borough has the highest count of listings by borough & room type ?
3. Where are top 10 most expensive listings located?
4. Which hosts have the most listings?
5. Which neighborhoods have the highest average prices (with reliable sample size)?

---

## 🧠 SQL Analysis

### 📌 Query 1: Average Price by Room Type in Each Borough
```sql
SELECT
  neighbourhood_group AS borough,
  room_type,
  ROUND(AVG(price), 2) AS avg_price
FROM NYC_AIRBNB
GROUP BY borough, room_type
ORDER BY avg_price DESC;

Insight: Entire homes in Manhattan have the highest average price of about $ 252.68 , followed by Staten Island $ 223.76, Brooklyn $ 190.97.

Query 2: Count of Listings by Borough & Room Type

SELECT
  neighbourhood_group AS borough,
  room_type,
  COUNT(*) AS total_listings
FROM NYC_AIRBNB
GROUP BY borough, room_type
ORDER BY total_listings DESC;

Insight: Manhattan has the highest number of total listings, especially for private room. 

Query 3: Top 10 Most Expensive Listings

SELECT
  id,
  name,
  neighbourhood_group,
  neighbourhood,
  room_type,
  price
FROM NYC_AIRBNB
ORDER BY price DESC
LIMIT 10;

Insight: The most expensive listing is priced at $999/night .

Query 4: Top 10 Hosts with Most Listings

SELECT
  host_id,
  host_name,
  COUNT(*) AS listing_count
FROM NYC_AIRBNB
GROUP BY host_id, host_name
ORDER BY listing_count DESC
LIMIT 10;

Insight: The host named Vida manages the most listings with total 38 properties. This suggests small scale  commercial hosting , but not corporate level property management.

Query 5: Average Price per Neighborhood with >10 Listings)


SELECT
  neighbourhood,
  ROUND(AVG(price), 2) AS avg_price,
  COUNT(*) AS listing_count
FROM NYC_AIRBNB
GROUP BY neighbourhood
HAVING COUNT(*) > 10
ORDER BY avg_price DESC
LIMIT 10;

Insight: Neighborhoods like Little Italy, Flatiron District & Tribeca top the average price chart suggesting concentrated demand for premium stays.

Author

Tanya Singh

Aspiring Data Analyst | Researcher


