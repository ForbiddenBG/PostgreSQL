CREATE OR REPLACE PROCEDURE sp_deposit_money(
	account_id INT,
	amount_money NUMERIC(10, 4)
)
AS 
$$
	BEGIN
		UPDATE accounts
		SET balance = balance + amount_money
		WHERE id = account_id ;
		
		-- COMMIT
	END;
$$
LANGUAGE plpgsql;

-- 

SELECT 
	account_holder_id
	,balance
FROM accounts
	WHERE account_holder_id = 2
ORDER BY 
	account_holder_id ASC;

CALL sp_deposit_money(1, 200);
CALL sp_deposit_money(2, 500);
CALL sp_deposit_money(4, 1000);