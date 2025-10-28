# Olivia
## Chess project
Working on kata "Restrict legal move", switch to kata "refactor piece rendering". Haven't implement double dispatch or table dispatch yet, that's why the pieces are not in the right color in the game.
I have deleted the piece mapping with the squares for now. But I can find the piece mapping here to implement the double dispatch [link to open chess font](https://github.com/joshwalters/open-chess-font)

## Study
Reverse Engineering, A double dispatch starter: Stone Paper Scissors

# Julien 
## Chess project
J'ai choisi le kata "Remove nil checks", après étude du code notamment dans la classe MyChessSquare et MyPiece certaines méthodes avait bien des vérifications pour vérifier qu'une case n'était pas vide avec "ifNil". Pour éviter cela j'ai réfléchi a deux solutions : 
  - 1er solution : Création d'une pièce "fictive" avec une sous classe de piece MyNilPiece
  - 2ème solution : Création de sous classes de MyChessSquare avec une classe SquareEmpty et SquareWithaPiece

Je suis donc parti sur la première solution qui me parassait plus logique dans la gestion du jeu actuel.

J'ai lu cet article qui expliquer les avantages de faire un NullObject : https://refactoring.guru/fr/introduce-null-object

Pour résumer les étapes que j'ai fait actuellement 
  - Création d'une classe MyNilPiece
    - Méthode isPiece(Héritage)
    - Méthode renderPieceOn:
  -  Refactoring des méthode dont on retrouve "contents: nil" par "contents: MyNilPiece new"
  -  Refacto de la méthode hasPiece de la classe MyChessSquare
  -  Création de tests
  -  Initialize de MyChessSquare, on associe directement a content un objet MyNilPiece

Pour la suite je sais que je dois vérifier un cas similaire notamment lorsque les pièces essayent d'aller hors du plateau, je l'ai notamment vu dans les méthodes de MyPiece avec collectSquares:legal ou bien downLeftDiagonalLegal: on remarque encore un cas de ifNil/ifNotNil. De plus je devrais ajouter des tests pour completer le coverage

## Relecture
J'ai relu Reverse Engineering

# Lan
## Chess project
- Kata: "Add pawn promotion"
- My first work is to read the architecture, and determine which part needs to fix. There are two behaviors for the promotion, the 1st is that users have to choose the piece itself, the 2nd is that the bot will choose automatically for the users. My idea is to user Template Method Pattern for the promotion and 2 behaviors will be subclasses. 
- I have created 1 class **MyPrmotionPawn** with the method **promotePawn:** and 2 subclasses inherit that: **MyBotPromotion** (automatically return Queen) and **MyUIPromtion**. I still work on the second subclass and the test class so I haven't pushed my code yet.
# Study 
- Hook and Template, Pharo 9 by Example, The Spec UI framework

