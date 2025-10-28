# Julien
- Lecture https://github.com/avl-univ-lille/testing/blob/2024/slides/M1-MutationAnalysis.pdf
- Relecture Double Dispatch

### Chess
- Refactor méthode pieces (Class MyPlayer)
- Ajout testRenderNilPiece
- Ajout classe MyNilSquare avec méthode up,down,left,down
- fix bug quand on selectionnait une case vide (N'affiche plus une pop-up d'erreur)

En cours refactor des méthodes dans le dossier MyPiece pour supprimer les nil en utilisant MyNilSquare

# Olivia
- Relecture Double Dispatch et entrainement avec Rock-Paper-Scissors [Lien github](https://github.com/olivia-lang/rock-paper-scissors)
- Lecture Visitor

## Chess
- Tests et refactoring pour implémenter le double dispatch sur toutes les pièces des échecs
Explications :
- Il y a maintenant une classe abstraite _MySquareColor_ afin de séparer les cases noires des cases blanches. Il y a donc deux sous-classes de _MySquareColor_ qui sont _MyWhiteSquare_ et _MyBlackSquare_.Avec l'exemple de la pièce Queen, ces classes ont la méthode _renderQueenOnSquare_. Dans les sous-classes, la méthode va appeler _renderQueenOnBlackSquare_ dans _MyBlackSquare_ et _renderQueenOnWhiteSquare_ dans _MyWhiteSquare_. Ces méthodes vont respectivement retourner le rendering correspondant selon si la pièce est blanche ou non :

```
MyQueen >> renderQueenOnBlackSquare
	^ self isWhite
		ifTrue: [ 'q' ]
		ifFalse: [ 'w' ]

MyQueen >> renderQueenOnWhiteSquare
	^ self isWhite
		ifTrue: [ 'Q' ]
		ifFalse: [ 'W' ]
```
Pour savoir de quelle couleur de square il s'agit, dans _MyChessSquare_, nous appelons la méthode _renderQueen_ qui selon sa couleur  va appeler _renderQueenOnSquare_ avec la pièce : 
```
MyChessSquare >> renderQueen: aPiece
  	^ self color renderQueenOnSquare: aPiece
```
Ainsi le double dispatch permet d'éviter d'avoir trop de conditionnels dans une méthode. Mais il est possible encore de réfactorer afin de supprimer tous les conditions, car il y en a encore, notamment dans les renderPiceOnColorSquare.

En cours : refactoring avec table dispatch

# Lan

### Chess
- ***Strategy Pattern***

To handle two different behaviors, I implemented the Strategy Pattern:

	- MyUIPromotion: Shows UI dialog for user selection
	- MyBotPromotion: Automatically selects Queen

This separates UI logic from game logic and allows runtime behavior switching.
- ***Template Method Pattern***
  
In `MyPiece`, I defined `checkForPromotion` with a default empty implementation. `MyPawn` overrides this to add promotion logic. This avoids conditional type checking (`if self class = MyPawn`).

- ***Implementation***
  
**Detection**

	- hasReachedPromotionRank: Checks if pawn is at rank 8 (white) or rank 1 (black)
	- shouldBePromoted: Business rule wrapper for promotion decision

**Triggering**

Modified `moveTo:` in `MyPiece` to call `checkForPromotion` after each move. Only `MyPawn` has actual promotion logic.

**Promotion Process**

`promotePawn:at:` in `MyChessGame:`

1. Asks strategy for piece class
2. Creates instance with correct color using `perform:` (dynamic dispatch)
3. Replaces pawn with new piece
4. Records promotion in move history

**Recording**

`recordPromotion:to:at:` formats promotion in standard chess notation (e.g., "15. e8=Q") and updates the moves display.
