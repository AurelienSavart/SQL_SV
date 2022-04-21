# Sous-requêtes

## Sous interrogations multilignes IN

- IN compare un élément à une donnée quelconque d'une liste ramenée par sous-interogations.

Vous pouvez effectuer en MySQL des sous-requêtes, attention cependant à mettre celles-ci dans des paranthèses, elles ne doivent pas comporter de clause ORDER BY :

```sql

SELECT colonne(s) FROM mytable1
WHERE colonne(s) IN (
  SELECT colonne(s) FROM mytable2
)
```

**Attention à la directive NOT IN, car elle retourne faux si un membre ramené par la sous-interrogation est NULL. Les atlernatives aux directives IN et NOT IN sont par exemple les JOINTURES.**

## Clause ALL

Cette commande s’utilise dans une clause conditionnelle entre l’opérateur de condition et la sous-requête. L’exemple ci-dessous montre un exemple basique :

```sql
SELECT *
FROM table1
WHERE condition > ALL (
    SELECT *
    FROM table2
    WHERE condition2
)
```

Cette clause s'utilise dans une sous-requête de manière identique à la clause IN. Elle permet de comparer une valeur dans l'ensemble de valeurs d'une sous-requête.

Ajoutez les données suivantes dans la table companies.

```sql

UPDATE companies
SET street = 'Shenton Park',
 city = 'Perth', 
 num_street=20
WHERE comp = 'AUS';

UPDATE companies
SET street = 'Rue de la Lieure',
 city = 'Voiron',
  num_street=11
WHERE comp = 'FRE1';

UPDATE companies
SET street = 'Qinghai',
 city = 'Xian de Tongde',
  num_street=17
WHERE comp = 'CHI';

UPDATE companies
SET street = 'Marymount',
 city = 'Singapour',
  num_street=1
WHERE comp = 'SIN';
```

## 01 Exercice liste

- 1. Quelles sont les coordonnées des compagnies qui employent des pilotes faisant moins de 90 heures de vol ?

- 2. Sélectionnez le pilote ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX. Puis sélectionnez les nombres d'heures de vol sauf le plus grand.

- 3. Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France. Bien sûr, vous ne connaissez pas la clef primaire de la compagnie.

- 4. Ajoutez maintenant la compagnie suivante dans la table companies :

comp = ITA, street = mapoli, city = Rome, name = Italia Air, num_street =  20

Trouvez toutes les compagnies n'ayant pas de pilotes.

- 5. Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à tous les nombres d'heures de travail de la compagnie CHI.

- 6. Sélectionnez la longueur des noms des pilotes dont la longueur de leurs noms est inférieur à toutes les longueurs des noms de la compagny FRE1.

- 7. Sélectionnez les coordonnées des compagnies dont le nombre d'heures de vol est inférieur à tous les nombres d'heures de vol (chaque heure de vol) des A380.
Ajoutez la colonne plane et les données suivantes dans la table pilotes.

```sql

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
```

## Sous-requête corrélées avec l'opérateur EXIST

Une sous-requête corrélée est une sous-requête qui contient une référence à une colonne qui est dans une requête différente.

Une sous-requête fait des appels en boucle, il faudra donc faire attention à son utilisation qui peut entrainer des temps d'exécution importants.

Très souvent la sous-requête corrélée est utilisée avec un test d'existance : l'opérateur EXISTS :

```sql
SELECT * FROM t1 WHERE column1 EXISTS
       (SELECT 1 FROM t2 WHERE t2.column2 = t1.column2);
```

### 02 Exercice sous-requête correlée

Ajoutez un champ last_name dans la table pilots.

Et ajoutez les noms suivants
```text
+--------+-----------+
| name   | last_name |
+--------+-----------+
| Alan   | Dupont    |
| Tom    | Lu        |
| Yi     | Dupont    |
| Sophie | Dupont    |
| Albert | Pierre    |
| Yan    | chai      |
| Benoit | chai      |
| John   | chai      |
| Pierre | chai      |
+--------+-----------+
````

- 1. Sélectionnez les adresses des compagnies qui n'ont pas de pilote en utilisant une sous-requête corrélée.

- 2. Sélectionnez les adresses des compagnies qui ont des pilotes en utilisant une sous-requête corrélée.

- 3. Sélectionnez les pilotes qui ont le même nom de famille en utilisant une sous-requête corrélée. Trouvez deux écritures à cette requête.