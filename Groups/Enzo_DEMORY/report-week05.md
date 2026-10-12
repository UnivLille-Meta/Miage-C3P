## Semaine 5 :

### Description générale :

Cette semaine, je me suis essentiellement concentré sur Chess. J'ai terminé le kata "Fix pawn moves!" en implémentant
la prise en passant, ce qui m'a demandé de mémoriser le dernier coup joué. J'ai aussi fait le kata "Remove nil checks".


#### Chess:

#### Le kata "Fix Pawn Moves !"

##### La prise en passant:

Pour la prise en passant, il faut savoir si le coup précédent était un pion qui avançait de deux cases. J'ai donc créé
une classe `MyPieceMovement` (constituée de la pièce qui fait le mouvement, de sa case de départ et de sa case d'arrivée)
qui sait reconnaître si le pion a avancé de deux cases (`isPawnDoubleStep`) et donner la case "passée" (`passedSquare`).
Pour reconnaître l'avance de deux cases, je compare la case d'arrivée à la case qui est deux cases devant la case de départ
pour ce pion (et pas la rangée d'arrivée, car un pion peut arriver sur la rangée 4 en avançant deux fois d'une case).

J'ai hésité sur l'endroit où stocker ce dernier mouvement. `MyChessGame` a une liste `moves`, mais ce sont des chaînes
de caractères affichées à l'écran, et elles sont écrites même pour un coup illégal (l'interface appelle `move:to:` pour
n'importe quelle case cliquée, et c'est `moveTo:` qui refuse le coup). En plus, les pièces connaissent le plateau mais
pas la partie, et mes tests utilisent un plateau vide sans partie. J'ai donc choisi de stocker `lastMovement` dans
`MyChessBoard`.

Ensuite, la méthode liste les coups d'en passant possibles et les ajoute à `targetSquaresLegal:` du pion.

Enfin, pour retirer le pion capturé en passant, j'ai utilisé une méthode `afterMovingTo:previousMovement:`, qui ne fait
rien par défaut et qui est appelée après chaque mouvement. `MyPawn` la redéfinit pour demander au mouvement précédent de
retirer le pion capturé si le mouvement est une prise en passant, et `MyNilMovement` ne fait rien. L'avantage est que le
retrait n'a lieu qu'après la vérification de légalité (donc jamais exécuté pour un coup refusé) et que les autres pièces
n'ont pas à s'en occuper.

##### Les Movements:

Le plateau ne doit jamais avoir un `lastMovement` à `nil`. J'ai donc créé une classe abstraite `MyMovement` et deux
sous-classes, `MyPieceMovement` (le vrai mouvement) et `MyNilMovement` (un mouvement qui ne fait rien). Le plateau est
initialisé avec un `MyNilMovement`, donc aucun `isNil` n'est nécessaire. Au début, j'avais fait hériter `MyNilMovement`
de la classe concrète, mais il héritait alors de variables et de méthodes qui plantent sur `nil`.


#### Chess, le kata "Remove nil checks"

Dans le jeu, il y avait deux sortes de `nil`. Une case sans pièce avait `nil` comme contenu, et une case qui sort du
plateau (quand on demande `up`, `left`, `right` ou `down` à une case du bord) renvoyait aussi `nil`. Je me suis d'abord
occupé de la case vide, puis des cases hors du plateau.

##### Les cases vides

J'ai créé `MyNilPiece`, qui hérite de `MyPiece`. J'avais pensé à ajouter une classe abstraite au-dessus de `MyPiece`, mais
`MyPiece` n'est jamais instanciée directement (`targetSquaresLegal:` fait un `subclassResponsibility`), donc
`MyNilPiece` se retrouve simplement à côté des pièces concrètes.

Ensuite j'ai initialiser les MyChessSquare vide avec un MyNilPiece. `initializeSquares` et `emptyContents` mettent un
`MyNilPiece`; `hasPiece` demande `contents isPiece` et `contents:` n'a plus de `ifNil:` puisque chaque contenu sait se
rendre (`renderPieceOn:`).

En testant le jeu à la main, j'ai vu qu'un clic sur une case vide puis sur une autre ajoutait un faux coup dans la liste
, car `move:to:` enregistrait le coup même, si il n'avait pas eu lieu. J'ai ajouté `canMoveTo:` aux pièces (toujours
`false` pour `MyNilPiece`) et `move:to:` ne fait plus rien si le coup est impossible.

Dans MyChessBoard `pieces` renvoyait aussi les `MyNilPiece` (leur couleur est `nil`, donc la comparaison de couleurs les
écartait par hasard). Je l'ai trouvé en me demandant d'où venaient les `nil` que `MyKing` et `MyPlayer`filtraient. J'ai
écrit un test et filtré avec `isPiece`, ce qui a permis de retirer ces `notNil`.

##### La case hors plateau

Dans MyChessSquare `+` renvoyait `nil` hors du plateau, d'où les `ifNotNil: #left` en chaîne et les `s notNil and:` dans
presque toutes les pièces. J'ai créé `MyNilSquare`, qui répond `self` à `up`, `down`, `left` et `right` (une case hors
plateau reste hors plateau), `false` à `hasPiece` et `isOnBoard` (où `MyChessSquare` répond `true`). Il hérite d'`Object` et
pas de `MyChessSquare` : comme elle hérite de `BlElement`, il aurait fallu lui retirer ou ignorer beaucoup de variables
et de méthodes qui ne la concernent pas.

Avant de modifier le code, j'ai écrit des tests pour des pièces dans un coin (le roi, la tour et le fou) pour figer le
comportement aux bords. Chaque `notNil` sur une case est devenu `isOnBoard`, puisque `MyNilSquare` n'est pas `nil`. Les
chaînes `ifNotNil:` ont ensuite pu s'écrire directement (`square up right`), ce qui rend le cavalier bien plus lisible.


### Conclusion / Difficultés :

Je n'ai pas eu de réelles difficultés cette semaine. J'essaie de travailler un peu plus rapidement et d'être un peu
moins indécis. Je suis quand même assez content de ce que j'ai produit cette semaine, et je commence à bien plus me
familiariser avec la syntaxe de Pharo et le logiciel, qui sont vraiment pratiques quand on veut par exemple faire du
refactoring.