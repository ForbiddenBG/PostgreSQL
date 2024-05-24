UPDATE
	countries
SET
	country_name = 'Burma'
WHERE
	country_name = 'Myanmar';

INSERT INTO
	monasteries(monastery_name, country_code)
VALUES
	('Hanga Abbey', 'TZ'),
	('Myin-Tin-Daik', 'MM');

SELECT
	co.continent_name,
	c.country_name,
	COUNT(m.monastery_name) AS monasteries_count
FROM
	continents AS co
JOIN
	countries AS c
ON
	co.continent_code = c.continent_code
JOIN
	monasteries AS m
ON
	m.country_code = c.country_code
WHERE
	c.three_rivers IS NULL
GROUP BY
	c.country_name,
	co.continent_name
ORDER BY
	monasteries_count DESC,
	c.country_name ASC;