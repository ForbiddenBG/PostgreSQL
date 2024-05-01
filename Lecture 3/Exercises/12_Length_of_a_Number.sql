SELECT
	population,
	LENGTH(CAST(population AS VARCHAR)) as length
FROM
	countries