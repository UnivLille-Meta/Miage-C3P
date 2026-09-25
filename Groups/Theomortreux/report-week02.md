# Rapport Semaine 2 - Théo Mortreux

## Ce qui a été fait
- Chargement de Chess dans Pharo 12 via Metacello.
- Premier refactoring en Double Dispatch validé sur le Fou (`MyBishop`).
- Tests unitaires lancés avec succès via Calypso (13/13 au vert).
- Création du fork perso Chess et ajout du lien dans `members.md` sur le dépôt C3P.

## Galères rencontrées
- Erreurs de scope/variables dans le Playground de Pharo 12 -> résolu en passant directement par Calypso pour les tests.

## Objectifs Semaine 3
- Continuer le Double Dispatch sur les autres pièces (`MyRook`, `MyKnight`, etc.).
- Nettoyer les nil checks dans le code.
