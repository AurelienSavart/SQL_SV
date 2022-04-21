
-- 1. création de la table avec sa référence à la table compagnies.
DROP TABLE IF EXISTS sales;
CREATE TABLE `sales` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` DATE DEFAULT '1980-01-01',
    `company` CHAR(4),
    `profit` DECIMAL(15,2),
    CONSTRAINT pk_id PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

ALTER TABLE sales ADD CONSTRAINT fk_sales_company FOREIGN KEY (company) REFERENCES companies(`comp`);

-- 2. Création de la procédure donnée.

DELIMITER $$

DROP PROCEDURE IF EXISTS set_data$$
CREATE PROCEDURE set_data(IN  comp CHAR(4))
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE d DATE DEFAULT '1980-01-01';
  loop_data : LOOP

    IF (i = 20*12) THEN
        LEAVE loop_data;
    END IF;

    INSERT INTO 
    `sales` (created_at, company, profit) VALUES ( d, comp, ROUND(RAND()*15 * 100000, 2 ));

    SET d = DATE_ADD(d, INTERVAL 1 MONTH);
    SET i = 1 + i;
  END LOOP; 
END$$

DELIMITER ;

call set_data('AUS');
call set_data('CHI');
call set_data('SIN');
call set_data('FRE1');
call set_data('ITA');

-- deuxième version

DELIMITER $$

DROP PROCEDURE IF EXISTS set_data$$
CREATE PROCEDURE set_data()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE d DATE DEFAULT '1980-01-01';
  DROP TABLE IF EXISTS comp_companies;
  CREATE TEMPORARY TABLE comp_companies SELECT '1980-01-01' as c_at , comp, ROUND(RAND()*15 * 100000, 2 ) FROM companies;
  TRUNCATE TABLE sales;
  loop_data : LOOP

    IF (i =20*12) THEN
        LEAVE loop_data;
    END IF;

    INSERT INTO 
    `sales` (created_at, company, profit) SELECT
     DATE_ADD(c_at, INTERVAL i MONTH) , comp, ROUND(RAND()*15 * 100000, 2 )
     FROM comp_companies;

    SET i = 1 + i;
  END LOOP; 
END$$

DELIMITER ;