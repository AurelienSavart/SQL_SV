/*
Calculez la moyenne des vols pour chaque compagnie.

*/

SELECT AVG(num_flying), company FROM pilots
GROUP BY company;


/*

Calculez la moyenne des heures de vol des pilotes dont le bonus est de 500, par compagnie

*/

SELECT company, AVG(num_flying) FROM pilots
WHERE bonus = 500
GROUP BY company;

/*

Sélectionnez les compagnies et leur nombre de pilotes, ayant plus d'un pilote.

*/
SELECT company, COUNT(certificate)
FROM pilots 
GROUP BY company
HAVING COUNT(certificate) > 1;

/*
Nombre de pilotes par compagnie et par nombre d'heures de vol.
*/
SELECT company, plane, COUNT(certificate)
FROM pilots 
GROUP BY company, plane;

/*
Exercice ajout d'une colonne si ce n'est pas déjà fait (dans les exercices)
*/

ALTER TABLE pilots 
ADD COLUMN plane 
ENUM('A380', 'A320', 'A340') AFTER name;

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alan', 'Sophie', 'Albert', 'Benoit');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Tom', 'John', 'Pierre');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('Yan', 'Yi');

/*
Sélectionnez le nombre de pilotes par compagnie et par type d'avion.

*/

SELECT company, plane, COUNT(certificate)
FROM pilots
GROUP BY company, plane;


/*

Sélectionnez le noms des pilotes par bonus.

Sélectionnez le nom et la compagnie des pilotes par bonus.
*/

-- pas de virgule
SELECT bonus, GROUP_CONCAT(name SEPARATOR ' ')  FROM pilots GROUP BY bonus;

-- separtor par defaut ,
SELECT bonus, GROUP_CONCAT(name) FROM pilots GROUP BY bonus;

SELECT company, bonus, GROUP_CONCAT(`name`,' ', `company`)
FROM pilots GROUP BY company, bonus;


-- Attention vous avez également CONCAT qui permet de concaténer deux colonnes, ce n'est pas une fonction de 
-- regroupement

SELECT CONCAT(name, plane) from pilots;  -- sélectionne toutes les lignes

/*

Calculez l'étendue du nombre d'heures de vol par compagnie.

*/

SELECT company, MAX(num_flying) - MIN(num_flying)
FROM pilots GROUP BY company;

/*

- Faites la somme du nombre de jours de vol par compagnie
dont la somme est supérieure à 30.

*/

SELECT sum(num_jobs), company
FROM pilots GROUP BY company
HAVING sum(num_jobs) > 30;

SELECT ROUND( sum(num_flying/24), 1 ) as nbDay, company
FROM pilots GROUP BY company
HAVING nbDay > 30;


/*
Afficher la moyenne des heures de vol pour les compagnies qui sont en France.
*/

SELECT 
company, AVG(num_flying)
FROM pilots 
WHERE company IN ( SELECT comp FROM compagnies WHERE city="France"  )
GROUP BY company ;
