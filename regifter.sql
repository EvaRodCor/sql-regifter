-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id serial primary KEY, gift TEXT, giver TEXT, value INTEGER, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 

SELECT * FROM gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 

ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted) VALUES ('peach candle', 'Santa', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

-- INSERT INTO gifts (gift, giver, value, previously_regifted)
-- VALUES
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;

INSERT INTO gifts (gift, giver, value, previously_regifted) 
VALUES ('cinnamon candle', 'Nick', 19, TRUE),
('soap on a rope', 'Rudold', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
('mango candle', 'The Boss', 49, FALSE);

SELECT * FROM gifts;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES ('rose water candle', 'valeria', 20, FALSE),
('clear mind candles', 'santiago', 15, FALSE),
('colorful mind candle', 'sebastian', 25, TRUE),
('playful candle', 'valentina', 20, TRUE),
('bright and glowing candle', 'carmen', 15, FALSE);

SELECT * FROM gifts;

--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts WHERE value <= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--

SELECT gift FROM gifts WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--

SELECT * FROM gifts WHERE giver LIKE '%Santa%' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT * FROM gifts WHERE giver NOT LIKE '%Santa%';

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--

UPDATE gifts SET value = 2999 WHERE id = 2 RETURNING *;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

-- BONUSES

--
\echo Count the total number of gifts that have the word candle in it
-- 

SELECT COUNT(DISTINCT gift) FROM gifts WHERE gift LIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--

SELECT AVG(value) FROM gifts;

-- 
\echo Limit to 3 gifts, offset by 2 and order by price descending
--

SELECT gift FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 1; 

--
-- finish
--
DROP TABLE IF EXISTS gifts;
