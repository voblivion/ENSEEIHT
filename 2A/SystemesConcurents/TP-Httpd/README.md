Serveur web concurrent
======================

Objectif
--------

L'objectif est de réaliser la partie multi-activités d'un serveur web.

On ne s'intéressera ni à la partie connexion (vue ultérieurement dans le
cours /intergiciels/), ni à l'aspect web/html (qui sera détaillé en
/applications sur internet/).

Le principe simplifié d'un serveur web est :

   1. recevoir une demande de connexion d'un client pour établir la
      communication entre ce client et le serveur
   2. recevoir une requête via ce lien de communication
   3. traiter cette requête
   4. renvoyer la réponse sur le lien de communication

Par exemple, lorsque l'on tape dans un navigateur l'URL
http://foo.com/bar.html

   1. la navigateur se connecte à la machine foo.com
   2. le navigateur envoie /bar.html
   3. le serveur traite cette demande (par exemple, il trouve un fichier
      bar.html)
   4. le serveur renvoie la réponse (sur cet exemple, le contenu de
      bar.html)


À faire
-------

Deux versions à réaliser :

* étape 1 : le serveur crée une activité pour chaque nouvelle connexion (= chaque demande de client).

* étape 2 : le serveur utilise un ensemble fixe d'activités (un pool de threads). 
  Un thread veilleur gère les demandes de connexion. Le veilleur et les activités du pool
  (les ouvriers) se coordonnent en suivant un *schéma producteurs-consommateurs* classique :
   quand le veilleur reçoit une demande de connexion, il la délègue à un ouvrier en la 
   déposant dans une file partagée entre les différentes activités ; chaque ouvrier, 
   lorsqu'il a fini de traiter une demande, extrait de la file la prochaine demande à traiter,
   ou attend si la file est vide.

Le code de traitement des requêtes est intégralement fourni.

Pour compiler :

`   javac *.java`

Pour exécuter (lancer un serveur) :
	
`   java Server` 
   
         lance un serveur avec création dynamique d'activités (étape 1)

`   java Server2`

         lance un serveur avec un pool de 2 activités (étape 2)

Une fois un serveur lancé, on peut demander à partir d'un navigateur :

* `http://localhost:5000/toto`

      => le serveur renvoie à peu de choses près la chaîne "toto".

* `http://localhost:5000/18` (ou tout autre nombre)

      => le serveur renvoie des numéros successifs, à la vitesse de un
      par seconde puis indique que c'est fini.
      
      [ attention : depuis un navigateur donné, il faut demander des url
      *différentes* simultanément dans plusieurs onglets ]


Classes
-------

* `LienCommunication.java` : fournit une interface simplifiée pour
les flux de communication entre client et serveur.
* `StupidHttpParser.java et ParseError.java` : le décodage des requêtes
      envoyées par un navigateur web.
* `TraitantConnexion.java` : le traitement d'une requête. Le traitement 
est très simple (génération d'une page html minimale, en réponse à la requête reçue).
* `Server.java` : la classe de base pour la version 1.
* `Server2.java` et `ThreadPool.java` : les classes pour la version 2.


Notes
-------

* Vous n'avez pas à comprendre ni à modifier `LienCommunication`,
      `StupidHttpParser` ni la méthode `gererRequete` de `TraitantConnexion`.
       Vous avez besoin d'intervenir dans `TraitantConnexion.java`, 
       dans `Server.java` puis `Server2.java` et `ThreadPool.java`.
       A chaque fois, les endroits où des modifications ou des compléments
       sont nécessaires dans ces 4 classes, sont signalés par un commentaire
       /* À COMPLÉTER * / ou /* À MODIFIER */
* Au cours des tests, lorsque vous corrigez le code d'un serveur,
      pensez à tuer le processus exécutant la version précédente du
      serveur, avant de lancer un processus exécutant la nouvelle
      version. En revanche, il est inutile de relancer le navigateur.
* Il est préconisé, pour faciliter les tests, d'utiliser *Firefox*, compte tenu
  de l'environnement des TPs. En effet, les pages renvoyées par le serveur 
  s'affichent de manière interactive avec Firefox et InternetExplorer, ce 
  qui est le comportement souhaité pour les tests. Par contre, elles sont 
  simplement téléchargées par Safari et Chrome (qui ignorent purement et
   simplement un certain nombre d'en-têtes  de gestion de l'affichage, 
   bien que ces en-têtes soient normalisés). Le test reste possible avec ces
   navigateurs, mais il peut être plus laborieux.
      
Bonus
-------
Les fournitures comportent une classe `Epreuve.java` qui illustre l'intérêt de
la régulation de l'activité d'un serveur via l'utilisation d'un pool d'activités
(par opposition à la création dynamique d'activités).

Cette application (très simple) vise à placer le serveur dans une situation 
de "déni de service", en l'inondant par un afflux massif de requêtes, de sorte
 qu'il s'écroule ou tombe en panne.
Cette application peut être lancée par la commande 

`   java Epreuve nbRequetes tempsDAttente` 
   
         qui envoie `nbRequetes` au serveur, puis attend `tempsDAttente` 
secondes (pour garder les connexions ouvertes)

Il est alors possible de tester la différence de comportement entre les 
deux versions du serveur.

La version régulée souffre cependant de limitations : en effet, en envoyant 
suffisamment de requêtes, il reste possible de saturer les ressources allouées au serveur : 
mémoire vive, nombre de connexions ouvertes..., 
car chaque requête mise en attente utilise un peu d'espace et nécessite de conserver un
descripteur de fichier ouvert (afin de pouvoir renvoyer une réponse).

Il est bien sûr possible de repousser ces limites, par exemple 

* en augmentant la taille de mémoire allouée au serveur (il suffit pour cela d'utiliser 
	l'option  `-Xmx` au lancement de la JVM : ainsi `java -Xmx200m Serveur` lance la première
	version du serveur, en lui allouant 200 Mo de mémoire),
* ou encore en ajustant les limites d'allocation de ressources aux processus 
	au niveau système (avec la commande `ulimit`, par exemple).
	
Ces expédients ne sont cependant satisfaisants, puisqu'en définitive, les ressources 
ne sont pas illimitées, et qu'il suffit donc d'augmenter le nombre de requêtes émises pour finir
par les épuiser.

Après avoir éprouvé les différentes versions du serveur pour différentes situations 
(nombre de requêtes, taille mémoire...), vous pouvez terminer ce TP en améliorant la 
robustesse de la seconde version, afin qu'elle puisse rester opérationnelle face à un
client comme  `Epreuve.java`.