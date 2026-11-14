# Rapport - Semaine 3

## Théo Mortreux

### Ce que j'ai fait
- J'ai commencé à mettre en place le pattern Null Object pour éviter tous ces `nil` qui faisaient tout planter dans le code des échecs.
- Création de la classe `MyEmptyPiece` qui hérite de `MyPiece` dans le package `Myg-Chess-Core`.
- Ajout des méthodes de base dedans (`isEmpty` qui renvoie `true`, `isOccupied` à `false`), et l'inverse dans `MyPiece`.
- J'ai aussi rajouté un petit ID neutre (`-`) pour pas que ça plante si on affiche une case vide.

### Mes difficultés
- J'ai un peu pris du temps à comprendre comment imbriquer proprement la classe vide dans l'héritage existant sans tout casser.

### Ce que j'en retiens
- C'est beaucoup plus propre de manipuler un objet "vide" plutôt que de checker des `nil` partout dans le code.
