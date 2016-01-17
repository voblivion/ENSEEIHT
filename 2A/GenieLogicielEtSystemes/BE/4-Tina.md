# Tina - TP4
## Exécutables
/mnt/n7fs/ens/tp\_pantel/tina-3.0.4
/mnt/n7fs/ens/tp\_pantel/tina-3.0.4/bin
## Réseau de Petri avec NetDraw
### Exemple de réseau de Petri
```
pl Hiver (1)
tr h2p Hiver -> Printemps
tr p2e Printemps -> Ete
tr e2a Ete -> Automne
tr a2h Automne -> Hiver
```
### Visualiser un réseau de Petri
[sh] -> "nd <file>.net"
[nd] -> edit -> draw -> neato | circo
### Animer un réseau de Petri
[nd] -> tools -> step simulator
## Model-checking avec selt
### Expression des propriétés sur réseau de Petri en LTL
```
[] <> Ete; # Toujours il y aura un été
. <> Ete; # Il n'y a pas d'été
```
### Vérification des propriétés
[sh] -> "tina <file>.net <file>.ktz"
[sh] -> "selt -S <file>.scn <file>.ktz -prelude <file>.ltl"
Contre exemple dans <file>.scn
### Graphe des marquages
[nd] -> tools -> reachability analysis
[] -> building(marking graph) + output(verbose | .aut) + OK
[nd] -> clic droit -> open in nd -> draw -> neato | circo
### Graphe de couverture
[nd] -> tools -> reachability analysis
[] -> building(coverability graph) + output(verbose)
[nd] -> click droit -> open in nd -> draw -> neato | circo

