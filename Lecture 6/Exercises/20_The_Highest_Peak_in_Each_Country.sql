WITH 
	"row_number" AS (
		SELECT
			c.country_name,
			COALESCE(p.peak_name, '(no highest peak)') as highest_peak_name,
			COALESCE(p.elevation, 0) AS highest_peak_elevation,
			COALESCE(m.mountain_range, '(no mountain)') as mountain,
			ROW_NUMBER() OVER (PARTITION BY c.country_name ORDER BY p.elevation DESC) AS row_nums
		FROM
			countries AS c
		LEFT JOIN mountains_countries as mc
			ON c.country_code = mc.country_code
		LEFT JOIN peaks as p
			ON mc.mountain_id = p.mountain_id
		LEFT JOIN mountains as m
			on m.id = p.mountain_id
	)
SELECT
	country_name,
	highest_peak_name,
	highest_peak_elevation,
	mountain
FROM 
	"row_number"
WHERE 
	row_nums = 1
ORDER BY
	country_name ASC,
	highest_peak_elevation DESC;