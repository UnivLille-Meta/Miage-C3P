# Rapport semaine 6

## Hammed ABASS

Cette semaine, j'ai continué le projet d'échecs et corrigé le problème de surlignage dont j'avais parlé dans le dernier rapport. L'état sélectionné garde maintenant les cases qu'il a surlignées pour pouvoir les nettoyer, même si le bouton Play a déplacé la pièce entre-temps.

J'ai ajouté la prise en passant. J'ai d'abord dû comprendre cette règle : après qu'un pawn adverse avance de deux cases, un pawn à côté peut le capturer en diagonale en arrivant sur une case vide. Cette capture doit être faite juste après ce déplacement. Il fallait aussi vérifier que cette capture ne laisse pas son propre king en échec.

J'ai ensuite repris les vérifications de `nil` quand un déplacement sort du plateau. J'ai utilisé le Null Object avec `MyOffBoardSquare`, qui représente une position en dehors du plateau. Ça simplifie les déplacements, notamment quand on enchaîne plusieurs directions.

Pour travailler la délégation, j'ai ajouté une stratégie qui préfère capturer une pièce quand c'est possible. Sinon, elle demande à la stratégie aléatoire de choisir. Je n'ai pas eu besoin de modifier `MyPlayer` ni de créer une sous-classe de joueur. Le bot reste simple : il ne cherche pas à savoir si la capture est un bon choix.

J'ai ajouté des tests pour ces comportements en regroupant les cas liés. Pour finir, j'ai chargé le projet dans une nouvelle image Pharo 13, relancé tous les tests et vérifié l'ouverture du jeu ainsi que les déplacements manuels et automatiques. Les 80 tests passent.

[Mon dépôt ChessPharo](https://github.com/AbassHammed/ChessPharo)
