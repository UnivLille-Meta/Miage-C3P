# Rapport
> DEMORY Enzo - groupe 2 M1 MIAGE

## Semaine 3 :

### Description générale :

Cette semaine, j'ai fait l'exercice Stone Paper Scissors pour m'entrainer sur le double dispatch, puis j'ai commencer
Chess.


### Ce que j'ai appris :

#### Exercice Stone Paper Scissors :

L'exercice Stone Paper Scissors m'a permis de bien comprendre le double dispatch, comment il fonctionne et surtout 
comment l'implémenter. Il permet d'éliminer les blocs de conditions et de simplement envoyer un message à l'instance 
de l'élément passé en paramètre, qui va exécuter le comportement adéquat. Le seul reproche que je peux faire, c'est 
qu'avec trois éléments (Stone, Paper, Scissors) ça va, mais dès que le nombre d'éléments augmente, le nombre de méthodes
à écrire tend à augmenter de façon quadratique.


#### Chess :

J'ai commencé le kata "Fix pawn moves!" du projet Chess. La première étape a été de comprendre le code existant (
`MyPiece`, `MyPawn`, `MyChessBoard`, `MyChessSquare`). C'est d'ailleurs ce qui m'a pris le plus de temps. J'ai travaillé
en TDD, comme il n'existait aucun test pour les pions, j'ai créé une classe `MyPawnTests` et écrit 4 tests couvrant le 
déplacement d'un pion blanc et d'un pion noir, sur leur case de départ (une ou deux cases possibles) et hors de leur 
case de départ (une seule case). D'ailleurs, le code ne garde aucune trace du fait qu'un pion ait déjà bougé, il faut 
donc déduire le premier coup d'un pion uniquement à partir de sa position sur le plateau.

Je n'ai pas encore réussi à corriger le code. Pour la semaine prochaine, mon objectif est d'ajouter quelques tests 
supplémentaires pour les autres mouvements des pions, puis de corriger le code afin de finir le kata "Fix pawn moves!".


### Difficultés :

La principale difficulté a été de comprendre le fonctionnement du code existant de Chess, notamment comment était 
construit un plateau. Pour cela, l'inspecteur de Pharo a été d'une grande aide, car j'ai pu comprendre comment tout 
était organisé en construisant un plateau vide puis en l'inspectant.