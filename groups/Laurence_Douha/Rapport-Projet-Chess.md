# Rapport Laurence-Douha : Projet Chess 
### Lien vers le depot : 
[lien vers le depot](https://github.com/Douha-Ag/Chess)
### Installation : 
Metacello new
	repository: 'github://Douha-Ag/Chess:main';
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.

### Amélioration choisie 
Nous avons choisi de faire l'amélioration : "Restrict Legal Moves".
Dans le cas où le roi est en danger, les déplacements légales des pièces vont être différents par rapport au cas normal du jeu, ces pièces pourront attaquer un adversaire mettant le roi en danger ou bien bloquer son chemin afin de sauver le roi, mais aussi le roi peut se déplacer pour se sauver.

### Conception 
En faisant du reverse engeenering, nous avons commencé à décortiquer le projet, l'organisation des packages, des classes, des méthodes.
Après analyse, nous avons décidé de garder la même logique du projet qui gère uniquement le cas où le roi n'est pas en danger, et d'en inspirer pour gérer le nouveau cas pour sauver le roi.
Nous avons suivi la logique suivante:
- connaitre qui et où est le roi
- détecter quand le roi est en danger.
- détecter les adversaires mettant le roi en danger.
- détecter les pièces qui peuvent le sauver.
- définir les déplacements légaux pour chaque pièce (Queen, Knight, Pawn,Bishop,King,Rook) lorsque le roi est en danger.

### Travailréalisé 
##### legalTargetSquaresInCheck / targetSquaresLegalInCheck
En s'inspirant de la logique du projet et aussi des méthodes legalTargetSquares et targetSquaresLegal, nous avons créé les méthodes legalTargetSquaresInCheck et targetSquaresLegalInCheck pour gérer le cas où le roi est en danger.
targetSquaresLegalInCheck : est une méthode abstraite qui est défini dans la classe MyPiece, ensuite dans chaque classe fille (MyQueen, MyKnight, MyPawn,MyBishop,MyKing,MyRook) filtrera les déplacements qui sauvent le roi.
##### threateningPieces
Cette méthode est utilisé pour récupérer les pièces mettant le roi en danger et leurs cases sous forme d'une collection de paire, cela permettra aux autre pièces de connaitre l'emplacement qui peuvent attaquer ou bloquer le chemin pour le roi.
##### ownKing
permet à une pièce de connaître qui est son roi (même couleur que lui) afin de le défendre. La pièce pourra avoir accès à sa position grâce à la méthodes squares qui était déjà existantes.
 
##### squaresBetween:and:
permet de retourner une collection de squares entre deux squares. Elle servira à récupérer les squares entre le roi et son attaquant (la pièce qui le met en échec).
 
##### canBlockThreatFrom:to:on:
permet de savoir si une pièce peut bloquer une attaque venant du square d'un attaquant du roi(from:) au square où est situé le roi(to:) à partir de son square à elle (on:) en se plaçant entre les 2 pièces
 
##### diagonalCaptureSquares
permet de retourner une collection de squares possibles de capture diagonale du pion à partir de son square actuel.
Elle sert principalement aux pièces qui peuvent capturer en diagonale (MyPawn, MyBishop, MyQueen)
 
##### piecesThatCanSaveKing
permet de retourner une collection des pièces qui peuvent sauver le roi depuis leur position lorsqu'il est en échec.

#### Concepts appliqués
- TDD : nous avons suivi le principe du TDD vu en cours pour impléménter les méthodes.
- Template method : C'est ce que nous avons appliquer lors de la définition de la méthode targetSquaresLegalInCheck.

### Difficultés 
- Au début, nous avons pris beaucoup de tempspour comprendre le code déjà existant, les méthodes, le fonctionnement du jeu, nous avons également eu des difficultés concernant les push/pull sur Github, d'ailleurs les commits ont été finalement fait à partir d'un seul compte après avoir récupérer le code de l'autre.






