Contenu
------

- Philosophes : exemple de résolution du problème des philosophes avec un moniteur (de type Java 5).

- LectRed : le problème des lecteurs/rédacteurs.

- Alloc : le problème de l'allocateur de ressources.

Chaque sous-répertoire contient un fichier README, qui précise le travail à réaliser pour chacun de ces problèmes

Moniteurs en Java (rappel) :
--------------------

 - Créer un object de type java.util.concurrent.locks.Lock
   (à partir de java.util.concurrent.locks.ReentrantLock) :
   
      `mon_moniteur = new java.util.concurrent.locks.ReentrantLock();`
      
   Cet object réalise le moniteur en fournissant, par son utilisation
   explicite, l'exclusion mutuelle et permet de créer des
   variables-conditions associées au verrou.

 - Créer une ou des variables-conditions (java.util.concurrent.locks.Condition)
   à partir du "lock" précédemment créé :
   
       `ma_var_condition = mon_moniteur.newCondition();`

 - Les procédures doivent explicitement manipuler le verrou pour obtenir
   l'exclusion mutuelle :
   
    `ma_procédure() {`   
    `  mon_moniteur.lock();`     
       
    `     ...           `
    
    `  mon_moniteur.unlock(); `         
    `  }`

 - Les variables-conditions s'utilisent avec
 
       `ma_var_condition.await();`     
   et  
       `ma_var_condition.signal();`      
       `ma_var_condition.signalAll();`
   
 - La sémantique est celle de « priorité au signaleur » (= pas de priorité
   au signalé = pas de transfert de l'accès exclusif au processus débloqué).
   Il faut donc penser à utiliser des boucles "while" pour déterminer si les conditions 
   attendues sont effectivement vérifiées au moment du réveil.
