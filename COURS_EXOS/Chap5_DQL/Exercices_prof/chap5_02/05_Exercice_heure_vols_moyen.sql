/*
Combien de pilotes sont en-dessous de la moyenne d'heures de vol ?
*/

SELECT COUNT(name)
FROM pilots
WHERE num_flying < (SELECT AVG(num_flying) FROM pilots);