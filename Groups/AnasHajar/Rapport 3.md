# Rapport week 3 Hajar

## Ce que j'ai fait
- **Exercice Chess (Échecs)** :
  - Choix de la pièce : prise en charge et correction du comportement du pion (`MyPawn`).
  - Correction du déplacement : gestion du blocage en cas d'obstacle devant le pion.
  - Implémentation de la capture diagonale des pièces adverses via `targetSquaresLegal:`.
  - Écriture des tests unitaires associés dans `MyPawnTest` pour valider les règles en TDD.
- **Vidéos & Cours** :
  - Visionnage des vidéos demandées pour cette semaine.

## Ce que je n'ai pas encore fait (et pourquoi)
- **Déclic / Assimilation complète du cours** :
  - Même si j'ai regardé les vidéos, je n'ai pas encore eu le déclic (*« aha moment »*).
  - Je dois revoir les vidéos et relire les slides pour bien intégrer la mécanique de lookup entre `self` et `super` dans des scénarios plus complexes.

## Difficultés rencontrées & Solutions
- **Déplacement en diagonale du pion** :
  - *Problème* : tentative d'appeler directement des messages inexistants sur la case (`upLeft`, etc.), ce qui levait des erreurs.
  - *Solution* : composition des déplacements verticaux et horizontaux (`square up left`) avec vérification des bords (`nil`).
- **Confusion de dépôt Git** :
  - *Problème* : tentative initiale de commiter le travail directement sur le dépôt source plutôt que sur mon fork personnel.
  - *Solution* : vérification de la configuration du remote dans Iceberg pour pointer vers mon propre dépôt avant d'effectuer les commits et pushs.



# 🔗 Rapport Week 3 Anas

## What I did

* **Lecture Preparation** : Lecture et assimilation des supports de cours de la semaine.
* **Exercice Chess (Null Object Pattern)** : J'ai réalisé les deux premières étapes : la création de la classe `MyEmptyPiece` (héritant de `MyPiece`) et la mise en place du dispatch polymorphique en définissant les comportements par défaut (`isEmpty`, `isPiece`). J'ai très bien compris l'utilité du pattern Null Object, qui permet d'éviter les vérifications constantes de type `isNil` et d'optimiser les ressources.

## What I did not

* **Finalisation de l'exercice Chess** : Je n'ai pas pu terminer les étapes 3 et 4 du refactoring, à savoir la mise à jour de l'initialisation du plateau pour remplacer les `nil` par `MyEmptyPiece new`, et l'éradication des conditions explicites dans `MyChessSquare`.
* **Travail du week-end** : Mon week-end a été complètement perdu. Je n'ai pas pu avancer sur le reste du travail prévu à cause de mon état de santé.

## Difficulties & Solutions

* **Problème de santé** : J'ai attrapé la grippe, ce qui m'a forcé à stopper brutalement tout travail ce week-end. Je suis actuellement tout juste en train de m'en remettre et je fonctionne au ralenti. **Solution** : Ma priorité immédiate est de me reposer pour guérir complètement. Je prévois de redoubler d'efforts dès ce week-end prochain pour rattraper mon retard sur le projet d'échecs une fois que je serai de nouveau en forme.
