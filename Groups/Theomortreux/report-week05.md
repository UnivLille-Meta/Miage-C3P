# Rapport - Semaine 5

## Théo Mortreux

### Ce que j'ai fait
- Gros morceau cette semaine : j'ai refait toute la gestion des états (`MySelectedState` et `MyUnselectedState`) pour qu'elles utilisent les nouvelles méthodes d'état.
- J'ai aussi nettoyé le code des déplacements de la tour (`MyRook`) et du fou (`MyBishop`) pour qu'ils gèrent les cases vides via l'objet vide.
- Adaptation du pion (`MyPawn`) et création d'une petite méthode pratique `hasPiece` dans `MyPiece` pour simplifier les vérifications.

### Mes difficultés
- Gérer les collections de cases cibles en diagonal et en ligne sans oublier de filtrer les objets vides, ça m'a pris un peu de temps de debug.

### Ce que j'en retiens
- Le moteur commence vraiment à être cohérent, tout repose sur les objets et plus sur des `nil` cachés.
