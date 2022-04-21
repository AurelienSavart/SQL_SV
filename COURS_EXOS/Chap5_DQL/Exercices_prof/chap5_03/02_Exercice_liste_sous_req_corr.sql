
/*
Ajoutez un champ last_name dans la table pilots.
*/

ALTER TABLE pilots
ADD last_name VARCHAR(100) AFTER name;


UPDATE `pilots` 
SET `last_name` = (
    CASE 
        WHEN name IN ('alan', 'yi', 'sophie') THEN 'Dupont'
        WHEN name IN ('yan', 'benoit') THEN 'chai'
        WHEN name IN ('john', 'pierre') THEN 'chai'
        WHEN name IN ('albert') THEN 'Pierre'
        ELSE 'Lu'
    END);


-- 1. Sélectionnez les adresses compagnies qui n'ont pas de pilotes, en utilisant une sous-requête corrélée.

SELECT name, CONCAT_WS( ' ', street, city, num_street ) as address
FROM companies as c  WHERE NOT EXISTS
( SELECT 1 FROM pilots as p WHERE p.company = c.comp ) ;

-- 2. Sélectionnez les adresses des compagnies qui ont des pilotes, en utilisant une sous-requête corrélée.

SELECT name, CONCAT_WS( ' ', street, city,  num_street ) as address
FROM companies as c  WHERE EXISTS
( SELECT 1 FROM pilots as p WHERE p.company = c.comp ) ;

-- 3. Sélectionnez les pilotes qui ont le même nom de famille en utilisant une sous-requête corrélée.

SELECT name, last_name
FROM pilots as p
WHERE last_name IN 
(SELECT last_name FROM pilots as pp 
WHERE p.certificate <> pp.certificate );

-- Il faut exclure de manière évidente les noms de famille des personnes qui n'ont pas le même nom.

-- On peut de manière équivalente écrire cette même requête comme suit

SELECT name, last_name
FROM pilots as p
WHERE EXISTS
(SELECT 1 FROM pilots as pp 
WHERE p.certificate <> pp.certificate AND p.last_name = pp.last_name);