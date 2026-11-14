# Rapport - Semaine 4

## Théo Mortreux

### Ce que j'ai fait
- J'ai continué le grand nettoyage en passant sur les pièces pour enlever les vieux tests de `nil`.
- Modification de `MyPlayer` pour utiliser `isOccupied` au lieu de `p notNil` quand il récupère les pièces.
- Pareil dans `MyKing` et `MyKnight` : j'ai réécrit la façon dont ils trouvent leurs cibles et détectent les ennemis pour que ça utilise le polymorphisme.

### Mes difficultés
- Les conditions dans `MyKnight` étaient un peu relous à adapter, il a fallu faire gaffe à pas inverser les tests.

### Ce que j'en retiens
- Le code devient plus lisible, même si y a pas mal de classes à modifier une par une.
