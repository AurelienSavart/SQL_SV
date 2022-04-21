-- 1. Quelles sont les coordonnées des compagnies qui employent des pilotes faisant moins de 90 heures de vol ?

SELECT num_street,
       street,
       city
FROM compagnies
WHERE comp IN
        (SELECT company
         FROM pilots
         WHERE num_flying < 90 );

SELECT name, 
       CONCAT_WS(', ', num_street,
       street,
       city) as `address`
FROM compagnies
WHERE comp IN
        (SELECT company
         FROM pilots
         WHERE num_flying < 90 );

-- 2. Sélectionnez le pilote ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX.

-- PLUS GRAND ou égale
SELECT name, num_flying
FROM pilots
WHERE num_flying >= ALL ( SELECT num_flying FROM pilots );

-- Tous les nb d'heures de vol sauf le plus grand, seul le nb d'heures de vol le plus grand ne sera pas sélectionné.
SELECT name, num_flying
FROM pilots
WHERE num_flying < ANY ( SELECT num_flying FROM pilots );

-- 3. Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France, vous ne connaissez pas bien sûr la clef primaire de la compagnie.

SELECT sum(num_flying)
FROM pilots
WHERE certificate IN
        (SELECT certificate
         FROM pilots
         WHERE company IN
                 (SELECT comp
                  FROM compagnies
                  WHERE name='Air France' ) );

/*

-- 4. Ajoutez maintenant la compagnie suivante dans la table companies.

comp = ITA, street = mapoli, city = Rome, name = Italia Air, num_street =  20

Trouvez toutes les compagnies n'ayant pas de pilotes.
*/ 
INSERT INTO `companies`
SET `comp` = 'ITA', 
    `street` = 'mapoli', 
    `city` = 'Rome', 
    `name` = 'Italia Air',
    `num_street` = 20;


SELECT num_street,
       street,
       city
FROM companies
WHERE comp NOT IN
        (SELECT company
         FROM pilots);

-- 5. Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à tous les nombres d'heures de travail de la compagnie CHI.

SELECT name,
       company
FROM pilots
WHERE num_jobs < ALL
        (SELECT num_jobs
         FROM pilots
         WHERE company='CHI' );

/*
-- 6.
Sélectionnez la longueur des noms des pilotes dont la longueur de leurs noms est inférieur à toutes les longueurs des noms de la compagny FRE1.
*/
SELECT char_length(name), name,
       compagny
FROM pilots
WHERE char_length(name) < ALL
        ( select char_length(name)
         from pilots
         where compagny = 'FRE1' );

/*
-- 7. Ajoutez la colonne plane à la table pilots :
Sélectionnez les coordonnées des compagnies dont le nombre d'heures de vol est inférieur à tous les nombres d'heures de vol (chaque heure de vol) des A380.
*/

ALTER TABLE pilots
ADD COLUMN plane
ENUM('A380', 'A320', 'A340') AFTER name;

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alan', 'Sophie', 'Albert', 'Benoit');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Tom', 'John', 'Yi');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('Yan', 'Pierre');

SELECT name, num_street, street, city
FROM compagnies
WHERE comp IN(
    SELECT company
    FROM pilots
    WHERE num_flying < ALL (
        SELECT num_flying
        FROM pilots
        WHERE plane='A380'
    )
);
