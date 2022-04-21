

--  Créez des dates aléatoires de +/- 3jours, par rapport à la date de naissance la plus récente de la table pilots.

-- SELECT DATE_ADD(birth_date, INTERVAL FLOOR(RAND()*15) DAY) 
-- FROM pilots 
-- WHERE birth_date = (SELECT max(birth_date) FROM pilots) LIMIT 1;

SELECT DATE_ADD(birth_date, INTERVAL ROUND((RAND()*6)-3) DAY)
FROM pilots 
WHERE birth_date = (SELECT max(birth_date) FROM pilots) LIMIT 1;