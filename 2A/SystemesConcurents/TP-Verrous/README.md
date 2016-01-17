Séquence vintage : synchronisation par verrous d'objet en Java
===================================

Objectif
--------

L'objectif de ce TP est de prendre connaissance du service de verrous basiques fourni par
l'environnement Java, d'en connaître le protocole d'usage, l'intérêt, les limites et 
les difficultés.

Le sujet technique sera la réalisation d'un schéma producteurs-consommateurs, basé sur
l'utilisation d'un tampon borné. En d'autres termes, il s'agira de proposer une 
implémentation pour la classe `ArrayBlockingQueue`, basée sur l'emploi de verrous.

Les verrous Java
----------------
Historiquement, il s'agit du premier outil de synchronisation proposé en Java, disponible
dès les premières versions du langage. Le service rendu, très élémentaire, s'avère pratique
et adapté pour exprimer l'exclusion mutuelle, ce qui fait qu'il reste largement utilisé,
même actuellement, car la simple exclusion mutuelle représente le schéma de synchronisation
le plus souvent rencontré. En revanche, il se révèle lourd et malcommode dès qu'il
s'agit de réaliser des schémas un peu plus évolués que l'exclusion mutuelle. D'où les objets
de synchronisation plus classiques et robustes apparus à partir de la version 5 de Java.

La rapide présentation qui suit porte essentiellement sur la syntaxe. Elle peut être 
complétée par la lecture de la partie correspondante du cours sur les processus légers 
(planches 30-34) pour les notions et sur la documentation Java en ligne pour les détails
techniques.

### Principe
**Tout objet** Java peut être utilisé comme un verrou pour contrôler l'accès à une section
 critique.
      
### Syntaxe
* Le mot-clé **`synchronized`** permet de définir très simplement une section critique
 contrôlée par (le verrou d')un objet `unObj`, avec la syntaxe suivante
 **`synchronized`** `(unObj) {
 		section critique
 	}`
 	
* Le mot-clé **`synchronized`** peut aussi être utilisé pour qualifier une méthode. Il indique
alors que la méthode sera exécutée en exclusion mutuelle, et que (le verrou de l'instance 
de) l'objet fournissant cette méthode est utilisé pour contrôler cette exclusion mutuelle.

* **Au sein d'un bloc `synchronized`** contrôlé par un objet `unObj`, il est possible de 
réaliser une synchronisation élémentaire au moyen des deux méthodes suivantes, fournies par
tout objet :
	- `unObj.wait()` libère l’accès exclusif à `unObj` et bloque l’activité appelante 
	en attente d’un réveil via une opération
	- `unObj.notify()` ou `unObj.notifyAll()` qui réveille une (ou toutes les) activité(s)
	bloquées sur `unObj.wait()` 
	- Remarques
		1. les activités réveillées par `notify` sont mises en attente du verrou et ne poursuivent
	effectivement qu'une fois celui-ci obtenu
		2. une activité en bloquée sur `wait` *peut* être réveillée spontanément... 
			Il est  donc conseillé que l'attente soit gardée par une condition logique, et que cette
	condition logique soit évaluée dans une boucle `while`, selon le schéma suivant :	
        `synchronized (obj) {	
             while ( condition invalide ) { unObjbj.wait(); }        
             <opérations à réaliser une fois la condition vérifiée >
         }` 

À faire
-------

Compléter la classe `TamponBorné` fournie, qui ne comporte aucune synchronisation, afin de 
gérer convenablement les accès concurrents.

- seules les méthodes `déposer` et `retirer` de la classe `TamponBorné` sont à modifier. Les
parties du code où l'on suggère d'intervenir sont signalées par un commentaire `//*** A compléter`
- le test intégré à l'application est conçu pour vérifier le comportement attendu suivant :

	* initialement, les consommateurs doivent attendre, car le tampon est vide
	* les consommateurs retirent des entiers différents, dans l'ordre croissant, 
		sans trous dans la numérotation
	* progressivement, de plus en plus de producteurs doivent attendre
	
Vous pouvez commencer par exécuter le code fourni sans synchronisation, et constater qu'il 
ne produit pas vraiment le comportement attendu...

- **Compilation** :  
        `javac ProdConso.java`  
         **Note** :  selon votre configuration, il est possible que le format par défaut 
        pour les fichiers source Java soit le format ASCII. Dans ce cas, des erreurs 
        apparaitront lors de la compilation des fichiers de l'archive, qui sont codés en UTF8.
        Pour remédier à cela, il est possible de positionner la variable d'environnement
         JAVA\_TOOL_OPTIONS (en bash : `export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8`), 
         ou encore de lancer la compilation avec l'option `-encoding UTF8`, ce qui donne ici :
        
        javac -encoding UTF8 ProdConso.java

- **Exécution** :  
        `java ProdConso`  
        `java ProdConso 8 10 5`  
