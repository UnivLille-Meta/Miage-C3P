# Rapport C3P semaine 6
## Ce que j'ai fait  
 
 Dans le projet Chess :
J'ai fini de refactorisé l'affichage.
(https://github.com/AxelDumon/Chess/commit/61229b1a214658e79b55305e38ba9e28cb878b71)

J'utilise pour cela une class BlackSquare & WhiteSquare héritant de MyChessSquare. Ces classes permettent les comportements suivant :
- choix de la casse selon la couleur pour éviter les conditions
- ajout des tests restant pour l'affichage
- suppression de méthodes désormais inutiles (toutes les méthodes renderKing, renderPawn etc)

J'ai ensuite implémenté tous les mouvements restant du pion, à savoir :
- Le en-passant que j'ai implémenté à l'aide d'une class MoveRecord qui va garder le dernier mouvement effectué sur un plateau en mémoire pour pouvoir résonner dessus plus facilement. Pour aller avec le MoveRecord j'ai mis au point une class NilRecord pour l'initialisation du Board lorsque aucun mouvement n'a encore été joué.
- La capture de pièces en diagonale
- Des tests pour complémenter les issues que je n'avais pas prévu et pour prévoir nouveaux comportements
 

## Ce que je n'ai pas fait  

- Retirer les Nils, j'ai tenté de les retirer en gardant la structure que j'avais actuellement mais en voulant appliquer la même logique de couleur à mes tuiles, j'obtenais une erreur que je n'ai pas su comprendre et j'ai donc décidé de me concentrer sur les mouvements de pion que j'avais déjà commencé.
- Les katas restant

## Les difficultés rencontrés

Je suis tombé sur une erreur super bizarre qui apparaissait seulement lorsque j'avais effectué un test au préalable, lors de l'exécution de l'initialisation du plateau avec ma nouvelle méthode de couleur pour les tuiles. Je voulais avoir une class de couleur, comme j'ai fait pour les pions, destinée à faciliter la mise en place d'une class NilSquare car celles-ci possèdent un affichage différent selon la couleur. Actuellement, j'ai une class BlackSquare, une WhiteSquare et une NilSquare et je trouvais ça peu pertinent étant donné que NilSquare possède une couleur et que celle-ci modifie le rendu. J'aurais dû seulement faire une WhiteNilSquare et une BlackNilSquare pour continuer dans ma logique, mais la solution ne me plaisait pas et j'ai donc passé de longs moments à essayer de comprendre pourquoi ça ne fonctionnait pas, mais sans succès.
