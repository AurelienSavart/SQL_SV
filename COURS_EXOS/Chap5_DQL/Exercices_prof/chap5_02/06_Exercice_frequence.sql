
-- Calculez la fréquence des heures de vol de chaque pilote par rapport au total des heures de vol

SELECT ROUND( num_flying / (SELECT SUM(num_flying)  FROM pilots), 2 ) * 100 as fq_nb_flying
FROM pilots;