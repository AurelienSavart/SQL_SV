# DQL

MySQL est une base de données optimisée pour faire des requêtes DQL. Elles permettent d'extraire les données des tables. Nous verrons également que ceci est conditionné par une bonne définition des tables et des relations entre celles-ci.

Supposons que l'on ait une table pilots ayant les colonnes suivantes : name, num_flying, ...

Vous pouvez alors sélectionner l'ensemble des données de cette table à l'aide de la commande suivante, l'astérix désignera alors l'ensemble des colonnes :

```sql
SELECT * FROM pilots;
```

## Définition projection

Une projection extrait une ou plusieurs colonnes de la table :

```sql

-- on sélectionne uniquement la colonne name (projection)
SELECT `name` FROM pilots ;

-- on sélectionne deux colonnes
SELECT `name`, `certificate` FROM pilots ;
```

## Restriction

Pour faire une restriction on utilise le mot réservé **WHERE**. Il permet de restreindre l'extraction des données d'une table :

```sql
-- on sélectionne uniquement la ligne de la table pilots
-- ayant ici l'identifiant certificate unique ct-1
SELECT * FROM pilots WHERE certificate='ct-1' ;
```

MySQL lors d'un SELECT produira une pseudo-table, dans laquelle il extrait le résultat.

Bien sûr un SELECT peut produire plusieurs lignes avec une restriction WHERE :

```sql
-- Sélectionne toutes les lignes dont la colonne company = 'AUS'
SELECT * FROM pilots WHERE company='AUS' ;
```

## Structure de la commande SELECT

Il faut respecter l'ordre des clauses de la commande SELECT afin qu'elle puisse être correctement interprétée :

```sql
SELECT
    [DISTINCT] select_expression,...
    [FROM table_references
      [WHERE where_definition]
      [ORDER BY {nom_de_colonne } [ASC | DESC]]
      [LIMIT [offset,] lignes]
```

### DISTINCT

DISTINCT permet de ne pas inclure dans l'extraction des données des doublons. Ci-dessous on extrait uniquement les nombres de jours distincts de la table pilots :

```sql
SELECT DISTINCT num_jobs FROM pilots;
```

Attention si vous tapez la commande suivante cela extrait les couples distincts num_jobs, name :

```sql
SELECT DISTINCT num_jobs, name FROM pilots;
```

### Clause WHERE

On peut utiliser les opérateurs suivants :
=, <, >, <=, >=, <> (différent, qui peut également s'écrire **!=**)
Les opérateurs logiques **AND**, **OR**, **NOT**
Concordances de chaînes : **LIKE**
**IS NULL** teste si un champ n'a pas été affecté d'une valeur (NULL).
**BETWEEN** teste l'appartenance à un intervalle de valeurs : BETWEEN 1 AND 20
**IN** teste l'appartenance à un groupe de valeurs données : price IN (10, 8, 100)

### Clause ORDER

Ordre ASC ou DESC classe les résultats par ordre croissant ou décroissant.

### LIMIT start, length

start : offset,  length le nombre d'éléments du tableau.

## 01 Exercices

1. Sélectionnez tous les pilotes de la compagnie AUS

2. Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 15 heures de vol.

3. Sélectionnez les noms des pilotes de la compagnie FRE1 ayant fait plus de 20 heures de vol.

4. Sélectionnez les noms des pilotes de la compagnie FRE1 ou AUS ayant fait plus de 20 de vols.

5. Sélectionnez les noms des pilotes ayant fait entre 190 et 200 heures de vol.

6. Sélectionnez les noms des pilotes qui sont nés après 1978.

7. Sélectionnez les noms des pilotes qui sont nés avant 1978.

8. Sélectionnez les noms des pilotes qui sont nés entre 1978 et 2000.

9. Quels sont les pilotes qui ont un vol programmé après 2020-05-08 ?

10. Sélectionnez tous les noms des pilotes qui sont dans les compagnies : AUS et FRE1.

11. Sélectionnez tous les noms des pilotes qui ne travaillent pas pour les compagnies : AUS ou FRE1.

12. Sélectionnez tous les pilotes dont le nom de compagnie contient un A.

13. Sélectionnez tous les pilotes dont le nom de la compagnie commence par un F.

14. Sélectionnez tous les pilotes dont le nom de la compagnie contient un I suivi d'un caractère.

## 02 Exercice ajout d'un bonus

Ajoutez une colonne **bonus** à la table pilots, puis ajoutez le bonus 1000 pour les certificats 'ct-1', 'ct-11', 'ct-12', pour le certificat 'ct-56' un bonus de 2000 et pour tous les autres un bonus de 500.

## 03 Exercice meilleur bonus

Faites une requête permettant de sélectionner le pilote ayant eu le meilleur bonus. Vous pouvez utiliser la fonction max de MySQL.

## 04 Exercice heures de vol

Quelles sont les heures de vol distinctes dans la table pilots ?

## 05 Exercice moyenne des heures de vol

Combien de pilotes sont en-dessous de la moyenne d'heures de vol ?

## 06 Exercice fréquence

Calculez la fréquence des heures de vol de chaque pilote par rapport au total des heures de vol. Arrondissez le résultat à deux décimales après la virgule.

## 07 Exercice Regex

Récupérez tous les noms des pilotes dont le nom de leur(s) compagnie(s) se termine(nt) par R suivi de 2 caractères exactement.
