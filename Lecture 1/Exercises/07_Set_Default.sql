ALTER TABLE minions_info
ALTER COLUMN age SET DEFAULT 0,
ALTER COLUMN age SET Not NULL;

ALTER TABLE minions_info
ALTER COLUMN name SET DEFAULT '',
ALTER COLUMN name SET Not NULL;

ALTER TABLE minions_info
ALTER COLUMN code SET DEFAULT '',
ALTER COLUMN code SET Not Null;