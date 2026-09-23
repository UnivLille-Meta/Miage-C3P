# intro


# exercice

afin de mieux prendre en main ceci, j'ai commencé l'exercice du jeu d'echec, disponible sur le github du cours. Il s'agit d'un projet de jeu d'echec relativement disfonctionnel. Il nous faut le tester, le débuger et le refactorer (du moins en partie). 

Pour commencer, j'ai décidé de me concentrer sur le comportement du pion, car il n'a pas encore de tests contrairement aux autres pieces. Comme j'ai encore des difficultés avec la syntaxe de Pharo, je peux m'inspirer de tests déjà existant et les adapter au comportement du pion.

J'ai tout d'abord commencer à tester les deplacements de départ du pion. 

```
testStartMovesTwoSquare

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	
	squares := pawn targetSquares.
	self
		assertCollection: squares 
		includesAll: 
			(#( e3 e4 ) collect: [ :name | board at: name ])
```

le test ne passe pas, car le jeu ne permet pas le déplacement de 2 cases d'un pion sur son point de départ.
Il faut donc modifier la méthode targetSquaresLegal pour permettre cela

```
targetSquaresLegal: aBoolean

	| oneStep twoStep |
	oneStep := self isWhite
		ifTrue: [ square up ]
		ifFalse: [ square down ].

	twoStep := self isWhite
		ifTrue: [ oneStep ifNotNil: [ oneStep up ] ]
		ifFalse: [ oneStep ifNotNil: [ oneStep down ] ].

	^ {
		oneStep.
		((isMove isNil or: [ isMove = false ])
			and: [ oneStep notNil
			and: [ oneStep hasPiece not
			and: [ twoStep notNil
			and: [ twoStep hasPiece not ] ] ]])
			ifTrue: [ twoStep ]
			ifFalse: [ nil ]
		}
		select: [ :s | s notNil and: [ s hasPiece not ] ]
```

J'en ai profité pour ajouter une vérification sur la pièce présente devant, auquel cas le déplacement est impossible.

il faut donc tester le cas où une piece noir se trouve devant la piece blanche :

```
testStartMovesWithOponentObstacle

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	
	board at: 'e4' put: MyPawn black.
	
	squares := pawn targetSquares.
	self
		assertCollection: squares 
		includesAll: 
			(#( e3 ) collect: [ :name | board at: name ])
```

Suite à cela, j'ai essayé d'ajouter la prise en passant, mais ça n'a mené à rien et j'ai simplement perdu du temps.


J'ai eu pas mal de problème et j'ai encore du mal à coder en Pharo et à apprécier le langage. Je dois encore m'appuyer sur du code existant pour avoir un référenciel. à côté de ça, j'ai eu plusieurs problèmes avec des crashs à répétition de Pharo, ce qui n'a vraiment pas aidé. J'ai pas vraiment l'impression d'avancer et ça m'énerve.