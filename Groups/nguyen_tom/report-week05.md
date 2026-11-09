# Rapport hebdomadaire semaine 5

### Ce que j'ai fait
J'ai revu les slides de M9-1 (Coupling and encapsulation) et M4-5 (Singleton: a highly misunderstood pattern) de la semaine dernière, pour mieux comprendre la loi de Déméter et pourquoi on évite les singletons. J'ai ensuite continué à m'approprier le code du projet Chess en faisant deux katas : "Remove nil checks" puis "Fix pawn moves" (avec la prise en passant). J'ai écrit des tests avant de modifier le code pour être sûr de ne rien casser (53 tests au total à la fin de la semaine, tous verts).

### Ce que j'ai appris
- La loi de Déméter dit qu'un objet ne doit envoyer des messages qu'à des objets proches : self/super, ses variables d'instance, ses arguments et les objets qu'il crée lui-même. Quand on écrit des chaînes du genre `a b c d`, on dépend de la structure interne de plein d'objets, donc le couplage est fort. C'est une heuristique, pas une règle absolue.
- Pour la corriger, on déplace le comportement dans l'objet qui possède l'information (principe "Don't ask, tell") au lieu de lui demander ses données pour décider à sa place.
- Le Singleton est souvent utilisé comme une variable globale déguisée. Passer ce dont on a besoin en paramètre garde un couplage faible et rend le code plus testable.
- Kata "Fix pawn moves" : le pion avançait d'une seule case, mangeait tout droit et jamais en diagonale. J'ai écrit les tests qui montrent ces bugs (13 tests rouges), puis corrigé `MyPawn` : une ou deux cases depuis la case de départ (sans sauter de pièce), capture seulement en diagonale. Un pion menace aussi ses diagonales même vides (`attackingSquares`), sinon le roi pourrait aller dessus.
- Prise en passant : il faut mémoriser la case sautée par le double pas adverse, valable seulement au coup suivant. Je la stocke dans le plateau (`enPassantSquare`), mise à jour dans `moveTo:` via un hook, et un autre hook (`captureOn:`) retire le pion capturé, qui n'est pas sur la case d'arrivée.
- Kata "Remove nil checks" : dans Chess, `nil` représentait à la fois une case vide et une case hors du plateau, d'où plein de `isNil`, `notNil` et `ifNotNil:` partout. Le pattern Null Object remplace `nil` par un vrai objet qui répond aux mêmes messages : j'ai créé `MyNilPiece` (case vide) et `MyNilSquare` (case hors plateau, qui répond `self` à `up`, `down`, `left`, `right`). Attention : un `MyNilSquare` n'est pas `nil`, donc les `notNil` deviennent `isOnBoard`. Grâce au polymorphisme, on n'a plus besoin de tester, c'est l'objet qui sait quoi faire.
- Avec le Null Object, on peut supprimer des conditionnels, le code devient plus lisible et plus facile à tester.
- Écrire un test avant de refactorer permet de figer le comportement existant, notamment pour les cas limites aux bords de l'échiquier.

### Difficultés
- Trouver où stocker la case de la prise en passant (le plateau, la partie ou la pièce) : j'ai choisi le plateau car les pièces connaissent leur plateau mais pas la partie.
- Ne pas oublier de filtrer les cases vides quand on parcourt les pièces du plateau (`pieces` filtre avec `isPiece`).
- Avec le Null Object, cliquer sur une case vide puis sur une autre enregistrait un faux coup dans l'historique : j'ai ajouté `canMoveTo:` et le jeu n'enregistre plus que les coups légaux.
