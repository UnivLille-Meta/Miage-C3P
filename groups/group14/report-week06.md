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
- Relecture Double Dispatch et entrainement avec Rock-Paper-Scissors
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
