# Rapport semaine 4

## partie cours

Nous avons commencé le cours avec une explication sur le null object et l'emploi inutile des notNil, isNil, etc...
ça m'a permis de me rendre compte que je l'avais utilisé inutilement dans le projet du jeu d'echec.

Ensuite, nous avons vu le patron visiteur

## projet echec

J'ai commencé par corrigé mon emploi du Nil. En fait, je ne mets pas de valeur par défaut à mon attribut isMove, donc je vérifie avec isNil plutôt que simplement employer un boolean. la solution est simplement de retirer le "isMove isNil" (surtout que j'ai déjà mis le "isMove = false"), et initialiser par défaut l'attribut à false.

https://github.com/erdark/Chess/commit/b8ea278dd3fa85e9eed753463acfe0b4311a3021

Ensuite, je suis retourné voir mon pire ennemi, la prise en passant. Je commence par faire le test (en en profitant pour corriger une petite erreur, l'emploi de True à la place de true):

https://github.com/erdark/Chess/commit/bd5b8dc6a93687348ecb179ce4936ea10abf0e94

J'ai commencé l'implémentation en modifiant le plateau. Plutôt que l'information qu'une prise en passant soit rattaché au pion, il l'est sur la case du plateau (donc la classe MyChessBoard). Pour l'instant, il s'agit de simple assesseur.
J'ai modifié aussi la méthode targetSquaresLegal, pour permettre le déplacement en diagonal et la capture (auparavent, il n'y avait rien qui permettait aux pions de se déplacer en diagonal, donc les captures étaient impossibles). 
Pour savoir si une prise en en passant est possible, la méthode regarde la case en diagonale, si elle est marqué comme enPassantSquare, alors c'est possible. Cependant, pour faire tout ça, j'ai utilisé des notNil et ifNotNil. Je prévois de refactorer pour les remplacer plus tard.

https://github.com/erdark/Chess/commit/2bd1ee5cc050c0fce8b13ea294c4841f9cf6f677

Ensuite, j'ai surchargé la fonction moveTo dans MyPawn pour permettre d'intégrer le comportement de la prise en passant. Le test passe au vert !

https://github.com/erdark/Chess/commit/23c5d3fab7a04d2b503a5be3a7b13f4c46a87be9

Maintenant, je veux tenter d'implémenter le principe de double dispatch, en faisant du refactoring sur le rendu des pièces.
Pour se faire, je reprends une idée que j'ai entendu durant le cours, faire un dictionnaire associant les combinaisons de couleur au caractère correspondant. Ensuite, pour chaque pièce, je surcharge la méthode renderPieceOn, en appelant avec self le dictionnaire.

https://github.com/erdark/Chess/commit/134951a5a284f3a1e2c09c391c799668c62452cd

Cependant, cette solution n'est pas totalement optimale, car il y a répétition de code.




