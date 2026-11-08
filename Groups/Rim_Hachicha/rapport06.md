### Remove nil check (pour les cases off board)

Après avoir remplacé nil par un objet représentant une case vide, j’ai poursuivi la mise en place du polymorphisme pour la gestion des positions hors de l’échiquier.
La gestion de ces positions se trouve notamment dans la méthode + aPoint de MyChessSquare. Une case hors board est représentée par nil.

# Objectif
L’objectif est de remplacer nil par un objet représentant une position hors de l’échiquier : MyOffBoardSquare.
Cette modification vise à poursuivre la suppression des vérifications de nil en utilisant le polymorphisme, tout en conservant le comportement attendu des déplacements des pièces.

# Ce que j'ai fait : 
- Comme dans la première partie, j’ai utilisé le TDD. J’ai commencé par créer des tests pour la classe MyOffBoardSquare, puis j’ai implémenté cette classe.

- J’ai ensuite modifié la méthode + aPoint de MyChessSquare pour qu’elle renvoie un objet MyOffBoardSquare lorsque la position demandée se trouve hors de l’échiquier, plutôt que de renvoyer nil.

- J’ai également modifié la méthode adjacentSquares de MyPawn pour retirer les positions pour lesquelles isOffBoard renvoie true. Pour cela, j’ai utilisé reject: afin de filtrer les positions hors de l’échiquier.

- Après ces modifications, certains tests des pièces Bishop, King et Rook ne passaient plus. Ces échecs étaient liés au fait que certaines méthodes utilisaient encore des vérifications de nil, alors que les positions hors de l’échiquier étaient désormais représentées par des objets MyOffBoardSquare.

- J’ai donc ajouté la gestion de isOffBoard dans les méthodes collectSquares:legal: et collectSquares:while: de MyPiece, pour prendre en compte les nouvelles positions hors de l’échiquier lors du calcul des déplacements.

- Enfin, j’ai réimplémenté les méthodes up, down, left et right dans MyOffBoardSquare. Ces méthodes permettent de conserver le comportement attendu lorsqu’un calcul de déplacement atteint une position hors de l’échiquier. J’ai notamment adapté le calcul des diagonales, avec des modifications de upLeftDiagonalLegal: et d’autres méthodes de déplacement concernées.

# Conclusion
Cette deuxième partie poursuit la suppression des vérifications de nil en introduisant MyOffBoardSquare pour représenter les positions hors de l’échiquier.
L’utilisation du polymorphisme permet de distinguer les cases du plateau des positions situées à l’extérieur. J’ai modifié les méthodes de calcul des déplacements pour préserver le comportement des pièces malgré ce changement de représentation.
Cette étape est la suite de la première partie qui concerne MyEmptyPiece : les cases vides et les positions hors de l’échiquier disposent maintenant d’une représentation objet.

Lien Git chess : https://github.com/Rim-hachicha/Chess 

