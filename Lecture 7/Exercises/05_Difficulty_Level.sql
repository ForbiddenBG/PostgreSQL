CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR(50)
AS
$$
	DECLARE
		dif_level VARCHAR(50);
	BEGIN
		IF (level <= 40) THEN
			dif_level := 'Normal Difficulty';
		ELSEIF (level > 40) AND (level <= 60) THEN
			dif_level := 'Nightmare Difficulty';
		ElSEIF (level > 60) THEN
			dif_level := 'Hell Difficulty';
		END IF;
		RETURN dif_level;
	END;
$$
LANGUAGE plpgsql;

SELECT 
	ug.user_id,
	ug.level,
	ug.cash,
	fn_difficulty_level(ug.level)

FROM 
	users_games AS ug

ORDER BY ug.user_id