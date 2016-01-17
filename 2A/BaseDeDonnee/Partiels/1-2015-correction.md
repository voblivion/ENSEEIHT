# Examen de Base de Données 2015 Session 1 - Correction

Attention il se peut qu'il faille une dépendance multivaluée à la place de pseudonyme noir et pseudonyme blanc !

## Normalisation relationnelle

### Attributs
pseudonyme (pseudo), évaluation (eval), rapport temps (rappt), 
rapport nombre de coups (rappc), date, numéro d'ordre (num),
pseudonyme blanc (blanc), pseudonyme noir (noir), résultat (res),
numéro du coup (ncoup), numéro du demi coup (ndemi), case de départ (depart),
case d'arrivée (arrivee), note de pertinence (note),
interdiction de commentaire (interdiction), exclusion du site (exclusion),
poursuites judiciaires (poursuites)

### Dépendances
1. pseudo -> eval, note, interdiction, exclusion, poursuites
2. date, num -> blanc, noir, rappt, rappc, res
3. date, num, ncoup, ndemi -> depart, arrivee
4. date, num, ncoup, ndemi, pseudo -> commentaire

### Décomposition en FNBC
* 1 -> Joueur($pseudo, eval, note, ...)
* 2 -> Partie($date, $num, blanc, noirn rappt, rappc, res)
* 3 -> DemiCoup($date, $num, $ncoup, $ndemi, depart, arrivee)
* 4 -> Commentaire($date, $num, $ncoup, $ndemi, $pseudo, commentaire)

## Validation en SQL

### 1
```
SELECT
    P.noir
FROM
    Partie P,
    DemiCoup D
WHERE
    P.blanc = "Nimzowitch" AND
    D.depart = "g3" AND
    D.arrivee = "h1" AND
    P.date = D.date AND
    P.num = D.num
```
On peut éventuellement rajouter un "LIMIT 1" à la fin pour s'assurer de n'avoir
qu'un résultat.

### 2
```
SELECT
    C.commentaire,
    D.depart,
    D.arrivee
FROM
    (SELECT
            P.date,
            P.num
        FROM
            Partie P,
            DemiCoup D
        WHERE
            P.blanc = "Nimzowitch" AND
            D.depart = "g3" AND
            D.arrivee = "h1" AND
            P.date = D.date AND
            P.num = D.num
        LIMIT 1) P,
    DemiCoup D,
    Commentaire C
WHERE
    C.pseudo = "Le Lionnais" AND
    P.date = D.date AND P.num = D.num AND
    P.date = C.date AND P.num = C.num
ORDER BY
    ncoup ASC,
    ndemi ASC
```
Là la clause "LIMIT 1" est aussi facultative mais ça assure de n'avoir qu'une
partie. Sans ça il aurait aussi fallu ordonner selon l'identifiant de la partie.

### 3
```
SELECT
    rappt, rappc, COUNT(*) nbr
FROM
    Partie
GROUP BY
    rappt, rappc
ORDER BY
    nbr DESC
LIMIT 3
```
