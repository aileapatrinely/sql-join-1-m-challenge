-- Instructions: Use a combination of aggregates, joins, 
-- limit and group by to complete the following SQL queries. 
-- Each query should have 10 or less rows as a result.

-- 1. Display the total number of countries in the country table.
SELECT count(*) FROM "country";
-- 2. Display the entire world population (research SUM). 
SELECT SUM("population")
FROM "country";
-- 3. Displays the name and population for the 10 countries with the highest population.
SELECT "name"
FROM "country"
ORDER BY "population" DESC
LIMIT 10;

-- 4. Displays the number of countries in each region.
SELECT "region".name, count(*) FROM "region"
JOIN "country" ON "country".region_id = "region".id
GROUP BY "region".name;

-- 5. Displays the total population for each region.
SELECT "region".name, SUM("population") FROM "region" 
JOIN "country" ON "country".region_id = "region".id
GROUP BY "region".name;

-- 6. Display the name and sq km for the 10 countries with the most land area (sort by land area).
SELECT "country".name, "land_area".sq_km FROM "country"
JOIN "land_area" ON "country".country_code="land_area".country_code
ORDER BY "land_area".sq_km DESC
LIMIT 10;

-- Stretch Mode

-- 7. Display the total land area for each region sorted by land area (requires two joins). 
SELECT "region".name, SUM("land_area".sq_km) FROM "region" 
JOIN "country" ON "country".region_id = "region".id
JOIN "land_area" ON "country".country_code="land_area".country_code
GROUP BY "region".name;

-- 8. Display the top 10 countries with the highest population density (greatest population per sq km).
SELECT "country".name, "country".population/"land_area".sq_km FROM "country"
JOIN "land_area" ON "country".country_code="land_area".country_code
ORDER BY "country".population/"land_area".sq_km DESC
LIMIT 10;


-- 9. Display the population density for each region (sort by population density).

SELECT "region".name, SUM("country".population/"land_area".sq_km) FROM "region" 
JOIN "country" ON "country".region_id = "region".id
JOIN "land_area" ON "country".country_code="land_area".country_code
GROUP BY "region".name;

-- 10. Display the population density for the 10 countries with the largest land area.