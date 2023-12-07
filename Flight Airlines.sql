SELECT *
FROM flights


-- Top 10 airline with highest airline ticket price --

SELECT airline, MAX(price) AS highest_price
FROM flights
GROUP BY airline
ORDER BY highest_price DESC
LIMIT 10;

-- Top 10 airline with cheapest airline ticket price --

SELECT airline, MIN(price) AS cheapest_price
FROM flights
GROUP BY airline
ORDER BY cheapest_price ASC
LIMIT 10;

-- Calculate maximum duration rendered each flight --

SELECT MAX(dep_time - duration) AS max_duration
FROM flights;

