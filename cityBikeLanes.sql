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

-- Get street, safety rating by both techs, avg safety rating for the street, and then label for project status
-- >= 4 = leave as is
-- <= 2.5 = remove

SELECT 
    street,
    safetyrating,
    AVG(safetyrating) OVER(PARTITION BY street) AS 'avg safety rating',
    CASE
        WHEN AVG(safetyrating) OVER(PARTITION BY safetyrating) >= 4 THEN 'Leave As-Is'
        WHEN AVG(safetyrating) OVER(PARTITION BY safetyrating) < 2.5 THEN 'Remove'
        ELSE 'Improvements Needed'
    END AS 'recommendation'
FROM CityBikeLanes;