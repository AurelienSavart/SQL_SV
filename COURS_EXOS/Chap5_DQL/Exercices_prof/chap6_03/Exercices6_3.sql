/* Modification de la table pilots pour ajouter la notion de lead pl : */

ALTER TABLE `pilots` ADD COLUMN `lead_pl` VARCHAR(6), ADD CONSTRAINT `fk_lead_pl` FOREIGN KEY(`lead_pl`) REFERENCES `pilots`(`certificate`) 

/* Ajout des leads pilots */
UPDATE pilots SET lead_pl = (SELECT ct FROM (SELECT certificate as ct FROM pilots WHERE name = 'Pierre') as p2) WHERE name IN ('Alan', 'Tom', 'Yi'); 
UPDATE pilots SET lead_pl = (SELECT ct FROM (SELECT certificate as ct FROM pilots WHERE name = 'John')as p2) WHERE name IN ('Sophie', 'Albert', 'Yan'); 

/* Sélection des pilotes qui n'ont pas de chef pilotes */
SELECT name FROM pilots WHERE lead_pl IS NULL; 

/*Sélection les certificats de pilotes et les companies pour lesquelles ils travaillent */
SELECT p.certificate, c.name FROM pilots as p INNER JOIN companies as c ON p.company = c.comp; 

/* Heures de vol des pilots de Austra air */
SELECT SUM(p.num_flying), p.`company` FROM `pilots` as p INNER JOIN companies ON p.company = compagnies.comp WHERE companies.name = 'AUSTRA Air';

/* Insertion de harry */
INSERT INTO pilots (name, certificate, bonus, birth_date) VALUES ('Harry','ct-19', 100, '2000-01-01 12:00:00' );

/* Sélection de tous les pilotes avec ou sans compagnie */
SELECT c.name AS company_name, p.certificate AS certificate, p.name AS pilot_name FROM pilots AS p LEFT OUTER JOIN companies AS c on c.comp=p.company; 
