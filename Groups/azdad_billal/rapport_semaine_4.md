### Semaine 4

### Révision du cours

Cette semaine, j'ai poursuivi en regardant les deux vidéos traitant de la refactorisation. Il faut savoir que j'avais l'habitude de modifier mon code de manière un peu directe,
même si cela cassait des fonctionnalités pendant un certain temps. La vidéo m'a donc montré une méthodologie que je peux mettre en place pour refactoriser mon code, qui commence 
par la réalisation des tests (si pas déjà présents), écrire une première version de notre code et le refactoriser (red -> green -> refactor).

Pour réaliser ça, j'ai vu des méthodes de refactorisation comme l'encapsulation, qui consiste à mettre le code que nous voulons refactoriser dans une méthode spécifique (on le coince d'un côté). 
Une autre méthode serait de dupliquer temporairement la donnée (dans une variable par exemple) pour faire une transition et garder nos tests au vert. 
Une autre méthode serait d'utiliser, pourquoi pas, un design pattern (dans la vidéo, le design pattern State avait été utilisé). Enfin, il faut à chaque fois simplifier son code le plus possible.


### Poursuite du chess

Pour ce qui est du projet chess, j'ai réimplémenté moveTo sans utiliser becomeForward: cette fois-ci, comme visible ici :


```bash
    super moveTo: aSquare.
	newPawn := MyPawn new.
	newPawn square: aSquare.
	newPawn color: color.
	
	aSquare contents: newPawn.
```

J'en ai également profité pour corriger un bug que j'avais, qui était que lorsque je cliquais deux fois sur un même pion en début de partie (de type MyInitPawn donc), je n'avais plus la possibilité de faire un mouvement de deux cases. 
Le souci était qu'en cliquant une première fois, on sélectionne notre pion, et lors du 2ᵉ clic, on fait déplacer le pion sur sa propre case. 
Pour corriger cela, j'ai juste vérifié quand on clique si cette case est un coup légal ou pas, comme on peut le voir ici :

```bash
legalMove:= selection contents legalTargetSquares includes: aMyChessSquare.
		legalMove ifTrue:  [  
			board game move: selection contents to: aMyChessSquare].
		].
```

Enfin, j'ai ajouté la possibilité de manger une pièce en diagonale pour un pion.

```bash
diagonal := (self isWhite
		   ifTrue: [ { square up left. square up right } ]
		   ifFalse: [ { square down left. square down right } ]) select: [ :s |
		  s isValid and: [
			  s hasPiece and: [ 
				 s contents color ~= color ] ] ].
	
```
