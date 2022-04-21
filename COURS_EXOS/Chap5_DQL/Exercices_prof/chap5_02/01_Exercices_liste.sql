



-- 1 Sélectionnez tous les pilotes de la compagnie AUS
SELECT name FROM pilots WHERE company= "AUS";

-- 2. Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 15 heures de vol.

SELECT name FROM pilots WHERE company= "FRE1" AND num_flying > 15;

-- 3. Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 20 heures de vol.

SELECT name FROM pilots WHERE company= "FRE1" AND num_flying > 20 ;

-- 4. Sélectionnez les noms des pilotes de la compagnie FRE1 ou AUS ayant fait plus de 20 de vols.

SELECT name 
FROM pilots 
WHERE ( company= "FRE1" OR company = "AUS" ) AND num_flying > 20 ;

-- de manière équivalente avec un IN

SELECT name 
FROM pilots
WHERE  company IN ('FRE1','AUS') AND num_flying > 20;

-- 5. Sélectionnez les noms des pilotes ayant fait entre 190 et 200 heures de vol.
-- Attention le between est large il prend les "bornes" de l'intervalle.

SELECT name 
FROM pilots
WHERE num_flying BETWEEN 190 AND 200;

-- strictement 

SELECT name 
FROM pilots
WHERE num_flying > 190 AND num_flying < 200;

-- 6. Sélectionnez les noms des pilotes qui sont nés après 1978.

SELECT name, birth_date
FROM pilots
WHERE YEAR(birth_date) > '1978';

-- 7. Sélectionnez les noms des pilotes qui sont nés avant 1978.

SELECT name, birth_date
FROM pilots
WHERE YEAR(birth_date) < '1978';

-- 8. Sélectionnez les noms des pilotes qui sont nés entre 1978 et 2000.

SELECT name, birth_date
FROM pilots
WHERE YEAR(birth_date) > '1978' AND YEAR(birth_date) < '2000';

-- de manière équivalente

SELECT name, birth_date
FROM pilots
WHERE YEAR(birth_date) BETWEEN '1978' AND  '1999';

-- 9. Quels sont les pilotes qui ont un vol programmé après 2020-05-08 ?

SELECT name, next_flight
FROM pilots
WHERE next_flight > '2020-05-09';
-- si on mets 2020-05-08, l'heure sera à 00:00:00 et on obtiendra des résultats à la date du 2020-05-08 ceux vers 12:52:00
-- 2020-05-08 fonctionne si on souhaite tous les vols à partir du 2020-05-08 à minuit.

-- 10. Sélectionnez tous les noms des pilotes qui sont dans les compagnies : AUS et FRE1 (simultanément).

SELECT name FROM pilots WHERE company = 'AUS' AND company = 'FRE1';

-- On peut vérifier si il y en a dans l'une ou l'autre des deux compagnies : 

SELECT name FROM pilots WHERE company = 'AUS' OR company = 'FRE1';
-- identique à 
SELECT name FROM pilots WHERE company IN ( 'AUS', 'FRE1' );

-- 11. Sélectionnez tous les noms des pilotes qui ne travaillent pas pour les compagnies : AUS ou FRE1.

SELECT name FROM pilots WHERE company NOT IN ( 'AUS', 'FRE1' );
-- de manière équivalente
SELECT name FROM pilots WHERE company != 'AUS' AND company != 'FRE1';
SELECT name FROM pilots WHERE company <> 'AUS' AND company <> 'FRE1';

-- 12. Sélectionnez tous les des pilotes dont le nom de compagnie contient un A.

SELECT name, company
FROM pilots
WHERE company LIKE '%a%';

-- 13. Sélectionnez tous les pilotes dont le nom de la compagnie commence par un F.

SELECT name, company
FROM pilots
WHERE company LIKE 'f%';

-- 14. Sélectionnez tous les pilotes dont le nom de la compagnie contient un I suivi d'un caractère.

SELECT name,company
FROM pilots 
WHERE company LIKE '%i_';
