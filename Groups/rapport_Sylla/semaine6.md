## Ce que j'ai fait cette semaine 
Pour cette semaine, j’ai consacré une partie de mon temps à la préparation de l’examen et à la finalisation du projet d'échecs


### Réalisations techniques sur le projet Chess
1. Kata Null Object (MyPieceEmpty) :

Introduction de MyPieceEmpty pour représenter polymorphiquement les cases vides
Élimination des vérifications conditionnelles ifNil:

2. Déplacements & Captures :

Implémentation du double pas initial pour MyPawn.
Validation des déplacements de MyQueen.

3. Refactoring (Double Dispatch & Élimination de duplication)

Suppression des méthodes de rendu dupliquées dans MyChessSquare (renderKnight:, renderBishop:, etc.).
Factorisation de renderPieceOn: au niveau de MyPiece.

Voici le lien vers mon dépot: https://github.com/rokhysylla/Chess/tree/main/src