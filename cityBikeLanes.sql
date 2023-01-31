/*
Let's say you work as a data analyst for your city, and your boss wants a list of all the bike lanes that 
have an average safety rating of 4.0 or higher. She also wants to see the average safety rating for each of 
those bike lanes, and a label that says "Safe Lane". 

How can you provide these results using a CTE?
*/
WITH safetyTableCTE AS (
    SELECT
        street,
        AVG(safetyrating) AS rating
    FROM CityBikeLanes
    WHERE safetyrating >= 4.0
    GROUP BY 1
    ORDER BY 2 DESC
    )
SELECT
    street,
    rating,
    'Safe Lane' AS label
FROM safetyTableCTE;