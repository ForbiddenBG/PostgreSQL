CREATE OR REPLACE FUNCTION fn_is_word_comprised(
	set_of_letters VARCHAR(50),
	word VARCHAR(50)
	)
RETURNS BOOLEAN
AS
$$	
	DECLARE
		i INT;
		letter VARCHAR;
	BEGIN
		FOR i IN 1..length(word) LOOP
			letter := substring(lower(word), i, 1);
			IF position(letter IN lower(set_of_letters)) = 0 THEN
				RETURN FALSE;
			END IF;
		END LOOP;
		
		RETURN TRUE;
	END;
$$
LANGUAGE plpgsql;