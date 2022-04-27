/* Modification de la table pilots pour ajouter la notion de lead pl : */

ALTER TABLE `pilots` ADD COLUMN `lead_pl` VARCHAR(6), ADD CONSTRAINT `fk_lead_pl` FOREIGN KEY(`lead_pl`) REFERENCES `pilots`(`certificate`) 

/* Ajout des leads pilots */
UPDATE pilots SET lead_pl = (SELECT ct FROM (SELECT certificate as ct FROM pilots WHERE name = 'Pierre') as p2) WHERE name IN ('Alan', 'Tom', 'Yi'); 
UPDATE pilots SET lead_pl = (SELECT ct FROM (SELECT certificate as ct FROM pilots WHERE name = 'John')as p2) WHERE name IN ('Sophie', 'Albert', 'Yan'); 
