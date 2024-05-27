CREATE VIEW 
	continent_currency_usage 
AS
SELECT
	final_table.continent_code,
	final_table.currency_code,
	final_table.currency_usage
FROM
(
	SELECT 
		counted_table.continent_code,
		counted_table.currency_code,
		counted_table.currency_usage,
	DENSE_RANK() OVER (PARTITION BY counted_table.continent_code ORDER BY counted_table.currency_usage DESC) AS dense_rank
	FROM (
		SELECT
			continent_code,
			currency_code,
			count(currency_code) AS currency_usage
		FROM 
			countries	
		GROUP BY
			continent_code,
			currency_code
		HAVING
			COUNT(*) > 1
		) AS counted_table
) AS final_table
WHERE 
	final_table.dense_rank = 1
ORDER BY 
	final_table.currency_usage DESC;