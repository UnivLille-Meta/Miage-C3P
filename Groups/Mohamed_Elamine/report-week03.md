# report-week03.md

repo to see the code: https://github.com/amiineee863/PharoStuff

# intro

Aujourd'hui j'ai fait le kata "Remove nil checks" sur le projet d'échecs.

# exercice

Le code représentait une case vide par `nil` dans `contents`, ce qui obligeait plein d'endroits à faire des checks `notNil`/`ifNil:` (surtout `MyPlayer>>pieces`, avec `p notNil and: [...]`).

J'ai créé une classe `MyNullPiece` (sous-classe de `MyPiece`) qui répond `true` à un nouveau message `isEmpty` (les vraies pièces répondent `false`). J'ai remplacé tous les `nil` par une instance de `MyNullPiece`, et j'ai réécrit les méthodes concernées pour utiliser `isEmpty` au lieu de tester `nil` : `hasPiece`, le rendu dans `contents:`, et `MyPlayer>>pieces`.

J'ai ajouté deux tests (`MyNullPieceTests`) qui vérifient qu'une case vide a `hasPiece` à `false` et `isEmpty` à `true`, et l'inverse pour une case occupée. Les deux passent.

Claude m'a aidé à repérer tous les endroits où `nil` était utilisé (j'aurais raté `MyPlayer>>pieces` sinon) et à vérifier que mon design tenait la route, mais j'ai écrit et testé le code

Pas encore fait : il reste un autre `nil` dans le code (les cases hors plateau), pas traité aujourd'hui.
