CREATE FUNCTION fn_count_employees_by_town(town_name VARCHAR)
RETURNs INT AS
$$
	DECLARE
	town_count INT;
	BEGIN
		SELECT
			COUNT(*) AS count
		FROM
			employees AS e
			JOIN
				addresses AS a
				USING
					(address_id)
					JOIN
						towns As t
						USING
							(town_id)
		WHERE
			t.name = town_name
		INTO
			town_count;
		RETURN
			town_count;
	END;
$$
LANGUAGE plpgsql;