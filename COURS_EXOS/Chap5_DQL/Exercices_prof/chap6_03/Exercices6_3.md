!Modification de la table pilots pour ajouter la notion de lead pl : 

ALTER TABLE `pilots` ADD COLUMN `lead_pl` VARCHAR(6), ADD CONSTRAINT `fk_lead_pl` FOREIGN KEY(`lead_pl`) REFERENCES `pilots`(`certificate`) 
