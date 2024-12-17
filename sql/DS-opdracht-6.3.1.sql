
SELECT *,
	CASE
    	WHEN name LIKE "\'%" THEN 
        CONCAT(
            LEFT(
                name, 3
            ),
            UPPER(
                SUBSTRING(
                    name, 4, 1
                )
            ),
            SUBSTRING(
                name, 5
            )
        )
        ELSE CONCAT(
            UPPER(
                LEFT(
                    name, 1
                )
            ),
            SUBSTRING(
                name, 2
            )
        )
    END AS 'nice_name'
FROM mhl_cities
ORDER BY name

/*
-- TIJDELIJKE TABEL 

CREATE TEMPORARY TABLE temp_table (id INT, nr INT, part VARCHAR(255));

-- OPSLAGPROCEDURE VOOR HET SPLITSEN VAN STRINGS
-- verander hetdelimiter-symbool
DELIMITER $$

-- maak een opgeslagen procedure om elke string in een kolom op te splitsen
CREATE PROCEDURE SplitStringInColumn()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE _id INT;
    DECLARE _part VARCHAR(255);
    DECLARE _nr INT;
    DECLARE cur CURSOR FOR SELECT id, name FROM mhl_cities;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
    	FETCH cur INTO _id, _part;
        
        IF done THEN
        	LEAVE read_loop;
        END IF;
        
        SET _nr = 1;
        WHILE LOCATE(' ', _part) > 0  OR LOCATE('-', _part) DO
            
            IF LOCATE(' ', _part) > 0 THEN
            	INSERT INTO temp_table (id, nr, part)
        		VALUES(_id, _nr, SUBSTRING_INDEX(_part, ' ', 1));
                SET _part = SUBSTRING(_part, LOCATE(' ', _part) + 1);
            ELSE 
            	INSERT INTO temp_table (id, nr, part)
        		VALUES(_id, _nr, SUBSTRING_INDEX(_part, ' ', 1));
                SET _part = SUBSTRING(_part, LOCATE('-', _part) + 1);
            END IF;
            
            SET _nr = _nr + 1;
        END WHILE;
        INSERT INTO temp_table (id, nr, part)
        VALUES (_id, _nr, _part);
    END LOOP; 
    CLOSE cur;
END $$

-- HERSTEL HET ORIGINELE DELIMITER-SYMBOOL
DELIMITER ;

-- ROEP DE OPGESLAGEN PROCEDURE AAN OM DE STIRNGS TE SPLITSEN
CALL SplitStringInColumn();

-- BEKIJK DE GESPLITSTE RESULTATEN
SELECT id, nr, part
FROM temp_table;

DROP PROCEDURE IF EXISTS SplitStringInColumn;


-- ------------------------------------------------

-- TIJDELIJKE TABEL 

CREATE TEMPORARY TABLE temp_table (id INT, nr INT, part VARCHAR(255));

-- OPSLAGPROCEDURE VOOR HET SPLITSEN VAN STRINGS
-- verander hetdelimiter-symbool
DELIMITER $$

-- maak een opgeslagen procedure om elke string in een kolom op te splitsen
CREATE PROCEDURE SplitStringInColumn()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE _id INT;
    DECLARE _part VARCHAR(255);
    DECLARE _nr INT;
    DECLARE cur CURSOR FOR SELECT id, name FROM mhl_suppliers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
    	FETCH cur INTO _id, _part;
        
        IF done THEN
        	LEAVE read_loop;
        END IF;
        
        SET _nr = 1;
        WHILE LOCATE(' ', _part) > 0 DO
        	INSERT INTO temp_table (id, nr, part)
        	VALUES(_id, _nr, SUBSTRING_INDEX(_part, ' ', 1));
        	SET _part = SUBSTRING(_part, LOCATE(' ', _part) + 1);
            SET _nr = _nr + 1;
        END WHILE;
        INSERT INTO temp_table (id, nr, part)
        VALUES (_id, _nr, _part);
    END LOOP; 
    CLOSE cur;
END $$

-- HERSTEL HET ORIGINELE DELIMITER-SYMBOOL
DELIMITER;

-- ROEP DE OPGESLAGEN PROCEDURE AAN OM DE STIRNGS TE SPLITSEN
CALL SplitStringInColumn();

-- BEKIJK DE GESPLITSTE RESULTATEN
SELECT id, nr, part
FROM temp_table;

DROP PROCEDURE IF EXISTS SplitStringInColumn;

*/