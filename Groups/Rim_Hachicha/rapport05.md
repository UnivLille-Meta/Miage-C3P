## Remove nil checks

- J’ai remarqué que initializeSquares de MyChessBoard initialise les cases, dedans on a content: .qui représente les cases vides par nil.

- La méthode pieces renvoie les pièces et les contenus des cases vides, qui sont représentés par nil dans l’implémentation actuelle.

- Dans MyChessSquare, la méthode contents: aPiece sert à attribuer un contenu à une case et l’afficher. Si la case est nil elle affiche un caractère en fonction de sa couleur. 

# L’objectif est de remplacer nil par un objet représentant une case vide : MyEmptyPiece

- Pour cela j’ai utilisé du TDD pour exprimer le nouveau comportement attendu.
J’ai commencé par écrire le test testEmptySquareDoesNotContainNil. Le test échouait initialement avec une erreur d’assertion.

- J’ai ensuite créé la classe MyEmptyPiece, qui hérite de MyPiece. J’ai redéfini la méthode renderPieceOn: afin que l’objet représentant une case vide affiche un caractère en fonction de la couleur de la case, comme dans le comportement précédent de MyChessSquare.

- Puisque MyEmptyPiece hérite de MyPiece, je voulais vérifier qu’elle soit bien considérée comme une case vide et non comme une pièce classique. Pour cela, j’ai créé un test vérifiant que MyEmptyPiece est considérée comme vide.
J’ai ajouté la méthode isEmpty dans MyPiece, qui retourne false, puis je l’ai redéfinie dans MyEmptyPiece pour qu’elle retourne true.

- J’ai ensuite utilisé isEmpty dans la méthode hasPiece de MyChessSquare afin de supprimer la vérification de nil. Le résultat de isEmpty dépend donc de la classe de l’objet, ce qui permet d’utiliser le polymorphisme.
J’ai également modifié les méthodes liées aux déplacements des pièces, notamment celles utilisant targetSquares, pour prendre en compte cette nouvelle représentation des cases vides.

- Enfin, j’ai modifié l’initialisation des cases afin qu’elles contiennent un objet MyEmptyPiece plutôt que nil. Cette modification a permis de faire passer le test testEmptySquareDoesNotContainNil.

# Conclusion
Cette première partie a permis de remplacer la représentation des cases vides par nil par un objet dédié, MyEmptyPiece.

L’utilisation du polymorphisme avec isEmpty permet de réduire les vérifications conditionnelles et de rendre le code plus cohérent avec une approche orientée objet.

Dans la deuxième partie, je poursuis cette démarche en appliquant le même principe aux positions situées hors de l’échiquier.
